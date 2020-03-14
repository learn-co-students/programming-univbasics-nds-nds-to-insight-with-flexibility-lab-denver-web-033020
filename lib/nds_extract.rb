# Provided, don't edit
require 'directors_database'
require 'pry'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end

# Your code after this point

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  index = 0 # Index for the current movie
  while index < movies_collection.length do # While the index (current movie) is less than the length of the movies_collection array do...
    movies_collection[index][:director_name] = name # Extract the value (name) that :director_name key points to in movies_collection
                                                    # for the current movie (the index)
    index += 1 # Increment the movie index counter
  end
  movies_collection # Return movies collection array (of hashes of movies that have a :director_name key)
                    # MODIFIED movies_collection array
end

# collection = [{:title=>"Movie A", :studio=>"Alpha Films", :worldwide_gross=>10},
#  {:title=>"Movie B", :studio=>"Alpha Films", :worldwide_gross=>30},
#  {:title=>"Movie C", :studio=>"Omega Films", :worldwide_gross=>30}]

def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash

  studio_gross_total = {} # New hash for the :studio keys and their values
  index = 0 # Index of the current movie
  while index < collection.length do # While the index is less than the length of the collection
      movie_hash = collection[index] # Hash of the movies = index of the current movie from the collection
      # movie_hash = {:title=>"Movie A", :studio=>"Alpha Films", :worldwide_gross=>10}
      if studio_gross_total[movie_hash[:studio]] # If this key already exists
      studio_gross_total[movie_hash[:studio]] += movie_hash[:worldwide_gross] # Increment the count
    else # Otherwise
      studio_gross_total[movie_hash[:studio]] = movie_hash[:worldwide_gross] # Set the key
      # Adds/increments studio key to studio_gross_total hash += adds/increments gross value to studio_gross_total hash
      end
      index += 1 # Increment the current movie counter
  end
  studio_gross_total # Returns studio_gross_total
end

# => [{:name=>"Byron Poodle",thTheValueThatWasInName>)> source
#   :movies=>[{:title=>"At the park"}, {:title=>"On the couch"}]},
#  {:name=>"Nancy Drew", :movies=>[{:title=>"Biting"}]}]

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  #
  # Call movies_with_director_key for each director in the source array and return an array of those arrays
  movies_AoA = []
    index = 0
    while index < source.length do
      # binding.pry
      director_hash = source[index]
      movies_AoA << movies_with_director_key(director_hash[:name], director_hash[:movies])
    index += 1
    end
    movies_AoA
end


# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
