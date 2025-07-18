class FavoritesController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @post = Post.find(params[:post_id])
        @favorite = current_user.favorites.new(post_id: @post.id)
        @favorite.save
        
        respond_to do |format|
            format.html { redirect_to post_path(@post) }
            format.js
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @favorite = current_user.favorites.find_by(post_id: @post.id)
        @favorite.destroy
        
        respond_to do |format|
            format.html { redirect_to post_path(@post) }
            format.js
        end
    end
end
