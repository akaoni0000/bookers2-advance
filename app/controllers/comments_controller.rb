class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.book_id = params[:book_id]
        if @comment.save
           @books = Book.find(params[:book_id])
           @comment = Comment.new
        else
           flash[:danger] = "Comment can't be blank" #renderをつかっていいねするとエラー起こる
           @books = Book.find(params[:book_id])
           @comment = Comment.new
        end
    end

    def destroy
        comment = Comment.find(params[:comment_id])
        comment.destroy
        @books = Book.find(comment.book.id)
        @comment = Comment.new
    end
    private
    def comment_params
        params.require(:comment).permit(:comment)
    end
end

#data: {remote: true}
