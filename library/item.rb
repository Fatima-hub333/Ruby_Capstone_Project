require 'date'

class Item
  attr_reader :id
  attr_accessor :publish_date, :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def label=(label)
    @label = label
    label.items << self
  end

  def author=(author)
    @author = author
    author.items << self
  end

  private

  def can_be_archived?
    Date.today.year - @publish_date.year > 10
  end
end
