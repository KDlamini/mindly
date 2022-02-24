class CommentsController < ApplicationController
  # GET /comments/new
  def new
    @comment = Comment.new
    set_comment
  end

  # GET /comments/1/edit
  def edit; end

  # POST /comments
  def create
    @current_user = User.find(params[:user_id])
    @comment = @current_user.comments.new(comment_params)
    set_comment

    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_post_path(@comment.author_id, @comment.post_id), notice: "Comment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  def update; end

  # DELETE /comments/1
  def destroy; end

  private
    def set_comment
      @comment.post_id = params[:post_id]
      @comment.author_id = params[:user_id]
    end

    def comment_params
      params.require(:comment).permit(:text, :post_id)
    end
end
