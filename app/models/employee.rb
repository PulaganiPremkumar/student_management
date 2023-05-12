class Employee < ActiveRecord::Base
	has_many :roles, through: :employee_roles,dependent: :destroy
	has_many :employee_roles
	validates_presence_of :name
	validates :contact_no, presence: true, length: {minimum:10}
	validates :email, presence: true,uniqueness: true , :case_sensitive => false, format: {with:URI::MailTo::EMAIL_REGEXP } 
end
