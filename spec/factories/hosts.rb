FactoryBot.define do
  factory :host do
    name { Faker::Name.first_name }
  end
end