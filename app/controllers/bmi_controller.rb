class BmiController < ApplicationController
  before_action :authenticate_user!

  def bmi
    user = User.find(current_user.id)
    
    @height = user.height || 0
    @weight = user.weight_records.date_desc.first.try(:weight) || 0

    if @height > 0 && @weight > 0
      @bmi = (@weight.to_f / ((@height.to_f / 100) ** 2)).round(2)
    end

  end
end
