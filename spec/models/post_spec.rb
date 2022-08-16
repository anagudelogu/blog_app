require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { build(:user) }
  let(:post) { Post.new(author:, title: 'title', text: 'text') }

  before do
    author.save
    post.save
  end

  it 'should have an author' do
    expect(post).to have_attributes(author:)
  end

  it 'should have a title' do
    expect(post).to have_attributes(title: 'title')
  end

  it 'should have text' do
    expect(post).to have_attributes(text: 'text')
  end

  describe '#update_post_counter' do
    it "should add 1 to the author's postscounter" do
      # When a Post gets created this counter increments, so we created one earlier
      # and expect the counter to be 1 at this point.
      expect(author.postscounter).to eq(1)
      post.update_post_counter
      expect(author.postscounter).to eq(2)
    end
  end

  describe '#most_recent_comments' do
    before do
      10.times { create(:comment, author:, post:) }
    end

    it 'should return an array of comments' do
      comments = post.most_recent_comments.to_a
      expect(comments).to include(an_instance_of(Comment))
    end

    it 'should return an array with, at maximum, five elements' do
      comments = post.most_recent_comments.to_a
      expect(comments.size).to be <= 5
    end
  end

  describe 'Validations' do
    it 'should not be valid if a title is not provided' do
      post.title = nil
      expect(post).not_to be_valid
    end

    it 'should not be valid if the title is exceeds 250 characters' do
      post.title = 'a' * 251
      expect(post).not_to be_valid
    end

    describe '@commentscounter' do
      it 'should be an Integer' do
        expect(post.commentscounter).to be_an(Integer)
      end

      it 'should not be valid if is less than 0' do
        post.commentscounter = -1
        expect(post).not_to be_valid
      end
    end

    describe '@likescounter' do
      it 'should be an Integer' do
        expect(post.likescounter).to be_an(Integer)
      end

      it 'should be greater than or equal to zero' do
        post.likescounter = -1
        expect(post).not_to be_valid
      end
    end
  end
end
