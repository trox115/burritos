json.extract! burritos_info, :id, :name, :address, :address_line_2, :lat, :long, :category_id, :category_id2, :closed, :hours, :phone_number, :website, :created_at, :updated_at
json.url burritos_info_url(burritos_info, format: :json)
