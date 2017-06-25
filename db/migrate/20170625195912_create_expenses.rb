class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.belongs_to :user, index: true
      t.decimal :amount, precision: 15, scale: 2
      t.string :description
      t.datetime :transaction_date

      t.timestamps
    end
  end
end
