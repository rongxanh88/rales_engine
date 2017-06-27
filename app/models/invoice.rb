class Invoice < ApplicationRecord
  belongs_to  :customer
  belongs_to  :merchant
  has_many    :invoice_items
  has_many    :transactions
  has_many    :items, through: :invoice_items

  validates :status, :merchant_id, :customer_id, presence: true
end
