FactoryGirl.define do
  factory :list do
    title "My List"
    user 
    end

  factory :invalid_list, parent: :list do
    user nil
  end

end