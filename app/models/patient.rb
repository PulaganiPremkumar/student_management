class Patient < ActiveRecord::Base
	has_many :hospitals, dependent: :destroy
	validates_presence_of :name
	validates :contactno, presence: true, length: {minimum:10}
	validates :email, presence: true,uniqueness: true , :case_sensitive => false, format: {with:URI::MailTo::EMAIL_REGEXP } 

end
