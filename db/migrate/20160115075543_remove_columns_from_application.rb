class RemoveColumnsFromApplication < ActiveRecord::Migration
  def change
    remove_column :applications, :source_control_org
    remove_column :applications, :source_control_org
  end
end
