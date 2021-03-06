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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  validates :email, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates :height, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true, on: :update
  validates :preferred_weight, numericality: { greater_than: 0}, allow_blank: true, on: :update

  has_many :weight_records, dependent: :destroy
end
