require 'rails_helper'

RSpec.describe 'In the users index page', type: :system do
  check 'I can see the username of all other users.'
  check 'I can see the profile picture for each user.'
  check 'I can see the number of posts each user has written.'
  context "when I click on an user" do
    check "I'm redirected to that user's show page"
  end
end
