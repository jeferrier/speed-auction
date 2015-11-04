json.array!(@users) do |user|
  json.extract! user, :id, :username, :password_digest, :session_expires, :session_id
  json.url user_url(user, format: :json)
end
