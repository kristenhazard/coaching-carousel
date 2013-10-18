json.array!(@teams) do |team|
  json.extract! team, :name, :level
  json.url team_url(team, format: :json)
end
