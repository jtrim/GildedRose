class DepreciatingItem < Item

  def age
    @sell_in -= 1
    decrement_quality unless @quality == 0
  end

  private

  def decrement_quality
    amount = (@sell_in < 1) ? 2 : 1
    @quality -= amount
  end

end
