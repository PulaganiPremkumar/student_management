class Role < ActiveRecord::Base
	has_many :employees, through: :employee_roles
	has_many :employee_roles
end
