require 'rails_helper'

RSpec.describe Category, type: :model do
  @user = User.new(name: 'Paul', email: 'paul@example.com', password: 'qwerty123', password_confirmation: 'qwerty123')
  subject { Category.new(name: 'name', icon: 'icon', user: @user) }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
