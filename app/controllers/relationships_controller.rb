class RelationshipsController < ApplicationController
    def create
        current_user.follow(params[:id])
        @users = User.all 
        @current = User.find(current_user.id)
        @user = User.find(params[:id])
        redirect_to request.referer
    end
    
    def destroy
        current_user.unfollow(params[:id])
        @users = User.all 
        @current = User.find(current_user.id)
        redirect_to request.referer
    end

    def follows
        user = User.find(params[:id])
        @users = user.following_user
    end

    def followers
        user = User.find(params[:id])
        @users = user.follower_user
    end
end


#def unfollow
    #follower = Relationship.find_by(followed_id: params[:id])
    #follower.destroy
    #redirect_to root_path
  #endでもできる

  #def follow
  #follower = Relationship.new(follower_id: current_user.id, followed_id: params[:id])
  #follower.save
  #redirect_to root_path
#end
#これでもできる
#redirect_to request.referer #もとの遷移先にいく、もとをgetに変える
