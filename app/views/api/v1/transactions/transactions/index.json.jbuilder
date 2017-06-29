json.(@transactions) do |transaction|
  json.(transaction, :id, :result, :invoice_id, :credit_card_number)
end