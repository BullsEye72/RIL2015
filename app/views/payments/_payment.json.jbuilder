json.extract! payment, :id, :quote_id, :payment, :payment_date, :payment_state_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)