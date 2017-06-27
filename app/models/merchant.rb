class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :invoices
  has_many :items

  # def self.search_for_one(params)
  #   query = lower_case(params)
  #   find_by("LOWER(name) LIKE ?", "%#{query}%")
  # end

  # def self.search_for_many(params)
  #   query = lower_case(params)
  #   where("LOWER(name) LIKE ?", "%#{query}%")
  # end

  # private 

  # def self.lower_case(query)
  #   query.each do |k,v|
  #     return v.downcase
  #   end
  # end
end
