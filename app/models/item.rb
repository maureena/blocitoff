class Item < ActiveRecord::Base
  belongs_to :list


  def days_left
    if self.due_date
     (self.due_date - Time.now).to_i / 1.day
   end
  end
    
    #self.id will be the item id
    #self.list will be the list
    #self will be the item
    # Item.where("created_at <= ?", Time.now - 7.days)
end
