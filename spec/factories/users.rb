FactoryBot.define do
  factory :user do
    
    trait :admin do
      admin_info { true }
    end
  end
end
