require 'rails_helper'

RSpec.describe Playlist, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
  end
  describe 'relationships' do
    xit {should have_many(:songs)}
    xit {should have_many(:playlist_users)}
    xit {should have_many(:users).through(:playlist_users)}
  end
end
