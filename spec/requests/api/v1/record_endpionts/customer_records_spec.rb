require 'rails_helper'

RSpec.describe 'customer_records_api', type: :request do
  context 'when the record exists' do
    it 'returns all records' do
      customer1 = create(:customer, first_name: 'Hank')
      customer2 = create(:customer, first_name: 'Aaron')

      get '/api/v1/customers.json'
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(2)
      expect(result.first["first_name"]).to eq(customer1.first_name)
      expect(result.last["first_name"]).to eq(customer2.first_name)
    end

    it 'returns a single record' do
      customer = create(:customer)

      get "/api/v1/customers/#{customer.id}.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["first_name"]).to eq(customer.first_name)
    end

    it 'returns a random record' do
      5.times do |n|
        create(:customer, first_name: "customer#{n}")
      end
      
      get '/api/v1/customers/random.json'
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["first_name"]).to be_a(String)
    end
  end

  context 'returns a record using find' do
    it 'returns a find using id' do
      customer = create(:customer, first_name: 'Jane')

      get '/api/v1/customers/find.json', params: {id: customer.id} 
      result = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(result["first_name"]).to eq(customer.first_name)
    end

    it 'returns a find using first name' do
      customer = create(:customer, first_name: 'Jane')

      get '/api/v1/customers/find.json', params: {first_name: 'Jane'} 
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["first_name"]).to eq(customer.first_name)
    end

    it 'returns a find using last name' do
      customer = create(:customer, last_name: 'Jane')

      get '/api/v1/customers/find.json', params: {last_name: 'Jane'} 
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["last_name"]).to eq(customer.last_name)
    end
  end

  context 'returns multiple records using find_all' do
    it 'returns a find all' do
      3.times do
        create(:customer, first_name: 'same person')
      end

      get '/api/v1/customers/find_all.json', params: {first_name: 'same person'}
      result = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(result.count).to eq(3)
    end
  end

  context 'when the record does not exists' do

  end
end