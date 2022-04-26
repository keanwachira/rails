class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :status
      t.date :registration_date
      t.bit :accepted_terms

      t.timestamps
    end
  end
end
