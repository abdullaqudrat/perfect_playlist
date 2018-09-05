require 'rails_helper'

describe 'user sign up' do
  it 'allows visitor to register' do
    username = 'musiclover'

    visit root_path

    click_on 'Register'

    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: username
    fill_in :user_password, with: 'test'

    click_on 'Create User'

    expect(page).to have_content("Welcome, #{username}")
  end
  it "doesnt allow registration of a username already registered" do
    username = 'musiclover'
    User.create(username: username, password: 'test')

    visit new_user_path

    fill_in :user_username, with: username
    fill_in :user_password, with: 'test'

    click_on 'Create User'

    expect(page).to_not have_content("Welcome, #{username}")
    expect(page).to have_content("Register")
  end
end
