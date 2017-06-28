require 'rails_helper'

RSpec.describe 'merchant_records_api', type: :request do
  context 'when the date exists' do
    it 'returns total revenue on date' do
      item = create(:item)
      date = DateTime.new(2012, 3, 27)
      invoice = create(:invoice, created_at: date)
      create(:invoice_item, quantity: 2, unit_price: 2,
        created_at: date, item_id: item.id,
        invoice_id: invoice.id
      )
      create(:invoice_item, quantity: 3, unit_price: 5,
        created_at: date, item_id: item.id,
        invoice_id: invoice.id
      )

      get '/api/v1/merchants/revenue', params: {date: date}
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.first["total_revenue"]).to eq("19.0") #this will be fixed with JSON serializer
    end
  end

  context 'when the date does not exist' do

  end
end