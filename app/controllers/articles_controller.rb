class ArticlesController < ApplicationController
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
		@article = Article.find(params[:id])
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
			flash[:alert] = "The article couldn't be saved!"
			render 'new'
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			flash[:success] = "The article was succesfully updated!"
			redirect_to @article 
		else 
			flash[:alert] = "The article wasn't updated!"
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		if @article.destroy 
			flash[:suceess] = "The article was successfully deleted!"
			redirect_to root_url 
		else
			flash[:alert] = "The article couldn't be deleted."
			render 'show' 
		end		
	end

	private

		def article_params 
			params.require(:article).permit(:title, :body, :img_url, :tag_list, :css_class, :published)
		end
end
