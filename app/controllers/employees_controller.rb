class EmployeesController < ApplicationController
	def index
	    if params[:name].present?
        @employees =Employee.eager_load(employee_roles: :role).where("roles.name LIKE ?", "%#{params[:name]}%")
        else
          @employees = Employee.all
    end
	end

	# def index
	# if params[:name].present?
    #   @employees = Employee.joins(:roles).where("roles.name LIKE ?", "%#{params[:name]}%")
    # else
    #   @employees = Employee.all
    # end
	# end

	def new
		@role = Role.all
		@employee = Employee.new

	end

	def create
		@employee = Employee.new(employee_params)
		if @employee.save
				# @employee.roles << Role.where(id: params[:employee][:role_ids])
		redirect_to employee_path(@employee)
	else
		render 'new'
	end
	end

	def show
		@employee = Employee.find(params[:id])
		@role = @employee.roles
	end


	def edit
		@employee = Employee.find(params[:id])
		@role = Role.all
	end

	def update
		@employee = Employee.find(params[:id])
		if @employee.update(employee_params)
			redirect_to employees_path(@employee)
		else
			render "edit"
		end
	end
	
	def destroy
		@employee = Employee.find(params[:id])
		@employee.destroy
		redirect_to employees_path(@employee)
	end

	def delete_employees
        Employee.destroy(params[:employee_ids])
        redirect_to employees_path, notice: "Selected employees have been deleted"
    end
    
	private
	def employee_params
		params.require(:employee).permit(:name,:email,:gender,:contact_no,role_ids:[])
end
end
