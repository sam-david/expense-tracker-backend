class ReportsController < ApplicationController
  def index
    p params
    @start_date = Date.parse(params[:start_date]) || current_user.earliest_expense.transaction_date
    @end_date = Date.parse(params[:end_date]) || current_user.latest_expense.transaction_date
    @monthly_totals = current_user.monthly_expense_totals(@start_date , @end_date)
  end
end
