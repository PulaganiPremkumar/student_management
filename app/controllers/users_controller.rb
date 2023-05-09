class UsersController < ApplicationController
	http_basic_authenticate_with name: 'admin', password: 'cnt12345', except: [:index, :show]
  
  def index
   @comments = Comment.all
    if params[:comment_id].present?
      @users = User.find(params[:comment_id]).users
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
  User.destroy(params[:user_ids])
  redirect_to users_path, notice: "Selected users have been deleted"
end


	private
	def user_params
		
		params.require(:user).permit(:name, :gender, :age, :email, :present_address, :address, :phone_no, :search)
	end
end