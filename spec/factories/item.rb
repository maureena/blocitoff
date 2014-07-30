FactoryGirl.define do

  factory :item do
    description "This is my test item"
    due_date { Time.now + 3.days }
    list { FactoryGirl.create(:valid_list) }
    end

  factory :invalid_item, parent: :item do
    description nil
  end

end