require 'rails_helper'

RSpec.describe 'customer_records_api', type: :request do
  context 'when the merchant exists' do
    it 'returns invoices with a status of pending' do
      skip
      customer = create(:customer)
      merchant = create(:merchant)
      invoice1 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id, status: 'pending')
      invoice2 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id, status: 'pending')

      get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.first["status"]).to eq("pending")
    end
  end

  context 'when the date does not exist' do

  end
end
