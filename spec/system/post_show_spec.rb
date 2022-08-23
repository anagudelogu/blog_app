require 'rails_helper'

RSpec.describe 'In User post show page', type: :system do
  let(:u) { build(:user, name: 'Author') }
  let(:p1) { build(:post, author: u, title: 'Title') }
  let(:c) { build(:comment, post: p1, text: 'This is the most recent comment') }

  before do
    u.save
    p1.save
    6.times { create(:comment, post: p1, text: 'comment') }
    c.save
    visit user_post_path(u, p1)
  end

  check "I can see the post's title." do
    expect(page).to have_text(p1.title)
  end

  check 'I can see who wrote the post.' do
    expect(page).to have_text(p1.author.name)
  end

  check 'I can see how many comments it has.' do
    expect(page).to have_text(/comments: #{p1.commentscounter}/i)
  end

  check 'I can see how many likes it has.' do
    within('div#like-btn') do
      expect(page).to have_text(p1.likescounter)
    end
  end

  check 'I can see the post body.' do
    expect(page).to have_text(p1.text)
  end

  check 'I can see the username of each commentor.' do
    within('ul') do
      expect(all('li.comment').first).to have_text(c.author.name)
    end
  end

  check 'I can see the comment each commentor left.' do
    within('ul') do
      expect(all('li.comment').first).to have_text(c.text)
    end
  end
end
