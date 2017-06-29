require 'rails_helper'

RSpec.describe 'invoices_records_api', type: :request do
  context 'when the record exists' do
    it 'returns all records' do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice, status: 'prepped')

      get '/api/v1/invoices.json'
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(2)
      expect(result.first["status"]).to eq(invoice1.status)
      expect(result.last["status"]).to eq(invoice2.status)
    end

    it 'returns a single record' do
      invoice = create(:invoice)

      get "/api/v1/invoices/#{invoice.id}.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["status"]).to eq(invoice.status)
    end

    it 'returns a random record' do
      5.times do |n|
        create(:invoice, status: "waiting on #{n} items")
      end

      get '/api/v1/invoices/random.json'
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["status"]).to be_a(String)
    end
  end

  context 'returns a record using find' do
    it 'returns a find using id' do
      invoice = create(:invoice, status: "pending")

      get '/api/v1/invoices/find.json', params: {id: invoice.id}
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["status"]).to eq(invoice.status)
    end

    it 'returns a find using name' do
      invoice = create(:invoice, status: "pending")

      get '/api/v1/invoices/find.json', params: {status: "pending"}
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["status"]).to eq(invoice.status)
    end
  end

  context 'returns multiple records using find_all' do
    it 'returns a find all' do
      3.times do
        create(:invoice, status: "pending")
      end

      get '/api/v1/invoices/find_all.json', params: {status: "pending"}
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(3)
    end
  end

  context 'when the record does not exists' do

  end
end
