class HospitalsController < ApplicationController
	def create
		@patient = Patient.find(params[:patient_id])
		@hospital = @patient.hospitals.create(hospital_params)
		redirect_to patient_path(@patient)
	end

	def destroy
		@patient = Patient.find(params[:patient_id])
		@hospital = @patient.hospitals.find(params[:id])
		@hospital.destroy
	end

	private
	def hospital_params
		params.require(:hospital).permit(:roles)
	end
end
