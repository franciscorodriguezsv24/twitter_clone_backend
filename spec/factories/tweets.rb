FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.paragraph(sentence_count: 2)}
    user { association :user }
    retweet { false }
    quote_id { nil }

  end
end
