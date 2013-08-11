json.array!(@acessos) do |acesso|
  json.extract! acesso, :server_id, :email_id, :data
  json.url acesso_url(acesso, format: :json)
end
