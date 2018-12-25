FactoryBot.define do
  factory :post do
    title {Faker::Name.unique.name}
    des {Faker::HarryPotter.quote}
  end
end
