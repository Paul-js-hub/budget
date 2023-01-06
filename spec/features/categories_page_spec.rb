require 'rails_helper'

describe 'the categories page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Paul', email: 'paul1@example.com', password: 'qwerty123',
                        password_confirmation: 'qwerty123')
    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  it 'has category text content' do
    expect(page).to have_content 'Category'
  end

  it 'has sign out text' do
    expect(page).to have_content 'Sign Out'
  end

  it 'has Add new Category text' do
    expect(page).to have_content 'Add new Category'
  end
end
