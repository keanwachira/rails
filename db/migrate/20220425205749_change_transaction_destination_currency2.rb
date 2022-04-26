class ChangeTransactionDestinationCurrency2 < ActiveRecord::Migration[7.0]
  def change
    change_column :transactions, :destination_currency, :string
  end
end
