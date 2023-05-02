class AddColumnsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :jobrole, :string
  end
end
