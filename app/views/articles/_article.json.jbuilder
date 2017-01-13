json.extract! article, :id, :name, :article_group_id, :value_added_tax_id, :reference, :description, :created_at, :updated_at
json.url article_url(article, format: :json)