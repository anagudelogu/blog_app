FactoryBot.define do
  factory :comment do
    author
    post
    text { 'MyText' }
  end
end
