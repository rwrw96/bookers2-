class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to "/"
    end
    
    private
    def user_params
        params.permit(:name, :introduction)
    end
end
