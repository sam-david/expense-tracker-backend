class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def create
    new_expense = Expense.new(expense_params)
    new_expense.user = current_user

    if new_expense.save
      render json: new_expense
    else
      render json: { error: new_expense.errors.full_messages.join(', ') }
    end
  end

  def destroy
    current_expense.destroy

    redirect_to :expenses
  end

  def edit
    @expense = current_expense
  end

  def index
    if current_user.has_role? :admin
      expenses = Expense.all
    else
      expenses = current_user.expenses
    end

    render json: { expenses: expenses.order(:transaction_date) }
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
