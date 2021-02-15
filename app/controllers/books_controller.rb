class BooksController < ApplicationController
    
    def new
        @book = Book.new(book_params)
        @books = Book.all
    end
    
    def index
        @books = Book.all
    end
    
    def create
        @books = Book.all
        book = Book.new(book_params)
        book.save
        redirect_to "/"
    end
    
    def edit 
        @book = Book.find(params[:id])
    end
    
    def update
        @book = Book.find(params[:id])
        @book.update(book_params)
        redirect_to "/"
    end

    
    private
    def book_params
       params.permit(:title, :body)    
    end
end
