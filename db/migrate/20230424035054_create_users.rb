class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.string :age 
      t.string :email
      t.string :address
      t.string :number

      t.timestamps null: false
    end
  end
end
