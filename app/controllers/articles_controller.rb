class ArticlesController < ApplicationController
  def create
    @feed = Feed.find(params[:feed_id])
    @article = @feed.articles.create(article_param)
    render json: @article
  end

  def show
    @article= Article.find(params[:id])
    respond_to do |format|
      format.json { render json: @article }
      format.xml { render xml: @article }
    end
  end

  def index
    @articles = Article.all
    respond_to do |format|
      format.json { render json: @articles }
      format.xml { render xml: @articles }
    end
  end

  def destroy
    @article = Article.find(params[:id]).destroy
    render nothing: true
  end

  private
  def article_param
    params.require(:article).permit(:title, :content, :link)
  end
end
