class User < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates_presence_of :name
	validates :number, presence: true, length: {minimum:10}
	validates_uniqueness_of :email, presence: true, :case_sensitive => false, format: {with:URI::MailTo::EMAIL_REGEXP }
end
