class PatientsController < ApplicationController
	def index
		@patients = Patient.all
	end
	def new
		@patient = Patient.new
	end
	def create
		@patient = Patient.new(patient_params)
		if @patient.save
			redirect_to patient_path(@patient.id)
		else
			render 'new'
		end
	end

	def show
		@patient = Patient.find(params[:id])
	end
	def edit
		@patient = Patient.find(params[:id])
	end
	def update
		@patient = Patient.find(params[:id])
		if @patient.update(patient_params)
			redirect_to patients_path(@patient)
		else
			render 'edit'
		end
	end
	def destroy
		@patient = Patient.find(params[:id])
		@patient.destroy
		redirect_to patients_path(@patient)
	end
		
  private
	def patient_params
		params.require(:patient).permit(:name, :email, :contactno, :gender)
	end

end





	# def newpatient
	# 	@patient = Patient.new
	# end

	# def savepatient
	# 	@patient = Patient.new(patient_params)
	# 	if @patient.save
	# 		redirect_to patient_path(@patient.id)
	# 	else
	# 		render 'newpatient'
	# 	end
	# end

	# def export
	# 	@patient = Patient.find(params[:id])
	# end

	# def confirm
	# 	@patients = Patient.all
	# end

	# def approve
	# 	@patient = Patient.find(params[:id])
	# end

	# def improve
	# 	@patient = Patient.find(params[:id])
	# 	if @patient.update(patient_params)
	# 		redirect_to patients_path(@patient)
	# 	else
	# 		render 'approve'
	# 	end
	# end

	# def cancel
	# 	@patient = Patient.find(params[:id])
	# 	@patient.destroy
	# 	redirect_to patients_path(@patient)
	# end
	
	
