module Admin
  class UsersController < ApplicationController
    before_action :authorize_user

    def index
      @users = User.all
    end

    def destroy
      @user = User.find(params[:id])
      if @user == current_user
        flash[:notice] = "You can't delete yourself."
      else
        flash[:notice] = "Account for #{@user.email} has been deleted."
        @user.delete
      end
      redirect_to admin_users_path
    end
  end
end
