require 'rails_helper'

RSpec.describe 'item relationships api', type: :request do
  context 'when the records exists' do
    it 'returns invoice_tems' do
      item = create(:item)
      5.times do
        create(:invoice_item, item_id: item.id)
      end

      get "/api/v1/items/#{item.id}/invoice_items.json"
      result = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(result.count).to eq(5)
    end

    it 'returns a merchant' do
      merchant = create(:merchant)
      item = create(:item, merchant_id: merchant.id)

      get "/api/v1/items/#{item.id}/merchant.json"
      result = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(result["name"]).to eq(merchant.name)
    end
  end

  context 'when the records do not exists' do

  end
end
# GET /api/v1/items/:id/merchant returns the associated merchant