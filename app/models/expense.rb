class Expense < ApplicationRecord
  belongs_to :user

  validates :amount, presence: true
  validates :transaction_date, presence: true
  validates :description, presence: true
  validates :user, presence: true

  def formatted_amount
    "$#{amount}"
  end
end
