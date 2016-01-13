json.array!(@releases) do |release|
  json.extract! release, :id, :date
  json.url release_url(release, format: :json)
end
