json.(@invoice_items) do |invoice_item|
  json.(invoice_item, :id, :item_id, :invoice_id, :quantity, :unit_price)
end
