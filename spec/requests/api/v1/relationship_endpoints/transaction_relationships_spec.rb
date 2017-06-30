require 'rails_helper'

RSpec.describe "customer relationships api", type: :request do
  context "when the records exist" do
    it "returns all invoices" do
      invoice = create(:invoice)
      transaction = create(:transaction, invoice_id: invoice.id)

      get "/api/v1/transactions/#{transaction.id}/invoice.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["id"]).to eq(invoice.id)
    end
  end
end
