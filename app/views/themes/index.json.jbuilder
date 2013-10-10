json.array!(@themes) do |theme|
  json.extract! theme, :name, :description, :mustache, :css
  json.url theme_url(theme, format: :json)
end
