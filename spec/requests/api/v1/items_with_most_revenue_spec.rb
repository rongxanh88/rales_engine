require 'rails_helper'

RSpec.describe 'item revenue business logic', type: :request do
  context 'item exists' do
    it 'returns item with highest total revenue' do
      merchant = create(:merchant)
      customer = create(:customer)
      item_1 = create(:item)
      item_2 = create(:item, name: "Super Shovel")
      invoice = create(:invoice, merchant_id: merchant.id)
      create(:transaction, invoice_id: invoice.id)
      create(:invoice_item, quantity: 2, unit_price: 2, invoice_id: invoice.id, item_id: item_1.id)
      create(:invoice_item, quantity: 3, unit_price: 5, invoice_id: invoice.id, item_id: item_1.id)
      create(:invoice_item, quantity: 25, unit_price: 10, invoice_id: invoice.id, item_id: item_2.id)

      get "/api/v1/items/most_revenue.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["revenue"]).to eq("250")
    end

    it 'returns a set number of entries' do
      quantity = 3
      merchant = create(:merchant)
      customer = create(:customer)
      item_1 = create(:item)
      item_2 = create(:item)
      item_3 = create(:item, name: "Super Shovel")
      invoice = create(:invoice, merchant_id: merchant.id)
      create(:transaction, invoice_id: invoice.id)
      create(:invoice_item, quantity: 2, unit_price: 2, invoice_id: invoice.id, item_id: item_1.id)
      create(:invoice_item, quantity: 3, unit_price: 5, invoice_id: invoice.id, item_id: item_2.id)
      create(:invoice_item, quantity: 25, unit_price: 10, invoice_id: invoice.id, item_id: item_3.id)

      get "/api/v1/items/most_revenue.json", params: {quantity: quantity}
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.first["revenue"]).to eq("250")
      expect(result.count).to eq(3)
    end
  end
end
