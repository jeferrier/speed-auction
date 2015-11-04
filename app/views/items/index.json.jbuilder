json.array!(@items) do |item|
  json.extract! item, :id, :name, :description, :starting_price, :buyout_price, :street_address, :city, :state, :zip, :delivered
  json.url item_url(item, format: :json)
end
