class ChangeDataTypeForLastNotified < ActiveRecord::Migration
  def self.up
    change_table :plants do |t|
      t.change :last_notified, :datetime
    end
  end
  def self.down
    change_table :plants do |t|
      t.change :last_notified, :date
    end
  end
end
