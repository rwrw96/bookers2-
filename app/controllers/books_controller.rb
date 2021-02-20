class BooksController < ApplicationController
    
    def new
        @book = Book.new
        @books = Book.all
    end
    
    def index
        @books = Book.all
    end
    
    def show
        @book = Book.find(params[user_id])
        @user = User.find(params[@book.user_id])
    end
    
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @book.save
        redirect_to book_path(@book.user_id)
    end
    
    def edit 
        @book = Book.find(params[:id])
    end
    
    def update
        @book = Book.find(params[:id])
        @book.user_id = current_user.id
        @book.update(book_params)
        redirect_to book_path(@book.id)
    end
    
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to "/"
    end
    
    private
    def book_params
       params.permit(:title, :body)    
    end
end
