require 'rails_helper'

RSpec.describe 'In the users index page', type: :system do
  let(:u) { build(:user) }
  before do
    u.save
    3.times { create(:post, author: u) }
    visit users_path
  end

  check 'I can see the username of all other users.' do
    expect(page).to have_text(u.name)
  end

  check 'I can see the profile picture for each user.' do
    expect(page).to have_xpath("//img[@src='#{u.photo}']")
  end

  check 'I can see the number of posts each user has written.' do
    expect(page).to have_text(/posts: #{u.postscounter}/i)
  end

  context 'when I click on an user' do
    check "I'm redirected to that user's show page" do
      click_on u.name
      expect(page).to have_current_path(user_path(u))
    end
  end
end
