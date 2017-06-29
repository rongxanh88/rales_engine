require 'rails_helper'

RSpec.describe 'invoice relationships api', type: :request do
  context 'when the records exists' do
    it 'returns all transactions' do
      invoice = create(:invoice)
      5.times do
        create(:transaction, invoice_id: invoice.id)
      end

      get "/api/v1/invoices/#{invoice.id}/transactions.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(5)
    end

    it 'returns all invoice_items' do
      invoice = create(:invoice)
      5.times do
        create(:invoice_item, invoice_id: invoice.id)
      end

      get "/api/v1/invoices/#{invoice.id}/invoice_items.json"
      result = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(result.count).to eq(5)
    end

    it 'returns all items' do
      invoice = create(:invoice)
      create(:item, id: 1)
      create(:item, id: 2)
      create(:item, id: 3)
      invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id: 1)
      invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id: 2)
      invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id: 3)

      get "/api/v1/invoices/#{invoice.id}/items.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(3)
    end

    it 'returns the customer' do
      customer = create(:customer)
      invoice = create(:invoice, customer_id: customer.id)

      get "/api/v1/invoices/#{invoice.id}/customer.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["first_name"]).to eq(customer.first_name)
    end

    it 'returns the merchant' do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id)

      get "/api/v1/invoices/#{invoice.id}/merchant.json"
      result = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(result["name"]).to eq(merchant.name)
    end
  end


  context 'when the records do not exists' do

  end
end
# GET /api/v1/invoices/:id/customer returns the associated customer
# GET /api/v1/invoices/:id/merchant returns the associated merchant