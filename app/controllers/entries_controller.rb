class EntriesController < ApplicationController

  def new
  end

  def create
    @entry = Entry.new(entry_param)
    @entry.save
    render json: @entry
  end

  def show
    @entry= Entry.find(params[:id])
    render json: @entry
  end

  def index
    @entries = Entry.all
    render json: @entries
  end


  private
  def entry_param
    params.require(:entry).permit(:e_id, :title, :content, :link)
  end
end
