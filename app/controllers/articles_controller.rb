class ArticlesController < ApplicationController

  def index
    @articles = Article.all
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
      redirect_to article_path(@article)
    else
      flash[:error] = "Your article could not be saved. 
                       Please fill out the proper fields 
                       and try again."
      redirect_to new_article_path
    end

  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(article_params)
      redirect_to @article
    else
      flash[:error] = "Your article could not be updated.
                       Please fill out the proper fields
                       and try again."
      redirect_to edit_article_path(@article)
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

    def article_params
      params.require(:article).permit(:head, :subhead, :body, :section_id)
    end 

end
