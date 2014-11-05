FactoryGirl.define do
  sequence(:name)     { |n| "#{Faker::Name.name}-#{n}" }

  factory :user do
    name
  end
end