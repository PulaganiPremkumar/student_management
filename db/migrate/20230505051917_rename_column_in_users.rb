class RenameColumnInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :address, :present_address
  end
end
