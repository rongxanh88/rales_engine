json.(@merchants) do |merchant|
  json.(merchant, :id, :name)
end