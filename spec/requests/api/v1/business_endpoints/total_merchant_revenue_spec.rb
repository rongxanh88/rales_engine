require 'rails_helper'

RSpec.describe 'merchant revenue business logic', type: :request do
  context 'merchant exists' do
    it 'returns total revenue' do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id)
      create(:transaction, invoice_id: invoice.id)
      create(:invoice_item, quantity: 2, unit_price: 2,
        invoice_id: invoice.id
      )
      create(:invoice_item, quantity: 3, unit_price: 5,
        invoice_id: invoice.id
      )

      get "/api/v1/merchants/#{merchant.id}/revenue.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["revenue"]).to eq("0.19")
    end

    it 'returns revenue for merchant on that date' do
      date = DateTime.new(2015, 3, 20)
      merchant = create(:merchant)
      bad_invoice = create(:invoice, merchant_id: merchant.id)
      good_invoice = create(:invoice, merchant_id: merchant.id, created_at: date)
      create(:transaction, invoice_id: bad_invoice.id)
      create(:transaction, invoice_id: good_invoice.id)
      create(:invoice_item, quantity: 2, unit_price: 2,
        invoice_id: bad_invoice.id
      )
      create(:invoice_item, quantity: 3, unit_price: 5,
        invoice_id: good_invoice.id
      )

      get "/api/v1/merchants/#{merchant.id}/revenue.json", params: {date: date}
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["revenue"]).to eq("0.15")
    end
  end

  context 'when the merchant does not exist' do

  end
end