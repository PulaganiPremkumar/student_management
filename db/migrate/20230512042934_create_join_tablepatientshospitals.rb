class CreateJoinTablepatientshospitals < ActiveRecord::Migration
  def change
    create_join_table :patients, :hospitals do |t|
      

      # t.index [:patient_id, :hospital_id]
      # t.index [:hospital_id, :patient_id]
    end
  end
end
