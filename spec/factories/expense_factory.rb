FactoryGirl.define do
  factory :expense, class: 'Expense' do
    association :user, factory: :user

    amount 20.00
    description 'TEST DESCRIPTION'
    transaction_date DateTime.now
  end
end
