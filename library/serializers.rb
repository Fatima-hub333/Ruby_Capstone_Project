module Serializers
  def save(games, authors, books)
    files = [
      { name: 'games', payload: games },
      { name: 'authors', payload: authors },
      { name: 'books', payload: books }
    ]

    files.each do |file|
      File.open("data/#{file[:name]}.json", 'w') do |f|
        data_hash = { file[:name] => file[:payload] }
        json = JSON.pretty_generate(data_hash)
        f.write(json)
      end
    end
  end
end
