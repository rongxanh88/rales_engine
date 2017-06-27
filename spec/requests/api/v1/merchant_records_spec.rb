require 'rails_helper'

RSpec.describe 'merchant_records_api', type: :request do
  context 'when the record exists' do
    it 'returns all records' do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant, name: 'Jane Doe')

      get '/api/v1/merchants.json'
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(2)
      expect(result.first["name"]).to eq(merchant1.name)
      expect(result.last["name"]).to eq(merchant2.name)
    end

    it 'returns a single record' do
      merchant = create(:merchant)

      get "/api/v1/merchants/#{merchant.id}.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["name"]).to eq(merchant.name)
    end

    it 'returns a find using name' do
      skip
      merchant = create(:merchant, name: 'JaNe dOe')
      binding.pry
      get "/api/v1/merchants/find.json", params: {name: 'Jane'} 
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["name"]).to eq(merchant.name)
    end

    it 'returns a find all' do

    end

    it 'returns a random record' do

    end
  end

  context 'when the record does not exists' do

  end
end