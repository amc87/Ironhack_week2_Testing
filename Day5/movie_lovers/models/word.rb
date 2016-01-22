require "pry"
require "imdb"

class Word
	attr_accessor :quantity, :title, :displayed_movies

	def initialize
		@displayed_movies = []
	end

	def searching(word)
		@word = word
		@search = Imdb::Search.new(@word)
	end

	def display_9
		@search.movies[0..15].each do |movie|
			movie_profile = Imdb::Movie.new(movie.id)
			if @displayed_movies.length < 9 && movie_profile.poster != nil
				@displayed_movies.push(movie_profile)
			end
		end
	end
end

class Answer

	def initialize(right_answer, players_answer)
		@right_answer = right_answer
		@players_answer = players_answer
	end

	def comparing
		if @right_answer == @players_answer
			"Right"
		else
			"Wrong"
		end
	end

end