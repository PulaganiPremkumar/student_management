class RenameColumnInComments < ActiveRecord::Migration
  def change
    rename_column :comments,:role,:roles
  end
end
