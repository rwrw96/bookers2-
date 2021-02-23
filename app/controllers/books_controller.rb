class BooksController < ApplicationController
    before_action :book_params, only: [:destroy]
    def new
        @book = Book.new
        @books = Book.all
    end
    
    def index
        @books = Book.all
        @user = current_user
    end
    
    def show
        @book = Book.find(params[:id])
        @user = @book.user
    end
    
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] = "successfully"
            redirect_to book_path(@book.id)
        else 
            flash[:notice] = "error"
            redirect_to books_path
        end
    end
    
    def edit 
        @book = Book.find(params[:id])
        unless current_user == @book.user
            redirect_to books_path
        end
    end
    
    def update
        @book = Book.find(params[:id])
        @book.user_id = current_user.id
        if current_user != @book.user
            redirect_to books_path
        else
        if @book.update(book_params)
            flash[:notice] = "successfully"
            redirect_to book_path(@book.id)
        else
            flash[:notice] = "error"
            redirect_to edit_book_path(@book.id)
        end
        end
    end
    
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end
    
    private
    def book_params
       params.permit(:title, :body)    
    end
end
