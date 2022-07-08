FactoryBot.define do
  factory :class_room do
    name { Faker::Lorem.word }
    field { Faker::Lorem.word }
    association :user, factory: :user
  end
end
