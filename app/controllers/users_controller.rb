class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @users = User.all
    end
    
    def show
        @book = Book.new
        @user = User.find(params[:id])
        @books = @user.books
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "successfully"
            redirect_to user_path(@user.id)
        else
            flash[:notice] = "error"
            redirect_to edit_user_path(@user.id)
        end
    end
    
    private
    def user_params
        params.permit(:name, :introduction, :profile_image_id)
    end
end
