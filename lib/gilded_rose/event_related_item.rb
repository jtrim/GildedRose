class EventRelatedItem < AppreciatingItem

  private

  def increment_quality
    @quality += quality_delta
    @quality = 0 if @sell_in < 1
    @quality = MAXIMUM_QUALITY if @quality > MAXIMUM_QUALITY
  end

  def quality_delta
    case
      when @sell_in < 5 then 3
      when @sell_in < 10 then 2
      else 1
    end
  end

end

