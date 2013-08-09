json.array!(@emails) do |email|
  json.extract! email, :email, :data, :server_id
  json.url email_url(email, format: :json)
end
