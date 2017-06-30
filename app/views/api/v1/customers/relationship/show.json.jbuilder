json.(@customer.invoices) do |invoice|
  json.(invoice, :id, :customer_id, :merchant_id, :status)
end
