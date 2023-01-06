require 'rails_helper'

describe 'the transactions page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Paul', email: 'paul1@example.com', password: 'qwerty123',
                        password_confirmation: 'qwerty123')
    @category = @user.categories.create(name: 'Housing', icon: 'icon')
    visit new_user_session_path

    fill_in 'Email', with: 'paul1@example.com'
    fill_in 'Password', with: 'qwerty123'
    click_button 'Log in'

    visit(categories_path)
    click_link 'Housing'
  end

  it 'has housing category that when clicked opens the transaction page' do
    expect(page).to have_text('Transactions')
  end

  it 'has housing category that when clicked opens the transaction page' do
    expect(page).to have_text('Add a new transaction')
  end

  it 'has housing category that when clicked opens the transaction page' do
    expect(page).to have_text('TOTAL PAYMENT')
  end

  it 'has housing category that when clicked opens the transaction page' do
    expect(page).to have_text("You don't have transactions here yet.")
  end

  it 'links to create new transaction page' do
    visit new_category_expense_path(@category)
    expect(page).to have_content('Create a new Transaction:')
  end
end
