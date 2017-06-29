require 'rails_helper'

RSpec.describe 'invoice_item relationships api', type: :request do
  context 'when the records exists' do
    it 'returns an invoice' do
      item = create(:item)
      invoice = create(:invoice, item_id: item.id)

      get "/api/v1/invoice_items/#{invoice.id}/transactions.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(5)
    end

    it 'returns an item' do
      invoice = create(:invoice)
      5.times do
        create(:invoice_item, invoice_id: invoice.id)
      end

      get "/api/v1/invoices/#{invoice.id}/invoice_items.json"
      result = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(result.count).to eq(5)
    end
  end


  context 'when the records do not exists' do

  end
end
# GET /api/v1/invoice_items/:id/invoice returns the associated invoice
# GET /api/v1/invoice_items/:id/item returns the associated item