class CreateReleaseItems < ActiveRecord::Migration
  def change
    create_table :release_items do |t|
      t.integer :release_id
      t.integer :repository_id
      t.string :version

      t.timestamps null: false
    end
  end
end
