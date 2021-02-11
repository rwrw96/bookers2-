class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
    end
    
    def edit
        # @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.update
        redirect_to "/"
    end
end
