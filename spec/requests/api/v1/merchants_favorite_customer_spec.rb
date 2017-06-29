require 'rails_helper'

RSpec.describe 'merchants favorite customer business logic', type: :request do
  context 'customer and merchant exist' do
    it 'returns customer with most transactions' do
      customer_1 = create(:customer)
      customer_2 = create(:customer, first_name: "Doug")
      merchant = create(:merchant)
      invoice_1 = create(:invoice, merchant_id: merchant.id, customer_id: customer_1.id)
      invoice_2 = create(:invoice, merchant_id: merchant.id, customer_id: customer_1.id)
      invoice_3 = create(:invoice, merchant_id: merchant.id, customer_id: customer_2.id)
      invoice_4 = create(:invoice, merchant_id: merchant.id, customer_id: customer_2.id)
      invoice_5 = create(:invoice, merchant_id: merchant.id, customer_id: customer_2.id)
      invoice_6 = create(:invoice, merchant_id: merchant.id, customer_id: customer_2.id)
      create(:transaction, invoice_id: invoice_1.id)
      create(:transaction, invoice_id: invoice_2.id)
      create(:transaction, invoice_id: invoice_3.id)
      create(:transaction, invoice_id: invoice_4.id)
      create(:transaction, invoice_id: invoice_5.id)
      create(:transaction, invoice_id: invoice_6.id)

      get "/api/v1/merchants/#{merchant.id}/favorite_customer"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["first_name"]).to eq("Doug")
    end
  end
end
