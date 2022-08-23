require 'rails_helper'

RSpec.describe 'In the User posts index page', type: :system do
  check "I can see the user's profile picture, username and number of posts"
  check "I can see a post's title."
  check "I can see some of the post's body."
  check 'I can see the first comments on a post.'
  check 'I can see how many comments a post has.'
  check 'I can see how many likes a post has.'
  check 'I can see a section for pagination if there are more posts than fit on the view.'
  context 'when I click on a post' do
    check "I'm redirected to that post's show page."
  end
end
