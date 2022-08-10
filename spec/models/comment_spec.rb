require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should have an author'
  it 'should have be associated with a post'
  it 'should have text'

  describe '#update_comments_counter' do
    it "should add 1 to post's commentscounter"
  end

  describe 'Validations' do
    it 'should not be valid if author is not provided'
    it 'should not be valid if post is not provided'
    it 'should not be valid if text is not provided'
  end
end
