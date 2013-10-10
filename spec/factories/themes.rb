# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :theme do
    name "MyString"
    description "MyText"
    mustache "MyText"
    css "MyText"
  end
end
