require 'rails_helper'

RSpec.describe "customer relationships api", type: :request do
  contect "when the records exist" do
    it "returns all invoices" do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id)
      item_1 = create(:item)
      item_2 = create(:item)
      item_3 = create(:item)
      create(:invoice_item, item_id: item_1, invoice_id: invoice.id)
      create(:invoice_item, item_id: item_2, invoice_id: invoice.id)
      create(:invoice_item, item_id: item_3, invoice_id: invoice.id)

      get "/api/v1/merchants/#{merchant.id}/items"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.first["id"]).to eq(item_1.id)
      expect(result.last["id"]).to eq(item_3.id)
      expect(result.count).to eq(3)
    end

    it "returns all invoices"
      merchant = create(:merchant)
      invoice_1 = create(:invoice, merchant_id: merchant.id)
      invoice_2 = create(:invoice, merchant_id: merchant.id)
      invoice_3 = create(:invoice, merchant_id: merchant.id)

      get "/api/v1/merchants/#{merchant.id}/invoices"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.first["id"]).to eq(invoice_1.id)
      expect(result.last["id"]).to eq(invoice_2.id)
      expect(result.count).to eq(3)
  end
end
