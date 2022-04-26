class AddCustomerIdToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :customer, null: false, foreign_key: true
  end
end
