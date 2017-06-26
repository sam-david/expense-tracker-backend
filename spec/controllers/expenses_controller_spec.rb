require 'rails_helper'

RSpec.describe ExpensesController, :type => :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end

  context "GET new" do
    it "assigns a blank expense on index page" do
      get :index
      expect(assigns(:new_expense)).to be_a_new(Expense)
    end
  end

  context "POST create" do
    it "redirects to expenses index page after create success" do
      params = {
        expense: {
          amount: "12.00",
          description: "TEST description",
          transaction_date: "2014-12-31"
        }
      }
      
      expect do
        post :create, params
      end.to change(Expense, :count)
      expect(flash[:error]).to_not be_present
      expect(response).to redirect_to(expenses_path)
    end

    it "raises an error if missing amount param" do
      params = {
        expense: {
          description: "TEST description",
          transaction_date: "2014-12-31"
        }
      }
      post :create, params
      expect(flash[:error]).to be_present
      expect(response).to redirect_to(expenses_path)
    end

    it "raises an error if missing description param" do
      params = {
        expense: {
          amount: "12.00",
          transaction_date: "2014-12-31"
        }
      }
      post :create, params
      expect(flash[:error]).to be_present
      expect(response).to redirect_to(expenses_path)
    end

    it "raises an error if missing transaction_date param" do
      params = {
        expense: {
          amount: "12.00",
          description: "TEST description"
        }
      }
      post :create, params
      expect(flash[:error]).to be_present
      expect(response).to redirect_to(expenses_path)
    end

  end

  context "DELETE Destroy" do
    let(:expense) { create(:expense) }

    it "destroys existing expense" do
      params = {
        id: expense.id
      }

      expect do
        delete :destroy, params
      end.to change(Expense, :count)
      expect(response).to redirect_to(expenses_path)
    end

    it "raises error when invalid id provided" do
      params = {
        id: 'TEXT'
      }

      expect do
        delete :destroy, params
      end.to raise_error ActiveRecord::RecordNotFound
    end
  end


  context "PUT Update" do
    let(:expense) { create(:expense) }
    let(:test_amount) { 42.00 }

    it "updates existing expense with new params" do
      params = {
        id: expense.id,
        expense: {
          amount: test_amount
        }
      }

      put :update, params
      expect(expense.reload.amount).to eql(test_amount)
      expect(response).to redirect_to(expenses_path)
    end
  end

  context "GET Edit" do
    let(:expense) { create(:expense) }

    it "returns expense and redirects to edit page" do
      params = {
        id: expense.id
      }

      get :edit, params
      expect(assigns(:expense)).to be_a(Expense)
    end
  end
end
