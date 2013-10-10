json.array!(@presentations) do |presentation|
  json.extract! presentation, :name, :slug, :description
  json.url presentation_url(presentation, format: :json)
end
