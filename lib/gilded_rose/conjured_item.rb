class ConjuredItem < Item

  def age
    @quality -= 2
    @sell_in -= 1
  end

end
