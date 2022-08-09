require_relative 'item'
require 'securerandom'

class Book < Item
  attr_reader :id
  attr_accessor :cover_state, :archived, :genre, :author, :label, :published_date

  def initialize(published_date, cover_state = 'good', id = SecureRandom.uuid, archived: false)
    super(published_date, id, archived: archived)
    @published_date = published_date
    @id = id
    @cover_state = cover_state
    move_to_archive
  end
end
