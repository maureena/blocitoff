class ListsController < ApplicationController
  def index
    @lists = List.all
    authorize @lists
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = List.new(list_params)
    authorize @list
    
    if @list.save
      flash[:notice] = "List was saved."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the list. Please try again."
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
    @item = Item.new
  end

  def edit
    @list = List.find(params[:id])
    authorize @list
  end

  def update
    @list = List.find(params[:id])
    authorize @list

    if @list.update_attributes(list_params)
      flash[:notice] = "List was updated."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the list. Please try again."
      render :edit
    end
  end

  def completed
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    @item.update_attributes(:completed, true)
    @item.destroy
  end


  private

  def list_params
    params.require(:list).permit(:title)
  end

end
