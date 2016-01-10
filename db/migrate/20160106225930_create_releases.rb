class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.integer :project_id
      t.date :date

      t.timestamps null: false
    end
  end
end
