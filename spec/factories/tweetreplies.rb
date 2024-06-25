FactoryBot.define do
  factory :tweetreply do
    tweet { association :tweet }
    user { association :user }
    body { Faker::Lorem.paragraph(sentence_count: 2)}
  end
end
