class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  rolify

  has_many :expenses

  def monthly_expense_totals(start_date, end_date)
    monthly_total = Hash.new(0)
    monthly_totals = []
    expenses.where("transaction_date > ? AND transaction_date < ?", start_date, end_date).each do |exp|
      monthly_total[exp.transaction_date.beginning_of_month] += exp.amount
    end

    # convert for frontend
    monthly_total.each do |date, sum|
      monthly_totals.push({
        date: date,
        sum: sum
      })
    end

    monthly_totals.sort_by {|e| e[:date] }.map do |e|
      {
        date: e[:date].strftime('%B'),
        sum: e[:sum]
      }
    end
  end

  def earliest_expense
    expenses.order(:transaction_date).first
  end

  def latest_expense
    expenses.order(:transaction_date).last
  end
end
