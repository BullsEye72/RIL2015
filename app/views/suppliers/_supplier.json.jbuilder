json.extract! supplier, :id, :name, :phone_number, :siret, :fax_number, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)