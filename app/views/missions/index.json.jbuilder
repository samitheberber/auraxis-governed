json.array!(@missions) do |mission|
  json.extract! mission, :id, :name, :status, :user_id, :server, :faction
  json.url mission_url(mission, format: :json)
end
