require 'rails_helper'

RSpec.describe 'invoice_item relationships api', type: :request do
  context 'when the records exists' do
    it 'returns an invoice' do
      invoice = create(:invoice)
      invoice_item = create(:invoice_item, invoice_id: invoice.id)

      get "/api/v1/invoice_items/#{invoice_item.id}/invoice.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["id"]).to eq(invoice.id)
    end

    it 'returns an item' do
      item = create(:item)
      invoice_item = create(:invoice_item, item_id: item.id)

      get "/api/v1/invoice_items/#{invoice_item.id}/item.json"
      result = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(result["name"]).to eq(item.name)
    end
  end


  context 'when the records do not exists' do

  end
end