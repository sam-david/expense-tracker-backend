class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    params
    start_date = params[:start_date].nil? ? current_user.earliest_expense.transaction_date : Date.parse(params[:start_date])
    end_date = params[:end_date].nil? ? current_user.latest_expense.transaction_date : Date.parse(params[:end_date])
    monthly_totals = current_user.monthly_expense_totals(start_date , end_date)

    render json: monthly_totals
  end
end
