class CreatePatientHospitals < ActiveRecord::Migration
  def change
    create_table :patient_hospitals do |t|

      t.timestamps null: false
    end
  end
end
