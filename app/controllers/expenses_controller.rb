class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.has_role? :admin
      @expenses = Expense.all
    else
      @expenses = current_user.expenses
    end

    if !current_user.has_role? :admin
      @new_expense = Expense.new
    end
  end

  def edit
    @expense = current_expense
  end

  def create
    new_expense = Expense.create(expense_params)
    new_expense.user = current_user
    new_expense.save

    redirect_to :expenses
  end

  def update
    current_expense.update_attributes(expense_params)

    redirect_to :expenses
  end
  private

  def expense_params
    params.require(:expense).permit(:amount, :description, :transaction_date)
  end

  def current_expense
    Expense.find(params['id']) if params['id']
  end
end
