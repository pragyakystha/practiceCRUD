json.extract! author, :id, :name, :address, :phone_num, :created_at, :updated_at
json.url author_url(author, format: :json)
