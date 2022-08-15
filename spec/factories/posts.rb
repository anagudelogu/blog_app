FactoryBot.define do
  factory :post do
    author
    title { 'MyString' }
    text { 'MyText' }
  end
end
