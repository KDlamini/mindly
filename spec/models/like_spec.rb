require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = User.new(id: 5, name: 'Vuma', bio: 'I am an entertainer', photo: '', posts_counter: 0)
    @post = Post.new(title: 'Why I love YouTube', text: 'Freedom of creation', comments_counter: 0, likes_counter: 6,
                     author_id: @user.id)
    @like = Like.new(author_id: @user.id, post_id: @user.id)
  end

  describe 'validation tests' do
    it 'validates the author_id exists' do
      expect(@like.author_id).to eq(5)
    end

    it 'validates the post_id exists' do
      expect(@like.post_id).to eq(5)
    end
  end

  describe 'like model methods tests' do
    it 'should increment the post likes_counter' do
      @like.save
      expect(@post.likes_counter).to eq(6)
    end
  end
end
