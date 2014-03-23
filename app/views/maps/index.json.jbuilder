json.array!(@maps) do |map|
  json.extract! map, :id, :project_id, :name, :path
  json.url map_url(map, format: :json)
end
