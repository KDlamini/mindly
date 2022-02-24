class PostsController < ApplicationController
  # GET /users/posts
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  # GET /users/1/posts/1
  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id]).where(author_id: params[:user_id])
  end

  # GET /users/1/posts/new
  def new
    @post = Post.new
  end

  # POST /posts or /posts.json
  def create
    @current_user = User.find(params[:user_id])
    @post = @current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_posts_path, notice: "Post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text, :likes_counter, :comments_counter)
  end

  def reference_params
    @post.author_id = params[:user_id]
  end
end
