require 'rails_helper'

RSpec.describe "merchant relationships api", type: :request do
  context "when the records exist" do
    it "returns all items" do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id)
      item_1 = create(:item, merchant_id: merchant.id)
      item_2 = create(:item, merchant_id: merchant.id)
      item_3 = create(:item, merchant_id: merchant.id)
      create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id)
      create(:invoice_item, item_id: item_2.id, invoice_id: invoice.id)
      create(:invoice_item, item_id: item_3.id, invoice_id: invoice.id)

      get "/api/v1/merchants/#{merchant.id}/items"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.first["id"]).to eq(item_1.id)
      expect(result.last["id"]).to eq(item_3.id)
      expect(result.count).to eq(3)
    end

    it "returns all invoices" do
      merchant = create(:merchant)
      invoice_1 = create(:invoice, merchant_id: merchant.id)
      invoice_2 = create(:invoice, merchant_id: merchant.id)
      invoice_3 = create(:invoice, merchant_id: merchant.id)

      get "/api/v1/merchants/#{merchant.id}/invoices"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.first["id"]).to eq(invoice_1.id)
      expect(result.last["id"]).to eq(invoice_3.id)
      expect(result.count).to eq(3)
    end
  end
end
