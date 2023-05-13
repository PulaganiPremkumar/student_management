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

before_destroy :display_employee_contact_no
    def display_employee_contact_no
    if self.contact_no.present?
        contact_no = self.contact_no
        puts "=====Employee contact_no is #{contact_no}====="
    else
    	puts "=====contact_no cannot be blank====="
      end
    end
end
