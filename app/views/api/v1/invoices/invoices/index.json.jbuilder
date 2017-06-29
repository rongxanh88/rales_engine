json.(@invoices) do |invoice|
  json.(invoice, :id, :status, :merchant_id, :customer_id)
end
