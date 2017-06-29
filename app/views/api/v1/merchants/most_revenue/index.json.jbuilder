json.(@revenue) do |revenue|
  json.(revenue, :id, :total_revenue)
end
