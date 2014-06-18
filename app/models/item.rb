class Item < ActiveRecord::Base
  belongs_to :list


    
    #self.id will be the item id
    #self.list will be the list
    #self will be the item
    # Item.where("created_at <= ?", Time.now - 7.days)
end
