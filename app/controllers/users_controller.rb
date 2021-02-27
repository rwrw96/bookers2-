class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :collect_user , only:[:edit]
    
    def index
        @book = Book.new
        @users = User.all
        @user = current_user
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
            flash[:notice] = @user.errors.full_messages
            render :edit
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end

    def book_params
       params.require(:book).permit(:title, :body)    
    end
    
    def collect_user
        @user = User.find(params[:id])
        if @user.id == current_user.id
            return true
        else
            redirect_to user_path(current_user.id)
        end
    end
end
