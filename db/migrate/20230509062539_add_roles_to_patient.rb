class AddRolesToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :roles, :string
  end
end
