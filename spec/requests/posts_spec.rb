require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET /users/:id/posts' do
    before do
      get user_posts_path(user_id: 1)
    end

    it 'should return an HTTP status 200 (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return the correct placeholder text inside the response' do
      expect(response.body).to include("<h1>here's a list of posts for user </h1>")
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:id/posts/:id' do
    before do
      get user_post_path(user_id: 'some user_id', id: 'some post_id')
    end

    it 'should return an HTTP status 200 (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return the correct placeholder text inside the response' do
      expect(response.body).to include('<h1>This is post: some post_id from user: some user_id </h1>')
    end

    it 'should render the correct template' do
      expect(response).to render_template(:show)
    end
  end
end
