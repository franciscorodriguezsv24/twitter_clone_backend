FactoryBot.define do
  factory :follower do
    association :follower, factory: :user
    association :followee, factory: :user
  end
end
