class FavoritesController < ApplicationController
    def create
        favorite = Favorite.new(book_id: params[:book_id], user_id: current_user.id) #link_toでid番号だけだからストロングパラメーターいらない
        favorite.save
        @book = Book.find(params[:book_id])
        #非同期通信はその部分だけを入れ替える、なので@userとかを定義する必要はない
        #remote: trueかdata: {remote: true}
    end

    def destroy
        favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
        favorite.destroy
        @book = Book.find(params[:book_id])
    end
end

#def create
    #book = Book.find(params[:book_id])
    #favorite = Favorite.new(book_id: params[:book_id], user_id: current_user.id)
    #favorite.save
    #redirect_to books_path
#end

#def destroy
    #book = Book.find(params[:book_id])
    #favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    #favorite.destroy
    #redirect_to books_path
#end