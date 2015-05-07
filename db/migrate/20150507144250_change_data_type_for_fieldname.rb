class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.change :phone_num, :string
    end
  end
  def self.down
    change_table :users do |t|
      t.change :phone_num, :integer
    end
  end
end
