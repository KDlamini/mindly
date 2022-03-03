class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  load_and_authorize_resource :user, :posts, :comments, :likes

  # GET /users/posts
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    @posts = @user.posts.paginate(page: params[:page], per_page: 4)
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
    @post.comments_counter = 0
    @post.likes_counter = 0

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_post_path(@post.author_id, @post), notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to user_posts_path, notice: 'Post was successfully removed.' }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :likes_counter, :comments_counter)
  end
end
