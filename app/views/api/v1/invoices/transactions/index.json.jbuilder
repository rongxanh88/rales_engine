json.(@invoice.transactions) do |transaction|
  json.(transaction, :id, :result, :credit_card_number, :invoice_id)
end