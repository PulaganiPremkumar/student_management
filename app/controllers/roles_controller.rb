class RolesController < ApplicationController
	def create
		@employee = Employee.find(params[:employee_id])
		@role = @employee.roles.create(role_params)
		redirect_to employee_path(@employee)
	end
	private
	def role_params
		params.require(:role).permit(:name)
	end
end
