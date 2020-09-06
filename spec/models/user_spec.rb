# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  height                 :integer
#  preferred_weight       :float
#
require 'rails_helper'

describe User, 'Is valid user', type: :model do
  it 'Is expected to have: first name, last name, email and password' do
    user = User.new
    user.first_name = 'Jan'
    user.last_name = 'Kowalski'
    user.email = 'jkowalski@example.com'
    user.password = 'password'
    
    expect(user).to be_valid
  end

  it 'Have integer height' do
    user = User.new
    user.first_name = 'Jan'
    user.last_name = 'Kowalski'
    user.email = 'jkowalski@example.com'
    user.password = 'password'

    user.height = 180
    
    expect(user).to be_valid
  end

  it 'Have integer preferred weight' do
    user = User.new
    user.first_name = 'Jan'
    user.last_name = 'Kowalski'
    user.email = 'jkowalski@example.com'
    user.password = 'password'

    user.preferred_weight = 120
    
    expect(user).to be_valid
  end

  it 'Have floating point preferred weight' do
    user = User.new
    user.first_name = 'Jan'
    user.last_name = 'Kowalski'
    user.email = 'jkowalski@example.com'
    user.password = 'password'

    user.preferred_weight = 120.5
    
    expect(user).to be_valid
  end

  it 'Have unique email' do
    user = User.new
    user.first_name = 'Jan'
    user.last_name = 'Kowalski'
    user.email = 'jkowalski@example.com'
    user.password = 'password'
    user.save
    expect(user).to be_valid

    user2 = User.new
    user2.first_name = 'Jan'
    user2.last_name = 'Kowalski'
    user2.email = 'jan.kowalski@example.com'
    user2.password = 'password'
    expect(user2).to be_valid    
  end
end

describe User, 'Is invalid user', type: :model do
  it 'Dont have first name' do
    user = User.new
    user.first_name = nil
    user.last_name = 'Kowalski'
    user.email = 'jkowalski@example.com'
    user.password = 'password'
    
    expect(user).not_to be_valid
  end

  it 'Dont have last name' do
    user = User.new
    user.first_name = 'Jan'
    user.last_name = nil
    user.email = 'jkowalski@example.com'
    user.password = 'password'
    
    expect(user).not_to be_valid
  end

  it 'Dont have email' do
    user = User.new
    user.first_name = 'Jan'
    user.last_name = 'Kowalski'
    user.email = nil
    user.password = 'password'
    
    expect(user).not_to be_valid
  end

  it 'Dont have password' do
    user = User.new
    user.first_name = 'Jan'
    user.last_name = 'Kowalski'
    user.email = 'jkowalski@example.com'
    user.password = nil
    
    expect(user).not_to be_valid
  end

  it 'Dont have unique email' do
    user = User.new
    user.first_name = 'Jan'
    user.last_name = 'Kowalski'
    user.email = 'jkowalski@example.com'
    user.password = 'password'
    user.save
    expect(user).to be_valid

    user2 = User.new
    user2.first_name = 'Jan'
    user2.last_name = 'Kowalski'
    user2.email = 'jkowalski@example.com'
    user2.password = 'password'
    expect(user2).not_to be_valid    
  end
end
