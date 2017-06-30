json.(@revenue) do |revenue|
  json.(revenue, :id, :name, :total_revenue)
end
