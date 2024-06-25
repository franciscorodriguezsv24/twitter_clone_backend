FactoryBot.define do
  factory :taggin do
    tweet { association :tweet }
    hastag { association :hastag }
  end
end
