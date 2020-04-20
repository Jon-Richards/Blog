class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(
      params.require(:article)
        .permit(
          :title, :description, :text
        )
    )

    @article.save
    redirect_to @article
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
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

    redirect_to articles_path
  end

  def article_params
    params.require(:article).permit(:title, :description, :text)
  end
end
