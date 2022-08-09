require_relative 'item'
require_relative 'securerandom'

class Book < Item
  def initialize(published_date, id = SecureRandom.uuid)
  super(published_date, id)
  @cover_state = 'bad'
  end
end
