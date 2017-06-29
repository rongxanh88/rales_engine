require 'rails_helper'

RSpec.describe 'invoice transactions api', type: :request do
  context 'when the records exists' do
    it 'returns all records' do
      invoice = create(:invoice)
      5.times do
        create(:transaction, invoice_id: invoice.id)
      end

      get "/api/v1/invoices/#{invoice.id}/transactions.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.count).to eq(5)
    end

  end


  context 'when the records do not exists' do

  end
end