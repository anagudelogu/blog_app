require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:author) { build(:user) }
  let(:post) { build(:post, author:) }
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
      # When a Like gets created this counter increments, so we created one earlier
      # and expect the counter to be 1 at this point.
      expect(post.commentscounter).to eq(1)
      comment.update_comments_counter
      expect(post.commentscounter).to eq(2)
    end
  end

  describe 'Validations' do
    it 'should not be valid if author is not provided' do
      comment.author = nil
      expect(comment).not_to be_valid
    end

    it 'should not be valid if post is not provided' do
      comment.post = nil
      expect(comment).not_to be_valid
    end
    it 'should not be valid if text is not provided' do
      comment.text = nil
      expect(comment).not_to be_valid
    end
  end
end
