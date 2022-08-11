require_relative 'book'
require_relative 'label'
require_relative 'author'
require_relative 'storage'

class App
  def initialize
    @storage = Storage.new
    @storage.init_books
    @storage.init_labels
    @storage.init_authors
  end

  def greeter
    print "Hello! Welcome to Stockify!\n\n"
  end

  def instructions
    puts "Please choose an option by entering a number:
    1 - List all books
    2 - List all labels (e.g. 'Gift', 'New')
    3 - List all authors
    4 - Add a book
    5 - Exit"
    puts
  end

  def list_all_books
    @storage.list_all_books
  end

  def list_all_labels
    @storage.list_all_labels
  end

  def list_all_authors
    @storage.list_all_authors
  end

  def add_book
    @storage.add_book
  end
end
