class CommentsController < ApplicationController
	http_basic_authenticate_with name: 'admin', password: 'cnt12345', only: :destroy
	def create
		@user = User.find(params[:user_id])
		@comment = @user.comments.create(comment_params)
		redirect_to user_path(@user)
	end
	def destroy
		@user = User.find(params[:user_id])
		@comment = @user.comments.find(params[:id])
		@comment.destroy
		redirect_to user_path(@user)
	end
	def edit
	end
	
	private
	  def comment_params
	   	params.require(:comment).permit(:roles )
	
	end
end

