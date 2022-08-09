require_relative 'item'

class Book < Item
  attr_accessor :publish_date, :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state.downcase
  end

  def can_be_archived?
    Date.today.year - @publish_date.year > 10 || @cover_state == 'bad'
  end 

end
