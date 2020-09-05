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
end
