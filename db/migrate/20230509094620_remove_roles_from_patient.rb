class RemoveRolesFromPatient < ActiveRecord::Migration
  def change
    remove_column :patients, :roles, :string
  end
end
