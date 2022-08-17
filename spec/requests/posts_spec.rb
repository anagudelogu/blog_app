require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  let(:author) { create(:author) }

  describe 'GET /users/:id/posts' do
    before do
      get user_posts_path(user_id: author.id)
    end

    it 'should return an HTTP status 200 (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:id/posts/:id' do
    let(:post) { create(:post, author:) }

    before do
      get user_post_path(user_id: author.id, id: post.id)
    end

    it 'should return an HTTP status 200 (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:show)
    end
  end
end
