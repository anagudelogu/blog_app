require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'name', photo: 'photo', bio: 'bio') }
  before { user.save }

  it 'should have a name' do
    expect(user).to have_attributes(name: 'name')
  end

  it 'should have a photo' do
    expect(user).to have_attributes(photo: 'photo')
  end

  it 'should have a bio' do
    expect(user).to have_attributes(bio: 'bio')
  end

  describe 'Validations' do
    it 'should not be valid if a name is not provided'

    describe '@postscounter' do
      it 'should be an integer'
      it 'should be greater than or equal than 0'
    end
  end
end
