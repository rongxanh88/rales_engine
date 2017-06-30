require 'rails_helper'

RSpec.describe 'invoices_itens_records_api', type: :request do
  context 'when the record exists' do
    it 'returns all records' do
      invoice_item1 = create(:invoice_item)
      invoice_item2 = create(:invoice_item, unit_price: 11)

      get '/api/v1/invoice_items.json'
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(2)
      expect(result.first["unit_price"]).to eq(invoice_item1.unit_price)
      expect(result.last["unit_price"]).to eq(invoice_item2.unit_price)
    end

    it 'returns a single record' do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/#{invoice_item.id}.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["id"]).to eq(invoice_item.id)
    end

    it 'returns a random record' do
      5.times do |n|
        create(:invoice_item, quantity: n)
      end

      get '/api/v1/invoice_items/random.json'
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["quantity"]).to be_a(Integer)
    end
  end

  context 'returns a record using find' do
    it 'returns a find using id' do
      invoice_item = create(:invoice_item, quantity: 15)

      get '/api/v1/invoice_items/find.json', params: {id: invoice_item.id}
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["quantity"]).to eq(invoice_item.quantity)
    end

    it 'returns a find using name' do
      invoice_item = create(:invoice_item, quantity: 15)

      get '/api/v1/invoice_items/find.json', params: {quantity: 15}
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["quantity"]).to eq(invoice_item.quantity)
    end
  end

  context 'returns multiple records using find_all' do
    it 'returns a find all' do
      3.times do
        create(:invoice_item, quantity: 15)
      end

      get '/api/v1/invoices/find_all.json', params: {quantity: 15}
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(3)
    end
  end

  context 'when the record does not exists' do

  end
end
