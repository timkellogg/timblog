class ArticlesController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]

	def index
		if params[:tag]
			@articles = Article.tagged_with(params[:tag]).order('created_at DESC').paginate(page: params[:page], per_page: 3)
		else 
			@articles = Article.order('created_at DESC').paginate(page: params[:page], per_page: 3)
		end
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
			redirect_to @article 
		else 
			render 'new'
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article 
		else 
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy 
		redirect_to root_url 
	end

	private

		def article_params 
			params.require(:article).permit(:title, :body, :img_url, :tag_list, :css_class, :published)
		end
end
