require 'rails_helper'

RSpec.describe 'best day for item', type: :request do
  context 'when the data exists' do
    it 'returns best day' do
      # customer = create(:customer)
      # merchant = create(:merchant, name: "Saks and Raks")
      # invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
      # create(:transaction, invoice_id: invoice.id)

      # 5.times do
      #   create(:merchant)
      # end
      date = DateTime.new(2015,3,20)
      other_date = DateTime.new(2015,6,30)
      item = create(:item)
      invoice = create(:invoice, created_at: date)
      create(:transaction, invoice_id: invoice.id)
      get "/api/v1/items/#{item.id}/best_day"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      # expect(result["name"]).to eq("Saks and Raks")
    end
  end

  context 'when no data exists' do

  end
end