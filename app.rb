require_relative './lib/book'
require_relative './lib/label'
require_relative './lib/author'

class App
  def initialize
    @books = []
    @labels = []
    @authors = []
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
    if @books.count.zero?
      puts "There are not registered books. Please add one!\n\n"
    end
    @books.each do |item|
      puts "[#{item.class}] Publisher: #{item.publisher} Published date: #{item.publish_date} Cover_state: #{item.cover_state} Label: #{item.label.title}\n\n"
    end
  end

  def list_all_labels
    if @labels.count.zero?
      puts "There are not registered labels. Please add one!\n\n"
    end
    @labels.each do |item|
      puts "[#{item.class}] Name: #{item.title} Color: #{item.color}\n\n"
    end
  end

  def list_all_authors
    if @authors.count.zero?
      puts "There are not registered authors. Please add one!\n\n"
    end
    @authors.each do |item|
      puts "[#{item.class}] Name: #{item.first_name} #{item.last_name}\n\n"
    end
  end

  def add_book
    print 'Enter Author first name: '
    first_name = gets.chomp
    print 'Enter Author last name: '
    last_name = gets.chomp
    print 'Enter publish date: '
    publish_date = gets.chomp
    print 'Enter publisher: '
    publisher = gets.chomp
    print 'Whats the cover state of the book? '
    cover_state = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    print 'Enter a label for your item eg. Gift, New: '
    label_title = gets.chomp
    print 'Enter a color for your label: '
    label_color = gets.chomp
    label = Label.new(label_title, label_color)
    @labels << label
    book.label=label
    @books << book
    author = Author.new(first_name, last_name)
    @authors << author
    book.author=author
    puts
  end
end
