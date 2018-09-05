require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:length)}
    it {should validate_presence_of(:bpm)}
    it {should validate_presence_of(:genre)}
    it {should validate_presence_of(:link)}
  end
  describe 'relationships' do
    it {should belong_to(:artist)}
    it {should have_many(:playlists)}
  end
end
