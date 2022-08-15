require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET /users' do
    before do
      get users_path
    end

    it 'should return an HTTP status 200 (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return the correct placeholder text inside the response' do
      expect(response.body).to include("<h1>here's a list of users</h1>")
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:id' do
    before do
      get user_path(id: 'id')
    end

    it 'should return an HTTP status 200 (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return the correct placeholder text inside the response' do
      expect(response.body).to include("<h1>Here's user id </h1>")
    end

    it 'should render the correct template' do
      expect(response.body).to render_template(:show)
    end
  end
end
