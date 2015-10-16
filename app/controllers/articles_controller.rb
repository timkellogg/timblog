class ArticlesController < ApplicationController
 before_action :set_article,        only:   [:show, :edit, :update, :destroy ]
 before_filter :authenticate_user!, except: [:index, :show]

	def index
		if params[:tag]
			@articles = Article.tagged_with(params[:tag]).order('created_at DESC').paginate(page: params[:page], per_page: 3)
		else 
			@articles = Article.order('created_at DESC').paginate(page: params[:page], per_page: 3).where(published: true)
		end
	end

	def unpublished_articles 
		@articles = Article.order('created_at DESC').paginate(page: params[:page], per_page: 3).where(published: false)
	end

	def show 
	end

	def new
		@article = Article.new 
	end

	def create
		@article = Article.new(article_params)
		if @article.save 
			flash[:success] = "Article was created!"
			redirect_to @article 
		else 
			render 'new'
		end
	end

	def edit
	end

	def update

		if @article.update(article_params)
			flash[:success] = "The article was succesfully updated!"
			redirect_to @article 
		else 
			render 'edit'
		end
	end

	def destroy

		if @article.destroy 
			flash[:suceess] = "The article was successfully deleted!"
			redirect_to root_url 
		else
			render 'show' 
		end		
	end

	private

		def set_article 
			@article = Article.find(params[:id])
		end

		def article_params 
			params.require(:article).permit(:title, :body, :img_url, :tag_list, :css_class, :published)
		end
end
