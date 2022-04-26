class AddFxRateToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :transaction_date, :date
    add_column :transactions, :exchange_rate, :decimal
  end
end
