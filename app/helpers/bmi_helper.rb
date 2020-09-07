module BmiHelper
  
  def height_or_message(height:)
    height > 0 ? height.to_s : 'Please set Your height in Account page'
  end

  def weight_or_message(weight:)
    weight > 0 ? weight.to_s : 'Please add at least one weight record'
  end

end
