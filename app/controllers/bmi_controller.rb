class BmiController < ApplicationController
  before_action :authenticate_user!

  def bmi
    user = User.find(current_user.id)
    
    if user.height.present?
      @height = user.height
    else
      @height = 0
    end

    if user.weight_records.first.present?
      @weight = user.weight_records.order(date: :desc).first.weight
    else
      @weight = 0
    end

    @bmi = (@weight.to_f / ((@height.to_f / 100) ** 2)).round(2)

  end
end
