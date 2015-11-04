json.array!(@payment_details) do |payment_detail|
  json.extract! payment_detail, :id, :credit_card, :credit_card_number, :credit_card_expiration_date, :credit_card_security_code, :paypal, :paypal_email_address
  json.url payment_detail_url(payment_detail, format: :json)
end
