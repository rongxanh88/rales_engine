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

    it 'returns a random record' do
      5.times do |n|
        create(:merchant, name: "merchant#{n}")
      end
      
      get '/api/v1/merchants/random.json'
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["name"]).to be_a(String)
    end
  end

  context 'returns a record using find' do
    it 'returns a find using id' do
      merchant = create(:merchant, name: 'Jane Doe')

      get '/api/v1/merchants/find', params: {id: merchant.id} 
      result = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(result["name"]).to eq(merchant.name)
    end

    it 'returns a find using name' do
      merchant = create(:merchant, name: 'Jane Doe')

      get '/api/v1/merchants/find', params: {name: 'Jane Doe'} 
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["name"]).to eq(merchant.name)
    end
  end

  context 'returns multiple records using find_all' do
    it 'returns a find all' do
      3.times do
        create(:merchant, name: 'same person')
      end

      get '/api/v1/merchants/find_all', params: {name: 'same person'}
      result = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(result.count).to eq(3)
    end
  end

  context 'when the record does not exists' do

  end
end