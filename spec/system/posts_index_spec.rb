require 'rails_helper'

RSpec.describe 'In the User posts index page', type: :system do
  let(:u) { build(:user) }
  let(:p1) { build(:post, author: u, title: 'Title') }

  before do
    u.save
    p1.save
    6.times { create(:comment, author: u, post: p1) }
    visit user_posts_path(u)
  end

  check "I can see the user's profile picture, username and number of posts" do
    expect(page).to have_xpath("//img[@src='#{u.photo}']")
    expect(page).to have_text(u.name)
    expect(page).to have_text(/posts: #{u.postscounter}/i)
  end

  check "I can see a post's title." do
    expect(page).to have_text(p1.title)
  end

  check "I can see some of the post's body." do
    expect(page).to have_text(/#{p1.text}/i)
  end

  check 'I can see the most recent comments on a post.' do
    within('ul') do
      expect(all('li.comment').size).to be <= 5
    end
  end

  check 'I can see how many comments a post has.' do
    within('div', id: p1.id.to_s) do
      expect(page).to have_text(/comments: #{p1.commentscounter}/i)
    end
  end

  check 'I can see how many likes a post has.' do
    within('div', id: p1.id.to_s) do
      expect(page).to have_text(/likes: #{p1.likescounter}/i)
    end
  end

  check 'I can see a section for pagination if there are more posts than fit on the view.' do
    expect(page).to have_text(/pagination/i)
  end
  context 'when I click on a post' do
    check "I'm redirected to that post's show page." do
      click_on p1.title

      expect(page).to have_current_path(user_post_path(u, p1))
    end
  end
end
