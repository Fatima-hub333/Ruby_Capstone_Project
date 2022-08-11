class Label
  attr_accessor :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title.downcase
    @color = color.downcase
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
