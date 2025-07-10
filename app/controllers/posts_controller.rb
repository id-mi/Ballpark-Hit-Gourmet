class PostsController < ApplicationController
  def new
    @post = Post.new  
  end

  def create
    post = Post.new(post_params)
    post.save
    redirect_to '/top'
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:place_category_id, :genre_category_id, :gourme_name, :shop_name, :price, :content)
  end
end
