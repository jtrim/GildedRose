class AppreciatingItem < Item
  MAXIMUM_QUALITY = 50

  def age
    @sell_in -= 1
    increment_quality
  end

  private

  def increment_quality
    @quality += 1 if @quality < MAXIMUM_QUALITY
  end

end
