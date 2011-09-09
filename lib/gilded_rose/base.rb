class GildedRose

  @items = []

  def initialize
    @items = []
    @items << DepreciatingItem.new("+5 Dexterity Vest", 10, 20)
    @items << AppreciatingItem.new("Aged Brie", 2, 0)
    @items << DepreciatingItem.new("Elixir of the Mongoose", 5, 7)
    @items << LegendaryItem.new("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << EventRelatedItem.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << ConjuredItem.new("Conjured Mana Cake", 3, 6)
  end

  def update_quality
    @items.each &:age
  end

end

