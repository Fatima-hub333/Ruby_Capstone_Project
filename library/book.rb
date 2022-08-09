require_relative 'item'
require_relative 'securerandom'

class Book < item
  def initialize(published_date, id = securerandom.uuid)
    super(published_date, id)
    @cover_state = 'bad'
  end
end
