FactoryBot.define do
  factory :comment do
    content {Faker::StarWars.character}
    post_id { nil }
  end
end
