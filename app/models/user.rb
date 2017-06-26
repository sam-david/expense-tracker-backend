class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :expenses

  def monthly_expense_totals(start_date, end_date)
    monthly_total = Hash.new(0)
    expenses.where("transaction_date > ? AND transaction_date < ?", start_date, end_date).each do |exp|
      monthly_total[exp.transaction_date.beginning_of_month] += exp.amount
    end
    monthly_total
  end

  def earliest_expense
    expenses.order(:transaction_date).first
  end

  def latest_expense
    expenses.order(:transaction_date).last
  end
end
