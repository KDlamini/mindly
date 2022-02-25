require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.new(id: 5, name: 'Jack', bio: 'I love Rose', photo: '', posts_counter: 0)
    @post = Post.new(title: 'Titanic', text: 'It\'s the ice berg\'s fault', comments_counter: 6, likes_counter: 5,
                     author_id: @user.id)
    @comment = Comment.new(text: 'Very good movie', author_id: @user.id, post_id: @user.id)
  end

  describe 'validation tests' do
    it 'validates the author_id is present' do
      expect(@comment.author_id).to eq(5)
    end

    it 'validates the post_id is present' do
      expect(@comment.post_id).to eq(5)
    end

    it 'validates the comment exists' do
      expect(@comment.text).to eq('Very good movie')
    end
  end

  describe 'comemnt model methods tests' do
    it 'it should increment the post comments_counter' do
      @comment.save
      expect(@post.comments_counter).to eq(6)
    end
  end
end
