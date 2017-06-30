json.(@customer.transactions) do |transaction|
  json.(transaction, :id, :credit_card_number, :invoice_id, :result)
end
