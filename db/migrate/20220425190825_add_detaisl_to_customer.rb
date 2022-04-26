class AddDetaislToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :email, :string
    add_column :customers, :phone, :string
  end
end
