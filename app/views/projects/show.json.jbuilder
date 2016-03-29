json.extract! @project, :id, :name

json.repositories do
  @project.repositories.each do |repo|
    latest_version = ReleaseItem.select(:id).
      joins("INNER JOIN releases ON release_items.id = releases.id").
      where(["release_items.repository_id = :repository_id AND releases.date <= :date",
             repository_id: repo.id,
             date: Date.today]).
      order(version: :desc)
    json.name repo.name
    json.source_control_uri repo.source_control_uri if repo.source_control_uri
    json.latest_version latest_version if latest_version.present?
  end
end
