require 'rails_helper'

RSpec.describe 'item_records_api', type: :request do
  context 'when the record exists' do
    it 'returns all records' do
      item1 = create(:item)
      item2 = create(:item, name: 'Super Shovel')

      get '/api/v1/items'
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(2)
      expect(result.first["status"]).to eq(item1.status)
      expect(result.last["status"]).to eq(item2.status)
    end

    it 'returns a single record' do
      item = create(:item)

      get "/api/v1/items/#{item.id}"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["status"]).to eq(item.status)
    end

    it 'returns a find' do
      # GET /api/v1/items/find?parameters
    end

    it 'returns a find all' do

    end

    it 'returns a random record' do

    end
  end

  context 'when the record does not exists' do

  end
end
