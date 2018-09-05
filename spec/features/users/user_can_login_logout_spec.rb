require 'rails_helper'

describe 'user log in' do
  it 'allows visitor to login successfully' do
    username = 'musiclover'
    User.create(username: username, password: 'test')

    visit root_path

    click_on 'I already have an account'

    expect(current_path).to eq(login_path)

    fill_in :username, with: username
    fill_in :password, with: 'test'

    click_on 'Log In'

    expect(page).to have_content("Welcome, #{username}")
  end
  it 'allows visitor to not login if incorrect password' do
    username = 'musiclover'
    User.create(username: username, password: 'test')

    visit root_path

    click_on 'I already have an account'

    expect(current_path).to eq(login_path)

    fill_in :username, with: username
    fill_in :password, with: 'wrong'

    click_on 'Log In'

    expect(current_path).to eq(login_path)
    expect(page).to_not have_content("Welcome, #{username}")
    expect(page).to have_content("Log In")
  end
  it 'allows visitor to not login if incorrect username' do
    username = 'musiclover'
    User.create(username: username, password: 'test')

    visit root_path

    click_on 'I already have an account'

    expect(current_path).to eq(login_path)

    fill_in :username, with: 'musiclovee'
    fill_in :password, with: 'test'

    click_on 'Log In'

    expect(current_path).to eq(login_path)
    expect(page).to_not have_content("Welcome, #{username}")
    expect(page).to have_content("Log In")
  end
end
describe 'logout' do
  it 'user should be able to logout' do
    username = 'musiclover'
    User.create(username: username, password: 'test')

    visit login_path

    fill_in :username, with: username
    fill_in :password, with: 'test'

    click_on 'Log In'
    expect(page).to_not have_content('I already have an account')

    click_on 'Log Out'
    expect(current_path).to eq(root_path)
    expect(page).to have_content("I already have an account")
  end
end
