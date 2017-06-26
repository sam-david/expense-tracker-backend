FactoryGirl.define do
  factory :user, class: 'User' do
    email { Faker::Internet.unique.email }
    password 'test123'
  end
end
