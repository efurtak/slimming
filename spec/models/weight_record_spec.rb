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

RSpec.describe WeightRecord, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
