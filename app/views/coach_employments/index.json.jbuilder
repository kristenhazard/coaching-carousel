json.array!(@coach_employments) do |coach_employment|
  json.extract! coach_employment, :coach_id, :team_id, :year, :role, :age
  json.url coach_employment_url(coach_employment, format: :json)
end
