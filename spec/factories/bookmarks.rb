FactoryBot.define do
  factory :bookmark do
    tweet { association :tweet }
    user { association :user }

  end
end
