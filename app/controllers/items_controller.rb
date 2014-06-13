class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to @item
    else
      flash[:error] = "There was a problem saving your item. Please try again."
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:notice] = "Item was updated."
      redirect_to @item
    else
      flash[:error] = "There was an error saving the item. Please try again."
      render :edit
    end
  end
end

private

def item_params
  params.require(:item).permit(:description, :id)
end
