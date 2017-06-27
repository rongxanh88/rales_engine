require 'rails_helper'

RSpec.describe 'invoices_itens_records_api', type: :request do
  context 'when the record exists' do
    it 'returns all records' do
      invoice_item1 = create(:invoice_item)
      invoice_item2 = create(:invoice_item, unit_price: 11)

      get '/api/v1/invoice_items'
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(2)
      expect(result.first["unit_price"]).to eq(invoice_item1.unit_price)
      expect(result.last["unit_price"]).to eq(invoice_item2.unit_price)
    end

    it 'returns a single record' do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/#{invoice_item.id}"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["unit_price"]).to eq(invoice_item.unit_price)
    end

    it 'returns a find' do
      # GET /api/v1/invoice_items/find?parameters
    end

    it 'returns a find all' do

    end

    it 'returns a random record' do

    end
  end

  context 'when the record does not exists' do

  end
end
