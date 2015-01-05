module Admin
  class UsersController < ApplicationController
    before_action :authorize_user

    def index
      @users = User.all
    end

  end
end
