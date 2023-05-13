class User < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :name , format: {with: /\A[a-zA-Z]+\z/,message: 'only letters is allowed'}
	validates :phone_no, presence: true, length: {minimum:10}
	validates :email, presence: true,uniqueness: true , :case_sensitive => false, format: {with:URI::MailTo::EMAIL_REGEXP } 
    
    after_delete :display_user_address
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
