class Transaction < ApplicationRecord
    belongs_to :customer
    validates :transaction_ref, :transaction_id, :status, :source_amount, :source_currency,:destination_amount, :destination_currency,:transaction_date, presence:true
    validates :source_amount, :destination_amount, numericality:{greater_than:0}
    validates :status, inclusion: { in: %w(Pending Completed Failed),
        message: "%{value} is not a valid status" }
    validates :transaction_ref, :transaction_id, uniqueness:true
end
