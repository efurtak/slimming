# == Schema Information
#
# Table name: weight_records
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  date       :date
#  weight     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class WeightRecord < ApplicationRecord
  belongs_to :user

  validates :date, :weight, presence: true
  validates :weight, numericality: { greater_than: 0 }
end
