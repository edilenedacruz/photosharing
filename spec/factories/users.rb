FactoryGirl.define do
  factory :user do
    username {Faker::Hacker.noun}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    phone {Faker::PhoneNumber.cell_phone}
    avatar_url {Faker::Avatar.image}
    password "password"
  end
end
