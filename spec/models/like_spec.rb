require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:author) { build(:user) }
  let(:post) { build(:post, author:) }
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
    it "should add 1 to post's likes counter if created" do
      # When a Like gets created this counter increments, so we created one earlier
      # and expect the counter to be 1 at this point.
      expect(post.likescounter).to eq(1)
      u = create(:user)
      Like.create(author: u, post:)
      expect(post.likescounter).to eq(2)
    end

    it "should subtract 1 to post's likes counter if deleted" do
      expect(post.likescounter).to eq(1)
      like.destroy
      expect(post.likescounter).to eq(0)
    end
  end

  describe 'validations' do
    it 'should not be valid if author is not provided' do
      like.author = nil
      expect(like).not_to be_valid
    end

    it 'should not be valid if post is not provided' do
      like.post = nil
      expect(like).not_to be_valid
    end

    it "an user can't like the same post more than once" do
      like = Like.create(author:, post:)
      expect(like).not_to be_valid
    end
  end
end
