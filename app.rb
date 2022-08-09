require 'json'

require_relative 'book'
require_relative 'loaders'
require_relative 'serializers'

class App
  attr_reader :games, :authors

  include Serializers
  include Loaders

  def initialize
    @games = File.file?('data/games.json') ? load('data/games.json')['games'] : []
    @authors = File.file?('data/authors.json') ? load('data/authors.json')['authors'] : []
    @books = File.file?('data/books.json') ? load('data/books.json')['books'] : []
  end

  def call_input(first)
    puts "What would you like to do #{first ? 'first' : 'next'}? (1 - 10)"
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List of games'
    puts '4 - List all genres'
    puts '5 - List all labels'
    puts '6 - List all authors'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts '10 - Exit'
    gets.chomp.strip
  end

  def cases(command)
    return unless %w[1 3 6 7 9].include? command

    { '1' => -> { list_books },
      '3' => -> { list_games },
      '6' => -> { list_authors },
      '7' => -> { add_book },
      '9' => -> { add_game } }[command].call
  end

  def action(first)
    command = call_input(first)
    cases(command)
    command
  end

  def run
    puts 'Welcome, choose an option'
    command = action(true)
    save(@games, @authors, @books)
    while command != '10'
      puts ' '
      command = action(false)
      save(@games, @authors, @books)
    end
    puts ' '
    puts 'Leaving the catalogue... Goodbye!'
  end

  private

  def list_games
    if @games.empty?
      puts 'There are no games yet!'
      return
    end
    @games.each.with_index do |game, i|
      puts "#{i}) [Game] The #{game.genre} game by #{game.author} was released in #{game.published_date.to_date}."
    end
  end

  def add_game
    genre = [(print 'Genre: '), gets.rstrip][1]
    author = [(print 'Author: '), gets.rstrip][1]
    label = [(print 'Label: '), gets.rstrip][1]
    published_date = [(print 'Published date (yyyy-mm-dd): '), gets.rstrip][1]
    year, month, day = published_date.split('-')
    multiplayer = [(print 'Multiplayer: '), gets.rstrip][1]
    last_played_at = [(print 'Last played at (yyyy-mm-dd): '), gets.rstrip][1]
    year1, month1, day1 = last_played_at.split('-')
    begin
      game = Game.new(multiplayer, DateTime.new(year1.to_i, month1.to_i, day1.to_i),
                      DateTime.new(year.to_i, month.to_i, day.to_i))
      game.author = author
      game.genre = genre
      game.label = label
    rescue StandardError
      puts 'Could not create game with provided info!'
      return
    end
    puts 'Game created successfully!'
    @games << game
  end

  def list_authors
    if @authors.empty?
      puts 'There are no authors yet!'
      return
    end
    @authors.each.with_index do |author, i|
      puts "#{i}) [Author] The author is #{author}."
    end
  end

  def list_books
    if @books.empty?
      puts 'There are no books yet!'
      return
    end
    @books.each.with_index do |bk, i|
      puts "#{i}) [Game] The #{bk.genre} book by #{bk.author} was released in #{bk.published_date.to_date}."
    end
  end

  def add_book
    genre = [(print 'Genre: '), gets.rstrip][1]
    author = [(print 'Author: '), gets.rstrip][1]
    label = [(print 'Label: '), gets.rstrip][1]
    published_date = [(print 'Published date (yyyy-mm-dd): '), gets.rstrip][1]
    year, month, day = published_date.split('-')
    cover_state = [(print 'Cover state, (good or bad): '), gets.rstrip][1]
    begin
      book = Book.new(Date.new(year.to_i, month.to_i, day.to_i), cover_state)
      book.author = author
      book.genre = genre
      book.label = label
    rescue StandardError
      puts 'Could not create book with provided info!'
      return
    end
    puts 'Book created successfully!'
    @books << book
  end
end
