require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.new(name: 'name', photo: 'photo', bio: 'bio') }
  let(:post) { Post.new(author:, title: 'title', text: 'text') }

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
      expect(author.postscounter).to be_zero
      post.update_post_counter
      expect(author.postscounter).to eq(1)
    end
  end

  describe '#most_recent_comments' do
    it 'should return an array of comments'
    it 'should return an array with, at maximum, five elements'
  end

  describe 'Validations' do
    it 'should not be valid if a title is not provided'
    it 'should not be valid if the title is exceeds 250 characters'

    describe '@commentscounter' do
      it 'should be an Integer'
      it 'should be greater than or equal to zero'
    end

    describe '@likescounter' do
      it 'should be an Integer'
      it 'should be greater than or equal to zero'
    end
  end
end
