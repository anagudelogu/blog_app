FactoryBot.define do
  factory :user, aliases: [:author] do
    name { 'MyString' }
    photo { 'MyString' }
    bio { 'MyText' }
  end
end
