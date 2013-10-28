# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :party_member do
    user_id 1
    presentation_id 1
    role "MyString"
  end
end
