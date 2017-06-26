require 'rails_helper'

RSpec.describe Expense, type: :model do
  context 'validations' do
    it 'fails validation with no description' do
      build(:expense, description: nil).should_not be_valid
    end
    it 'fails validation with no amount' do
      build(:expense, amount: nil).should_not be_valid
    end
    it 'fails validation with no transaction date' do
      build(:expense, transaction_date: nil).should_not be_valid
    end
  end
end
