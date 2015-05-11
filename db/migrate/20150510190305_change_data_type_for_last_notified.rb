class ChangeDataTypeForLastNotified < ActiveRecord::Migration
  def self.up
    change_table :plants do |t|
      t.change :last_notified, :string
    end
  end
  def self.down
    change_table :plants do |t|
      t.change :last_notified, :integer
    end
  end
end
