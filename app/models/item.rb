class Item < ActiveRecord::Base
  belongs_to :list

  def due_date
    @list = List.find(params[:list_id])
    @item = @list.find(params[:id])

  end
end
