require 'faker'

FactoryBot.define do
  factory :user do
    username { "@#{Faker::Name.first_name.downcase}_#{Faker::Number.within(range: 1..100)}" }
    name { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email(domain: 'test') }
    password { "$2Nefi2213252" }
    
  end
end