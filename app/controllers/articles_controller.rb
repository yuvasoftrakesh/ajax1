class ArticlesController < ApplicationController
  def index
  	@articles = Article.all
  end

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)
      respond_to do |format|
      if @article.save
        format.js
      redirect_to root_path
   else
    respond_to do |format|
       format.js
       format.html{render :new}
   end
   end
   end
 end

  def show
  	@article = Article.find(params[:id])
  end

  def edit
  	@article = Article.find(params[:id])
  end

  def update
  	@article = Article.find(params[:id])
  	 respond_to do |format| 
  	if@article.update(article_params)
  		format.js
      format.html
  		redirect_to root_path
  	else
  		respond_to do |format| 
  		 format.js
       format.html
  		render :new
  	    end
  	   end
  	end
  end

  def destroy
  	@article = Article.find(params[:id])
  	@article.destroy
  	redirect_to root_path
  end
end


private

 def article_params
 	params.permit(:title,:description)
 end