class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :phone_num, :phone_num1
  end
end
