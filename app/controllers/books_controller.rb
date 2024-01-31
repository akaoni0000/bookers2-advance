class BooksController < ApplicationController

    def show
        @books = Book.find(params[:id])
        @book = Book.new
        @user = User.find(@books.user.id)
        @comment = Comment.new
    end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
		  redirect_to book_path(@book.id)
          flash[:notice] = "You have creatad book successfully."
		else
            @user = User.find(current_user.id)
            @books = Book.all
			render "index"
		end
	end

    def edit
    	@book = Book.find(params[:id])
        if @book.user.id != current_user.id
            redirect_to books_path
        end
    end

    def update
    	@book = Book.find(params[:id])
    	if @book.update(book_params)
        flash[:notice] = "You have updated book successfully."
    	redirect_to book_path(@book.id)
        else
            render "edit"
        end
    end

    def destroy
    	@book = Book.find(params[:id])
    	@book.destroy
    	redirect_to books_path
    end

    def index
       @user = User.find(current_user.id)
       @book = Book.new
       @books = Book.all
    end

    private
	def book_params
		params.require(:book).permit(:title, :body)
	end

end
