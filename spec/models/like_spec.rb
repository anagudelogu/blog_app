require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:author) { User.new(name: 'name', photo: 'photo', bio: 'bio') }
  let(:post) { Post.new(author:, title: 'title', text: 'text') }
  let(:like) { Like.new(author:, post:) }

  before do
    author.save
    post.save
    like.save
  end

  it 'should have an author' do
    expect(like).to have_attributes(author:)
  end
  it 'should be associated with a post' do
    expect(like).to have_attributes(post:)
  end

  describe '#update_likes_counter' do
    it "should add 1 to post's likes counter"
  end

  describe 'validations' do
    it 'should not be valid if author is not provided'
    it 'should not be valid if post is not provided'
  end
end
