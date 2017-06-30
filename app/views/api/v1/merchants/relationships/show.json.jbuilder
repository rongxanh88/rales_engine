json.(@merchant.invoices) do |invoice|
  json.(invoice, :id, :status, :customer_id, :merchant_id)
end
