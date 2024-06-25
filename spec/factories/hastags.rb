FactoryBot.define do
  factory :hastag do
    name {"##{Faker::Lorem.paragraph(sentence_count: 2)}"}
  end
end
