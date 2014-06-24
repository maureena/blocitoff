FactoryGirl.define do

  factory :item do
    description "This is my test item"
    due_date { Time.now + 3.days }
    list
    end

  factory :invalid_item, parent: :item do
    description nil
  end

end