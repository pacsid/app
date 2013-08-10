json.array!(@clicks) do |click|
  json.extract! click, :ip, :time, :server_id
  json.url click_url(click, format: :json)
end
