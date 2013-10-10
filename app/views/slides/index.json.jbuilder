json.array!(@slides) do |slide|
  json.extract! slide, 
  json.url slide_url(slide, format: :json)
end
