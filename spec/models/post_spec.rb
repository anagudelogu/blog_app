require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'should have an author'
  it 'should have a title'
  it 'should have text'

  describe '#update_posts_counter' do
    it "should add 1 to the author's postscounter"
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
