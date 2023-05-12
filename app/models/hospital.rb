class Hospital < ActiveRecord::Base
 has_many :hospital_patients
 
 has_many :patients, through: :hospital_patients
end
