require_relative '../../library/book'
require 'date'

describe 'A book' do
  date = DateTime.new(2015, 12, 25)
  let(:book) { Book.new date, 'the-item-id' }

  it 'should be an instance of the item' do
    expect(book.is_a?(Item)).to be true
end

  