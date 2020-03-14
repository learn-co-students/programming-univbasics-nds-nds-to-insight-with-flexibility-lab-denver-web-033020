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
  array=[]
  i=0 
  while i<movies_collection.length do
    movie_data=movies_collection[i]
    array.push(movie_with_director_name(name, movie_data))
    i+=1
  end
  array
end

  #dir_name_key = movie_with_director_name(name, movie_data)
  #dir_name_key[:director_name]
  
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
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method


def gross_per_studio(collection)
  gross_hash = {}
  hash_index=0 
  while hash_index<collection.length do 
    studio_name= collection[hash_index][:studio]
   if gross_hash[studio_name]
     gross_hash[studio_name]+=collection[hash_index][:worldwide_gross]
   else
   gross_hash[studio_name]= collection[hash_index][:worldwide_gross]
   
  end
   hash_index+=1
  end
  gross_hash
end
    
 #ALTERNATIVE SOLUTION 
  #alpha_films_key = collection[0][:studio] #=> "Alpha Films"
 # alpha_films_v1 = collection[0][:worldwide_gross] #=> 10
  #alpha_films_v2 = collection[1][:worldwide_gross] #=> 30
  #total_value_alpha = alpha_films_v1 + alpha_films_v2 #=>40
  #omega_films_key = collection[2][:studio] #=> "Omega Films"
  #omega_films_value= collection[2][:worldwide_gross]#=>30
  
 # gross_hash[alpha_films_key]= total_value_alpha
  #gross_hash[omega_films_key]= omega_films_value
  
  #gross_hash
  

  
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

def movies_with_directors_set(source)
  a_o_a=[]
  dir_index=0 
  while dir_index<source.length do
    dir_hash=source[dir_index]
    dir_hash_name = dir_hash[:name]
    dir_hash_movies=dir_hash[:movies]
    a_o_a.push(movies_with_director_key(dir_hash_name, dir_hash_movies))
    dir_index+=1
  end
  a_o_a
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
 
 
# source[director_hash][:movies] use the other method and insert the output there. 

#SOURCE PRINTED OUT
#[{:name=>"Byron Poodle",sInName>)> source
#:movies=>[{:title=>"At the park"}, {:title=>"On the couch"}]},
#{:name=>"Nancy Drew", :movies=>[{:title=>"Biting"}]}]
 
#RESULT WE WANT
#[{:title=>"At the park",:director_name:"Byron Poodle"}, {:title=>"On the couch", director_name:"Byron Poodle"}]

#ANOTHER METHOD I WANT TO INCORPORATE
 #def movies_with_director_key(name, movies_collection)
  #array=[]
  #i=0 
  #while i<movies_collection.length do
    #movie_data=movies_collection[i]
    #array.push(movie_with_director_name(name, movie_data))
    #i+=1
  #end
  #array
  #binding.pry
#end

#OUTPUT OF MOVIES_WITH movies_with_director_key
#[{:title=>"TestA",
  #:worldwide_gross=>nil,
  #:release_year=>nil,
  #:studio=>nil,
  #:director_name=>"Byron Poodle"},
# {:title=>"TestB",
  #:worldwide_gross=>nil,
  #:release_year=>nil,
  #:studio=>nil,
  #:director_name=>"Byron Poodle"}]
  
# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
