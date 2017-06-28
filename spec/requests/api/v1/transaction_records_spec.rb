require 'rails_helper'

RSpec.describe 'tranactions_records_api', type: :request do
  context 'when the record exists' do
    it 'returns all records' do
      transaction1 = create(:transaction)
      transaction2 = create(:transaction, credit_card_number: 123489761234)

      get '/api/v1/transactions.json'
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(2)
      expect(result.first["credit_card_number"]).to eq(transaction1.credit_card_number)
      expect(result.last["credit_card_number"]).to eq(transaction2.credit_card_number)
    end

    it 'returns a single record' do
      transaction = create(:transaction)

      get "/api/v1/transactions/#{transaction.id}.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["credit_card_number"]).to eq(transaction.credit_card_number)
    end

    it 'returns a random record' do
      5.times do |n|
        create(:transaction)
      end
      
      get '/api/v1/transactions/random.json'
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["credit_card_number"]).to be_a(String)
    end
  end

  context 'returns a record using find' do
    it 'returns a find using id' do
      transaction = create(:transaction, credit_card_number: 1234)

      get '/api/v1/transactions/find', params: {id: transaction.id} 
      result = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(result["credit_card_number"]).to eq(transaction.credit_card_number)
    end

    it 'returns a find using credit card number' do
      transaction = create(:transaction, credit_card_number: 12)

      get '/api/v1/transactions/find', params: {credit_card_number: 12} 
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["credit_card_number"]).to eq(transaction.credit_card_number)
    end

    it 'returns a find using credit card number' do
      transaction = create(:transaction, result: 'success')

      get '/api/v1/transactions/find', params: {result: 'success'} 
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["result"]).to eq(transaction.result)
    end
  end

  context 'returns multiple records using find_all' do
    it 'returns a find all' do
      3.times do
        create(:transaction)
      end

      get '/api/v1/transactions/find_all', params: {credit_card_number: "1234123412341234"}
      result = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(result.count).to eq(3)
    end
  end

  context 'when the record does not exists' do

  end
end