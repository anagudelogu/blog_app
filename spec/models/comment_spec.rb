require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:author) { User.new(name: 'name', photo: 'photo', bio: 'bio') }
  let(:post) { Post.new(author:, title: 'title', text: 'text') }
  let(:comment) { Comment.new(author:, post:, text: 'text') }

  before do
    author.save
    post.save
    comment.save
  end

  it 'should have an author' do
    expect(comment).to have_attributes(author:)
  end

  it 'should have be associated with a post' do
    expect(comment).to have_attributes(post:)
  end
  it 'should have text' do
    expect(comment).to have_attributes(text: 'text')
  end

  describe '#update_comments_counter' do
    it "should add 1 to post's commentscounter" do
      expect(post.commentscounter).to be_zero
      comment.update_comments_counter
      expect(post.commentscounter).to eq(1)
    end
  end

  describe 'Validations' do
    it 'should not be valid if author is not provided'
    it 'should not be valid if post is not provided'
    it 'should not be valid if text is not provided'
  end
end
