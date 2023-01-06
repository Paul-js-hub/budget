require 'rails_helper'

describe 'the sign up process', type: :feature do
  it 'signs me up' do
    visit new_user_registration_path
    within('#registration') do
      fill_in 'Name', with: 'Paul'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'qwerty123'
      fill_in 'Password confirmation', with: 'qwerty123'
    end
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  it "has the password's minimum 6 characters" do
    visit new_user_registration_path
    expect(page).to have_content 'Password (6 characters minimum)'
  end
end
