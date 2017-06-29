class Invoice < ApplicationRecord
  belongs_to  :customer
  belongs_to  :merchant
  has_many    :invoice_items
  has_many    :transactions
  has_many    :items, through: :invoice_items

  validates :status, :merchant_id, :customer_id, presence: true

  def self.include_transactions(invoice_id)
    Invoice.includes(:transactions).find(invoice_id)
  end
end
