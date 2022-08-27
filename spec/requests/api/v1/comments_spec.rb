require 'swagger_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'api/v1/comments', type: :request do

  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'post_id', in: :path, type: :string, description: 'post_id'

    let(:user) { create(:user) }
    let(:p1) { create(:post, author: user) }

    before do
      user.confirm
    end

    get('list comments') do

      produces 'application/json'
      security [bearerAuth: []]

      response(200, 'successful') do
        let(:Authorization) { Devise::JWT::TestHelpers.auth_headers({}, user)['Authorization'] }
        let(:user_id) { user.id }
        let(:post_id) { p1.id }

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

    post('create comment') do
      consumes 'application/json'
      produces 'application/json'
      security [bearerAuth: []]

      response(201, 'created') do
        let(:Authorization) { Devise::JWT::TestHelpers.auth_headers({}, user)['Authorization'] }
        let(:user_id) { user.id }
        let(:post_id) { p1.id }

        parameter name: :params,
                  in: :body,
                  schema: {
                    type: :object,
                    properties: {
                      comment: {
                        type: :object,
                        properties: {
                          text: { type: :string }
                        },
                        required: [:text]
                      }
                    }
                  }
        
        let(:comment) { create(:comment, post: p1)}
        let(:params) { { comment: { text: comment.text } } }

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