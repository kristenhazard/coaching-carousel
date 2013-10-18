json.array!(@source_data_pfrs) do |source_data_pfr|
  json.extract! source_data_pfr, :coach, :year, :age, :level, :employer, :role
  json.url source_data_pfr_url(source_data_pfr, format: :json)
end
