class Patient < ActiveRecord::Base
	validates_presence_of :name
	validates :contactno, presence: true, length: {minimum:10}
	validates_uniqueness_of :email, presence: true, :case_sensitive => false, format: {with:URI::MailTo::EMAIL_REGEXP }
	validates_presence_of :gender
end
