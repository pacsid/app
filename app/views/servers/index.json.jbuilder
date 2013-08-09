json.array!(@servers) do |server|
  json.extract! server, :nome
  json.url server_url(server, format: :json)
end
