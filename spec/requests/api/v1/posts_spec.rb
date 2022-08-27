require 'swagger_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'api/v1/posts', type: :request do
  path '/api/v1/users/{user_id}/posts' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    let(:user) { create(:user) }

    before do
      user.confirm
    end

    get('list posts') do
      consumes 'application/json'
      produces 'application/json'
      security [bearerAuth: []]

      response(200, 'successful') do
        let(:Authorization) { Devise::JWT::TestHelpers.auth_headers({}, user)['Authorization'] }
        let(:user_id) { user.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end
end
