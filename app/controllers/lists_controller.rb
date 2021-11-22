class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
