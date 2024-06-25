FactoryBot.define do
  factory :like do
    tweet {association :tweet}
    user {association :user}

  end
end
