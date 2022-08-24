FactoryBot.define do
  factory :user, aliases: [:author] do
    name { 'MyString' }
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password { 'password' }
    photo { 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' }
    bio { 'MyText' }
  end
end
