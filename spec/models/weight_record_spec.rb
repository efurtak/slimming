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
require 'rails_helper'

RSpec.describe WeightRecord, 'Is valid weight record', type: :model do
  it 'Is expected to have date and weight' do
    user = FactoryBot.create(:user)

    weight_record = user.weight_records.new
    weight_record.date = Date.new(2020, 9, 6)
    weight_record.weight = 120

    expect(weight_record).to be_valid
  end
end

RSpec.describe WeightRecord, 'Is invalid weight record', type: :model do
  it 'Is invalid without date' do
    user = FactoryBot.create(:user)

    weight_record = user.weight_records.new
    weight_record.date = nil
    weight_record.weight = 120

    expect(weight_record).not_to be_valid
  end

  it 'Is invalid without weight' do
    user = FactoryBot.create(:user)

    weight_record = user.weight_records.new
    weight_record.date = Date.new(2020, 9, 6)
    weight_record.weight = nil

    expect(weight_record).not_to be_valid
  end
end
