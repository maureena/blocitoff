class ItemsController < ApplicationController
  respond_to :html, :js

  def index
    @list = List.find(params[:list_id])
    @items = Item.all
    authorize @items
  end

  def show
    @list = List.find(params[:list_id])
    @item = @list.find(params[:id])
    authorize @item
  end

  def new
    @item = Item.new
    @list = List.find(params[:list_id])
    authorize @item
  end

  def create
    @list = current_user.list
    @item = @list.items.build(item_params)
    @item.list = @list
    @item.due_date = Time.now + 7.days

    authorize @item
    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to @list
    else
      flash[:error] = "There was a problem saving your item. Please try again."
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    authorize @item
  end

  def update
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])

    authorize @item
    if @item.update_attributes(item_params)
      flash[:notice] = "Item was updated."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the item. Please try again."
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    description = @item.description

    authorize @list
    if @item.destroy
      flash[:notice] = "\"#{description}\" was deleted successfully."
    else
      flash[:error] = "There was an error deleting the item. Please try again."
    end

      respond_with(@item) do |f|
        f.html { redirect_to @list }
    end
  end

  def completed
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    @item.update_attributes(:completed, true)
    @item.destroy
  end


  private

  def item_params
    params.require(:item).permit(:description, :list_id)
  end

end
