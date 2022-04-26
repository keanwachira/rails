class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_ref
      t.string :transaction_id
      t.string :status
      t.decimal :source_amount
      t.string :source_currency
      t.decimal :destination_amount
      t.decimal :destination_currency

      t.timestamps
    end
    add_index :transactions, :transaction_ref
    add_index :transactions, :transaction_id
  end
end
