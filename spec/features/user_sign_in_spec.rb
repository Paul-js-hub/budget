require 'rails_helper'

describe 'the signin process', type: :feature do
  before :each do
    User.create(name: 'Paul', email: 'paul@example.com', password: 'qwerty123')
  end

  it 'signs me in' do
    visit new_user_session_path
    within('#session') do
      fill_in 'Email', with: 'paul@example.com'
      fill_in 'Password', with: 'qwerty123'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it 'has remember me content' do
    visit new_user_session_path
    expect(page).to have_content 'Remember me'
  end

  it 'has log in content' do
    visit new_user_session_path
    expect(page).to have_content 'Log in'
  end
end
