FactoryBot.define do
  factory :role do
    name { Role.names.keys.sample }
    to_create do |instance|
      instance.id = Role.find_or_create_by(name: instance.name).id
      instance.reload
    end
  end

  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }

    association :role, factory: :role, name: 'student'

    trait :admin do
      association :role, factory: :role, name: 'admin'
    end

    trait :teacher do
      association :role, factory: :role, name: 'teacher'
    end
  end

  factory :room do
    name { Faker::Lorem.word }
    field { Faker::Lorem.word }
  end

  factory :class_room do
    association :user, factory: :user
    association :room, factory: :room
  end

  factory :annonce do
    message { Faker::Lorem.word }
  end

  factory :home_work do
    assignment { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/image.png')), 'image/png') }
    description { Faker::Lorem.word }
    course_name { Faker::Lorem.word }
    association :room, factory: :room
    association :user, factory: :user
  end

  factory :student_up do
    assignment { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/image.png')), 'image/png') }
    association :room, factory: :room
    association :user, factory: :user
    association :home_work, factory: :home_work
  end
end
