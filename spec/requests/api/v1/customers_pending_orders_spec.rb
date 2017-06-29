require 'rails_helper'

RSpec.describe 'customer_records_api', type: :request do
  context 'when the merchant exists' do
    it 'returns customers with only failed transactions' do
      customer = create(:customer, first_name: 'Doug')
      merchant = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id, status: 'pending')
      transaction = create(:transaction, result: 'failed', invoice_id: invoice.id)

      get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.first["first_name"]).to eq("Doug")
    end
  end
end
