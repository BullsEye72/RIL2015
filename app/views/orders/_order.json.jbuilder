json.extract! order, :id, :total_due_calc, :supplier_id, :quote_id, :created_at, :updated_at
json.url order_url(order, format: :json)