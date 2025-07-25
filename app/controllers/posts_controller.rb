class PostsController < ApplicationController
  def new
    @post = Post.new  
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.published.includes(:place_category, :genre_category)
    if params[:place_category_id].present?
      @posts = @posts.where(place_category_id: params[:place_category_id])
    end
    if params[:genre_category_id].present?
      @posts = @posts.where(genre_category_id: params[:genre_category_id])
    end
    @posts = @posts.page(params[:page]).reverse_order.per(10)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.page(params[:page]).per(10).reverse_order
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def confirm
    @posts = current_user.posts.draft.page(params[:page]).reverse_order
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :place_category_id, :genre_category_id, :gourme_name, :shop_name, :price, :content, :image, :status)
  end
end
