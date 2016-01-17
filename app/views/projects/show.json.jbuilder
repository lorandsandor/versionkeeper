json.extract! @project, :id, :name

json.applications do
  @project.applications.each do |application|
    latest_version = ReleaseItem.select(:id).
      joins("INNER JOIN releases ON release_items.id = releases.id").
      where(["release_items.application_id = :application_id AND releases.date <= :date",
             application_id: application.id,
             date: Date.today]).
      order(version: :desc)
    json.name application.name
    json.source_control_uri application.source_control_uri if application.source_control_uri
    json.latest_version latest_version if latest_version.present?
  end
end
