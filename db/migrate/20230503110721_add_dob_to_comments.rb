class AddDobToComments < ActiveRecord::Migration
  def change
    add_column :comments, :dob, :string
  end
end
