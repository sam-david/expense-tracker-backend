FactoryGirl.define do
  factory :expense, class: 'Expense' do
    association :user, factory: :user

    amount Faker::Number.decimal(2)
    description { Faker::Lorem.sentences(1) }
    transaction_date { DateTime.now }
  end
end
