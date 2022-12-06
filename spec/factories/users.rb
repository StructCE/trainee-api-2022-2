FactoryBot.define do
  sequence(:user_emails) { |n| "email#{n}@gmail.com" }
  factory :user do

    name { "name" }
    email { generate(:user_emails) }
    password { "123456" }
    is_admin { false }

    trait :admin do
      is_admin { true }
    end
  end
end
