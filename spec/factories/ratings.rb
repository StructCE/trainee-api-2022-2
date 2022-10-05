FactoryBot.define do
  factory :rating do
    grade { false }
    comment { "MyString" }
    user { association :user }
    movie { association :movie }
  end
end
