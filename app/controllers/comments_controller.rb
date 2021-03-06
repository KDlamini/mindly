class CommentsController < ApplicationController
  before_action :authenticate_user!

  # GET /comments/new
  def new
    @comment = Comment.new
    set_comment
  end

  # GET /comments/1/edit
  def edit; end

  # POST /comments
  def create
    @comment = current_user.comments.new(comment_params)
    set_comment

    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to user_post_path(@comment.author_id, @comment.post_id), notice: 'Comment was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  def update; end

  # DELETE /comments/1
  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find_by(id: @comment.post_id)
    @comment.destroy!

    respond_to do |format|
      format.html { redirect_to user_post_path(current_user.id, @post.id), notice: 'Comment was successfully deleted.' }
    end
  end

  private

  def set_comment
    @comment.post_id = params[:post_id]
    @comment.author_id = current_user.id
  end

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
