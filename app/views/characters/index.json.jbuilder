json.array!(@characters) do |character|
  json.extract! character, :id, :name, :character_id
  json.url character_url(character, format: :json)
end
