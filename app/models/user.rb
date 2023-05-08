class User < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates_presence_of :name
	validates :phone_no, presence: true, length: {minimum:10}
	validates_uniqueness_of :email, presence: true, :case_sensitive => false, format: {with:URI::MailTo::EMAIL_REGEXP } 
    
def self.search(search)
            where('name LIKE :query OR email LIKE :query OR phone_no LIKE :query', { query: "%#{search}%" })
      end


    after_commit :display_user_address
    def display_user_address
    if self.address.present?
        address = self.address
        puts "=====User address is #{address}====="
    else
    	puts "=====address cannot be blank====="
      end
    end

    after_update :display_user_gender
    def display_user_gender
    if self.gender.present?
        gender = self.gender
        puts "=====Student gender is #{gender}====="
    else
    	puts "=====gender cannot be blank====="
      end
    end
end
