class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :bike
      t.string :price

      t.timestamps null: false
    end
  end
end
