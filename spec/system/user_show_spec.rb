require 'rails_helper'

RSpec.describe 'In the User show page', type: :system do
  let(:u) { build(:user) }
  let(:p1) { build(:post, author: u, title: 'Title') }

  before do
    u.save
    5.times { create(:post, author: u) }
    p1.save
    visit user_path(u)
  end

  check "I can see the user's profile picture, username, number of posts and bio" do
    expect(page).to have_xpath("//img[@src='#{u.photo}']")
    expect(page).to have_text(u.name)
    expect(page).to have_text(/posts: #{u.postscounter}/i)
    expect(page).to have_text(u.bio)
  end

  check "I can see the user's first 3 posts." do
    within('div#posts-container') do
      expect(all('a').size).to eq(3)
    end
  end

  check "I can see a button that lets me view all of a user's posts." do
    expect(page).to have_link('See all posts')
  end

  context "when I click a user's post" do
    check "I'm redirected to that post's show page." do
      within('div#posts-container') do
        click_on p1.title
      end

      expect(page).to have_current_path(user_post_path(u, p1))
    end
  end

  context 'when I click to see all posts' do
    check "I'm redirected to the user's post's index page." do
      click_on 'See all posts'

      expect(page).to have_current_path(user_posts_path(u))
    end
  end
end
