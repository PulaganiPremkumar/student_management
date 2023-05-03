class UsersController < ApplicationController
	http_basic_authenticate_with name: 'admin', password: 'cnt12345', except: [:index, :show]
  
  def index
  @comments = Comment.select(:id, :roles).distinct.order(:date_of_birth)
  if params[:comments_id]
    @users = User.joins(:comments).where(comments: { id: params[:comment_id] })
  else
    @users = User.all
  end
end
	def new
		 @user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to user_path(@user.id)
		else
			render 'new'
	    end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path(@user)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to users_path(@user)
		else
			render 'edit'
	    end
    end

    def delete_users
    	User.where(id: params[:user_ids]).destroy_all
    	redirect_to users_path
end

	private
	def user_params
		params.require(:user).permit(:name, :gender, :age, :email, :address, :number)
	end
end