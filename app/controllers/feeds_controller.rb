class FeedsController < ApplicationController

  def new
  end

  def create
    @feed = Feed.create(feed_param)
    render json: @feed
  end

  def show
    @feed= Feed.find(params[:id])
    respond_to do |format|
      format.json { render json: @feed }
      format.xml { render xml: @feed }
    end
  end

  def index
    @feeds = Feed.all
    respond_to do |format|
      format.json { render json: @feeds }
      format.xml { render xml: @feeds }
    end
  end

  def destroy
    @feed = Feed.find(params[:id]).destroy
    render nothing: true
  end

  private
  def feed_param
    params.require(:feeds).permit(:title, :author, :link, :source)
  end
end
