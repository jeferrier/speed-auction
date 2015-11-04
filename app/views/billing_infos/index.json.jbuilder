json.array!(@billing_infos) do |billing_info|
  json.extract! billing_info, :id, :name, :street_address, :city, :state, :zip, :phone_number, :email_address
  json.url billing_info_url(billing_info, format: :json)
end
