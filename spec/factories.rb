FactoryBot.define do
  factory :register do
    user nil
    blood_type "MyString"
    cancer_type "MyString"
  end

  factory :user do
    name "Joe"
    email "joe@gmail.com"
    password "blahblah"
  end

end
