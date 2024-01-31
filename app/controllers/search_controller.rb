class SearchController < ApplicationController
    def search
        @user_or_book = params[:option]  #viewの記述よりparamsで送られるのは文字列
        @how_search = params[:choice]
        if @user_or_book == "1"
          @users = User.search(params[:search], @user_or_book, @how_search)
        else
          @books = Book.search(params[:search], @user_or_book, @how_search)
        end
      end
end
