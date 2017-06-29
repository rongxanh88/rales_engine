json.(@items) do |item|
  ((item.unit_price.to_f)/100).to_s
  json.(item, :id, :name, :description, :unit_price, :merchant_id)
end
