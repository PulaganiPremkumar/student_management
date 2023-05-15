class Employee < ActiveRecord::Base
	has_many :roles, through: :employee_roles,dependent: :destroy
	has_many :employee_roles
	validates_presence_of :name
	validates :contact_no, presence: true, length: {minimum:10}
	validates :email, presence: true,uniqueness: true , :case_sensitive => false, format: {with:URI::MailTo::EMAIL_REGEXP } 

after_update :display_employee_gender
    def display_employee_gender
    if self.gender.present?
        gender = self.gender
        puts "=====Employee gender is #{gender}====="
    else
    	puts "=====gender cannot be blank====="
      end
    end


before_create :display_employee_name
    def display_employee_name
    if self.name.present?
        name = self.name
        puts "=====Employee name is #{name}====="
    else
    	puts "=====name cannot be blank====="
      end
    end
end
