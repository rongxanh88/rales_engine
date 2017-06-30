require 'rails_helper'

RSpec.describe 'merchant revenue business logic', type: :request do
  context 'merchant exists' do
    it 'returns merchant with highest total revenue' do
      skip
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)
      customer = create(:customer)
      item = create(:item)
      invoice_1 = create(:invoice, merchant_id: merchant_1.id)
      invoice_2 = create(:invoice, merchant_id: merchant_2.id)
      create(:transaction, invoice_id: invoice_1.id)
      create(:transaction, invoice_id: invoice_2.id)
      create(:invoice_item, quantity: 2, unit_price: 2, invoice_id: invoice_1.id)
      create(:invoice_item, quantity: 3, unit_price: 5, invoice_id: invoice_1.id)
      create(:invoice_item, quantity: 25, unit_price: 10, invoice_id: invoice_2.id)

      get "/api/v1/items/most_revenue.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.first["total_revenue"]).to eq("2.5")
    end

    it 'returns a set number of entries' do
      skip
      quantity = 2
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)
      customer = create(:customer)
      item = create(:item)
      invoice_1 = create(:invoice, merchant_id: merchant_1.id)
      invoice_2 = create(:invoice, merchant_id: merchant_2.id)
      create(:transaction, invoice_id: invoice_1.id)
      create(:transaction, invoice_id: invoice_2.id)
      create(:invoice_item, quantity: 2, unit_price: 2, invoice_id: invoice_1.id)
      create(:invoice_item, quantity: 3, unit_price: 5, invoice_id: invoice_1.id)
      create(:invoice_item, quantity: 25, unit_price: 10, invoice_id: invoice_2.id)

      get "/api/v1/items/most_revenue.json", params: {quantity: quantity}
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.first["total_revenue"]).to eq("2.5")
      expect(result.count).to eq(2)
    end
  end
end
