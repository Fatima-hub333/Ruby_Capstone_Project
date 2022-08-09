require_relative 'item'
require_relative 'securerandom'

class Book
  def initialize(published_date, id = SecureRandom.uuid)
end
