# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'pry-byebug'

puts "creating database..."

data = JSON.parse(URI.open("http://tmdb.lewagon.com/movie/top_rated").read)
results = data["results"].take(10)

results.each do |result|
  movie = Movie.new(
    title: result["title"],
    overview: result["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500/#{result["backdrop_path"]}",
    rating: result["vote_average"]
  )
  movie.save
  puts "creating #{movie.id} with #{movie.title}"
end

puts "finished"



  # create_table "movies", force: :cascade do |t|
  #   t.string "title"
  #   t.text "overview"
  #   t.string "poster_url"
  #   t.integer "rating"
