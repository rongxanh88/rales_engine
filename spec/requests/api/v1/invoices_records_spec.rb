require 'rails_helper'

RSpec.describe 'invoices_records_api', type: :request do
  context 'when the record exists' do
    it 'returns all records' do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice, status: 'prepped')

      get '/api/v1/invoices'
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(2)
      expect(result.first["status"]).to eq(invoice1.status)
      expect(result.last["status"]).to eq(invoice2.status)
    end

    it 'returns a single record' do
      invoice = create(:invoice)

      get "/api/v1/invoices/#{invoice.id}"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["status"]).to eq(invoice.status)
    end

    it 'returns a find' do
      # GET /api/v1/invoices/find?parameters
    end

    it 'returns a find all' do

    end

    it 'returns a random record' do

    end
  end

  context 'when the record does not exists' do

  end
end
