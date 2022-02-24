class LikesController < ApplicationController
  # POST /likes
  def create
    set_like
    @like = @current_user.likes.new(author_id: params[:user_id], post_id: params[:post_id])

    respond_to do |format|
      if @like.save
        format.html do
          redirect_to user_post_path(@like.author_id, @like.post_id), notice: 'You liked this post.'
        end
      end
    end
  end

  private

  def set_like
    @like = Like.new
    @current_user = User.find(params[:user_id])
  end
end
