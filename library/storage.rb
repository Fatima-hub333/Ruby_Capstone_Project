require_relative 'book'
require_relative 'label'
require_relative 'author'
require 'json'

class Storage
  def initialize
    unless File.exist?('./books.json')
      File.new('./books.json', 'w+')
      File.write('./books.json', [])
    end
    books_file = File.read('./books.json')
    books_data = JSON.parse(books_file)
    @books = books_data

    unless File.exist?('./labels.json')
      File.new('./labels.json', 'w+')
      File.write('./labels.json', [])
    end
    labels_file = File.read('./labels.json')
    labels_data = JSON.parse(labels_file)
    @labels = labels_data

    unless File.exist?('./authors.json')
      File.new('./authors.json', 'w+')
      File.write('./authors.json', [])
    end
    authors_file = File.read('./authors.json')
    authors_data = JSON.parse(authors_file)
    @authors = authors_data
  end

  # def list_all_books
  # end

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
    @labels << { 'title' => label.title.to_s, 'color' => label.color }
    book.label=label
    author = Author.new(first_name, last_name)
    @authors << { 'first_name' => author.first_name.to_s, 'last_name' => author.last_name.to_s } 
    book.author=author
    @books << { 'author' => book.author.to_s, 'publish_date' => book.publish_date.to_s, 'publisher' => book.publisher.to_s, 'cover_state' => book.cover_state.to_s }
    save_book
    save_label
    save_author
    puts 'Book stored successfully!'
    puts
  end 

  def save_book
    data = []
    @books.each do |book|
      data << ({ publish_date: book['publish_date'], publisher: book['publisher'], cover_state: book['cover_state'] })
    end
    File.open('books.json', 'w') { |f| f.puts data.to_json }
  end

  def save_label
    data = []
    @labels.each do |label|
      data << ({ title: label['title'], color: label['color'] })
    end
    File.open('labels.json', 'w') { |f| f.puts data.to_json }
  end

  def save_author
    data = []
    @authors.each do |author|
      data << ({ first_name: author['first_name'], last_name: author['last_name'] })
    end
    File.open('authors.json', 'w') { |f| f.puts data.to_json }
  end
end