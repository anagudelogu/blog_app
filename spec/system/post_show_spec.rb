require 'rails_helper'

RSpec.describe 'In User post show page', type: :system do
  check "I can see the post's title."
  check 'I can see who wrote the post.'
  check 'I can see how many comments it has.'
  check 'I can see how many likes it has.'
  check 'I can see the post body.'
  check 'I can see the username of each commentor.'
  check 'I can see the comment each commentor left.'
end
