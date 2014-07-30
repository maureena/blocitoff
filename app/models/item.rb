class Item < ActiveRecord::Base
  belongs_to :list

  validates :description, length: { minimum: 3 }, presence: true

  def days_left
    if self.due_date
     (self.due_date - Time.now).to_i / 1.day
   end
  end
    
end
