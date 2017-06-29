require 'rails_helper'

RSpec.describe 'item_records_api', type: :request do
  context 'when the record exists' do
    it 'returns all records' do
      item1 = create(:item)
      item2 = create(:item, name: 'Super Shovel')

      get '/api/v1/items.json'
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(2)
      expect(result.first["name"]).to eq(item1.name)
      expect(result.last["name"]).to eq(item2.name)
    end

    it 'returns a single record' do
      skip
      item = create(:item)

      get "/api/v1/items/#{item.id}.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["name"]).to eq(item.name)
    end

    it 'returns a random record' do
      5.times do |n|
        create(:item, name: "item#{n}")
      end

      get '/api/v1/items/random.json'
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["name"]).to be_a(String)
    end
  end

  context 'returns a record using find' do
    it 'returns a find using id' do
      item = create(:item, name: 'Shovel')

      get '/api/v1/items/find.json', params: {id: item.id}
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["name"]).to eq(item.name)
    end

    it 'returns a find using name' do
      item = create(:item, name: 'Shovel')

      get '/api/v1/items/find.json', params: {name: 'Shovel'}
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["name"]).to eq(item.name)
    end
  end

  context 'returns multiple records using find_all' do
    it 'returns a find all' do
      3.times do
        create(:item, name: 'Same Shovel')
      end

      get '/api/v1/items/find_all.json', params: {name: 'Same Shovel'}
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(3)
    end
  end

  context 'when the record does not exists' do

  end
end
