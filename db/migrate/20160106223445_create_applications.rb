class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :source_control_org
      t.string :source_control_repo
      t.string :source_control_uri
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
