class AddLastNotifiedToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :last_notified, :integer
  end
end
