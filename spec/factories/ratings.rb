FactoryBot.define do
  factory :rating do
    grade { false }
    comment { "MyString" }
    user { nil }
    movie { nil }
  end
end
