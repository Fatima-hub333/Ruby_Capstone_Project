require_relative 'item'
require 'securerandom'

class Book < Item
  def initialize(published_date)
    super(published_date)
    # @cover_state = 'bad'
  end
end
