require 'rails_helper'

RSpec.describe Expense, type: :model do
  @user = User.new(name: 'Paul', email: 'paul@example.com', password: 'qwerty123', password_confirmation: 'qwerty123')
  @category = Category.new(name: 'Category', icon: 'icon', user_id: @user.id)
  subject { Expense.new(name: 'name', amount: 20, user: @user, category: @category) }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end
