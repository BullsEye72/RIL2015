json.extract! customer, :id, :firstname, :lastname, :address, :phone_number, :created_at, :updated_at
json.url customer_url(customer, format: :json)