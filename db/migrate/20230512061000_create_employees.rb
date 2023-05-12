class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :gender 
      t.string :contact_no

      t.timestamps null: false
    end
  end
end
