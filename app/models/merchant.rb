class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :invoices
  has_many :items

  def self.revenue_on_date(date)
    InvoiceItem.where(created_at: (date.beginning_of_day..date.end_of_day))
               .select("created_at::timestamp::date AS date, SUM(quantity*unit_price) AS revenue")
               .group("date")
  end
end
