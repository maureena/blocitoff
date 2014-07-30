class List < ActiveRecord::Base
  has_many :items
  belongs_to :user

 #validates_presence_of :user
 validates :user_id, presence: true

end
