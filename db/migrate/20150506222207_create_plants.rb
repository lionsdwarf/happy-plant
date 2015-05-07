class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :type
      t.integer :stamina
      t.text :photo_url
      t.belongs_to :user
      t.timestamps
    end
  end
end
