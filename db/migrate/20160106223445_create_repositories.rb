class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :source_control_uri
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
