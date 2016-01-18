project_uk = Project.create(name: 'Project UK')
project_us = Project.create(name: 'Project US')

['UK App 1', 'UK App2'].each do |app|
  project_uk.applications.create(name: app)
end

['US App 1', 'US App 2', 'US App 3'].each do |app|
  project_us.applications.create(name: app)
end
