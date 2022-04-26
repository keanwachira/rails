class Customer < ApplicationRecord
    has_many :transactions
    validates :name, :status, :email, :phone, :registration_date, presence:true
    validates :name, length: {minimum:3, maximum:20}
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ , message:"%{value} is not a valid email"}
    validates :status, inclusion: { in: %w(Active Inactive Frozen) ,message: "%{value} is not a valid status" }  
end
