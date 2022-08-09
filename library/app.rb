class App
  def call_input(first)
    puts "What would you like to do #{first ? 'first' : 'next'}? (1-13)"
    puts '1 - List all books'
    puts '2 - List all Music Albums'
    puts '3 - List all Movies'
    puts '4 - List all Games'
    puts '5 - List all Genres'
    puts '6 - List all Labels'
    puts '7 - List all Authors'
    puts '8 - List all Sources'
    puts '9 - Add a Book'
    puts '10 - Add a Music Album'
    puts '11 - Add a Movie'
    puts '12 - Add a Game'
    puts '13 - Exit'
    gets.chomp.strip
  end

  def cases(command)
    return unless %w[].include? command

    { 1 => -> {} }[command].call
  end

  def action(first)
    command = call_input(first)
    cases(command)
    command
  end

  def run
    puts 'Welcome, choose an option'
    command = action(true)
    while command != '13'
      puts ' '
      command = action(false)
    end
    puts ' '
    puts 'Leaving the Catalogue...GoodBye TakeCare!'
  end
end
