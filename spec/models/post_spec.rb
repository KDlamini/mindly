require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.new(name: 'Senzo', bio: 'I am a web developer', photo: '', posts_counter: 0)
    @post = Post.new(title: 'How to learn coding', text: 'Practice by doing projects', comments_counter: 0,
                     likes_counter: 0, author_id: @user.id)

    6.times { |i| Comment.new(text: "Comment #{i}", author_id: @user.id, post_id: @post.id) }

    @comments = Comment.where(post_id: @post.id).where(author_id: @user.id).all
  end

  describe 'user validation tests' do
    it 'validate the presence of the title' do
      @post.title = ''
      expect(@post).to_not be_valid
    end

    it 'validate the presence of the comments_counter' do
      @post.comments_counter = nil
      expect(@post).to_not be_valid
    end

    it 'validate the numericality of the comments_counter' do
      @post.comments_counter = 'two'
      expect(@post).to_not be_valid
    end

    it 'validate the presence of the likes_counter' do
      @post.likes_counter = nil
      expect(@post).to_not be_valid
    end

    it 'validate the numericality of the likes_counter' do
      @post.likes_counter = 'seven'
      expect(@post).to_not be_valid
    end

    it 'validate the presence of the author_id' do
      @post.author_id = nil
      expect(@post).to_not be_valid
    end
  end

  describe 'post model methods tests' do
    it 'returns the last 5 comments' do
      expect(@post.most_recent_comments).to eq(@comments.order('created_at DESC').limit(5))
    end
  end
end
