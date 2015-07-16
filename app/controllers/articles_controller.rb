class ArticlesController < ApplicationController
 before_filter :authenticate_user!, except: [:index, :show]

	def index
		@articles = Article.paginate(page: params[:page], per_page: 3).order('created_at DESC') 
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
			params.require(:article).permit(:title, :body, :img_url)
		end
end
