require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'should have an author'
  it 'should be associated with a post'

  describe '#update_likes_counter' do
    it "should add 1 to post's likes counter"
  end

  describe 'validations' do
    it 'should not be valid if author is not provided'
    it 'should not be valid if post is not provided'
  end
end
