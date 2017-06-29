require 'rails_helper'

RSpec.describe 'most popular items', type: :request do
  context 'when the items exists' do
    it 'returns top x number of items' do
      num_results = 1
      item = create(:item, name: "Wand")
      invoice = create(:invoice)
      Invoice_item = create(:invoice_item, invoice_id: invoice.id, quantity: 50, item_id: item.id)
      create(:transaction, invoice_id: invoice.id)
      5.times do
        create(:item)
      end


      get '/api/v1/items/most_items', params: {quantity: num_results}
      result = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(result.first["name"]).to eq("Wand")
    end
  end

  context 'when the items do not exist' do

  end
end