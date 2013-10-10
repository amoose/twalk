json.array!(@contents) do |content|
  json.extract! content, :body
  json.url content_url(content, format: :json)
end
