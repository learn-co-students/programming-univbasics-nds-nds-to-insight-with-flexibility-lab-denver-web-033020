# Provided, don't edit
require 'directors_database'

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
  index = 0
  array_of_movies = []
  while index < movies_collection.length do
    movie_info = movie_with_director_name(name, movies_collection[index])
    array_of_movies << movie_info
    index += 1
  end
  
  return array_of_movies
 
end


def gross_per_studio(collection)
  index = 0
  studio_money = {}
  while index < collection.length do
    studio_name = collection[index][:studio]  
    movie_money = collection[index][:worldwide_gross]
    if !studio_money[studio_name]
      studio_money[studio_name] = movie_money
    else
      studio_money[studio_name] += movie_money
    end
    index += 1
  end
  
  studio_money
  
end

def movies_with_directors_set(source)
  index = 0
  array_of_directors = []
  while index < source.length do
    director_name = source[index][:name]
    movies_collection = source[index][:movies]
    array_of_directors << movies_with_director_key(director_name, movies_collection)
    index += 1
  end
  return array_of_directors
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
