class RemoveJobroleFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :jobrole, :string
  end
end
