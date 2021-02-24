class BooksController < ApplicationController
    # def new
    #     @book = Book.new
    #     @books = Book.all
    # end
    
    def index
        @book = Book.new
        @books = Book.all
        @user = current_user
    end
    
    def show
        @new_book = Book.new
        @book = Book.find(params[:id])
        @user = @book.user
    end
    
    def create
        # @user = @book.user
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] = "successfully"
            redirect_to book_path(@book.id)
        else 
            flash[:notice] = @book.errors.full_messages
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
            render :edit
        end
        end
    end
    
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image_id)
    end

    def book_params
       params.require(:book).permit(:title, :body)    
    end
end
