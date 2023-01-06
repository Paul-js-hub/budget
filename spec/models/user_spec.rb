require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Paul',
             email: 'paul@example.com',
             password: 'qwerty123')
  end
  before { subject.save }
  it 'has valid password' do
    expect(subject.valid_password?('qwerty123')).to be_truthy
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end

