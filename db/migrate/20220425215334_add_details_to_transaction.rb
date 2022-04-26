class AddDetailsToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :customer_id, :integer
  end
end
