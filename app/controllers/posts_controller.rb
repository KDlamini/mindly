class PostsController < ApplicationController
  # GET /users/posts
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    @comments = Comment.new
  end

  # GET /users/1/posts/1
  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id]).where(author_id: params[:user_id])
  end
end
