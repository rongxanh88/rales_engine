require 'rails_helper'

RSpec.describe "customer relationships api", type: :request do
  contect "when the records exist" do
    it "returns all invoices" do
      customer = create(:customer)
      invoice_1 = create(:invoice, customer_id: customer.id)
      invoice_2 = create(:invoice, customer_id: customer.id)
      invoice_3 = create(:invoice, customer_id: customer.id)

      get "/api/v1/customers/#{customer.id}/invoices"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.first["id"]).to eq(invoice_1.id)
      expect(result.last["id"]).to eq(invoice_3.id)
      expect(result.count).to eq(3)
    end

    it "returns all transactions"
      customer = create(:customer)
      invoice = create(:invoice, customer_id: customer.id)
      transaction_1 = create(:transaction, invoice_id: invoice.id)
      transaction_2 = create(:transaction, invoice_id: invoice.id, result: "failed")

      get "/api/v1/customers/#{customer.id}/transactions"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.first["id"]).to eq(transaction_1.id)
      expect(result.last["id"]).to eq(transaction_2.id)
      expect(result.count).to eq(2)
  end
end
