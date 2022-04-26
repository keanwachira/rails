class RemoveCustomerIdFromTransaction < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :customer_id, :string
  end
end
