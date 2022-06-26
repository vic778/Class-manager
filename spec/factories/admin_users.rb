FactoryBot.define do
  factory :admin_user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    role { Role.find_or_create_by(name: 'admin') }
  end
end
