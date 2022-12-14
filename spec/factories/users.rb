FactoryBot.define do
  factory :user do
    name { "name" }
    is_admin { false }

    trait :admin do
      is_admin { true }
    end
  end
end
