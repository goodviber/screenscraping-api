json.array!(@model_types) do |model_type|
  json.extract! model_type, :id
  json.url model_type_url(model_type, format: :json)
end
