class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :phone_num
      t.time :notification_time
      t.string :name
      t.belongs_to :user

      t.timestamps
    end
  end
end
