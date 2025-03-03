require 'csv'

csv_file = Rails.root.join('db', 'movies_large.csv')

CSV.foreach(csv_file, headers: true) do |row|
  Movie.create!(
    title: row['Name'],  
    release_year: row['Year of Production'].to_i,  
    genre: row['Genre'],
    director: row['Director'],
    description: row['Description'], 
  )
end

puts "✅ Movies imported successfully!"
