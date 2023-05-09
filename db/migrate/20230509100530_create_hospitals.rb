class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :roles
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
