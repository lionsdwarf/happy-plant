class RemoveLastNotifiedFromPlants < ActiveRecord::Migration
  def change
    remove_column :plants, :last_notified, :timestamp
  end
end
