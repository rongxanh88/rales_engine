

def index
# most_revenue?quantity=x
# returns the top x merchants ranked by total revenue
Merchant.select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue").joins(:invoice_items).group("merchants.id").order("total_revenue DESC").limit(5)
end
