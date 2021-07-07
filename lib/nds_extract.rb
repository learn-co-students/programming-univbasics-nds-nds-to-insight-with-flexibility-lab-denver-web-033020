# Provided, don't edit
require 'directors_database'
require "pp"
require "pry"

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
 new_array = []
 i = 0 
 while i< movies_collection.length
  movie_dir_name = movies_collection[i]
  new_array.push(movie_with_director_name(name, movie_dir_name))
  i+=1 
end
new_array
end


 # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
 
def gross_per_studio(collection)
  total_hash = {}
  movie_index =0 
  while movie_index < collection.length
   studio_name = collection[movie_index][:studio]
   studio_gross =collection[movie_index][:worldwide_gross]
      if total_hash.include? studio_name
         total_hash[studio_name]+= studio_gross
      else
      total_hash[studio_name]= studio_gross
    end
    movie_index+=1
  end
  total_hash
end




 # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.

def movies_with_directors_set(source)
  a_o_a =[]
  
  dir_index = 0
  while dir_index < source.length
    dir_hash = source[dir_index]
    dir_name = dir_hash[:name]
    dir_movies = dir_hash[:movies]
     a_o_a.push(movies_with_director_key(dir_name, dir_movies))
    dir_index +=1
  end
  a_o_a
end

# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
    
  
