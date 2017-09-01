require 'faker'
FactoryGirl.define do
  factory :job do
    title Faker::Job.title
    description Faker::Job.key_skill
    city Faker::Address.city
    level_of_interest SecureRandom.random_number(100)
    category {create(:category)}
  end
end
