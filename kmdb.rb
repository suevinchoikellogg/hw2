# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!


### Table for Movie + Insert data  
Movie.destroy_all 
warner = Studio.find_by({"name" => "Warner Bros."})

movie = Movie.new 
movie["title"] = "Batman Begins" 
movie["year_released"] = "2005" 
movie["rated"] = "PG-13" 
movie["studio_id"] = warner["id"] 
movie.save 

movie = Movie.new 
movie["title"] = "The Dark Knight" 
movie["year_released"] = "2008" 
movie["rated"] = "PG-13" 
movie["studio_id"] = warner["id"]
movie.save 

movie = Movie.new 
movie["title"] = "The Dark Knight Rises" 
movie["year_released"] = "2012" 
movie["rated"] = "PG-13" 
movie["studio_id"] = warner["id"]
movie.save 

puts movie.inspect 



### Table for Studio + Insert data  

Studio.destroy_all 

studio = Studio.new 
studio["name"] = "Warner Bros." 
studio.save 

puts studio.inspect 



### Table for Actor + Insert data 

Actor.destroy_all 

actor = Actor.new 
actor["name"] = "Christian Bale" #1 
actor.save 

actor = Actor.new 
actor["name"] = "Michael Caine" #2 
actor.save 

actor = Actor.new 
actor["name"] = "Liam Neeson" #3 
actor.save 

actor = Actor.new 
actor["name"] = "Katie Holmes" #4 
actor.save 

actor = Actor.new 
actor["name"] = "Gary Oldman" #5 
actor.save 

actor = Actor.new 
actor["name"] = "Heath Ledger" #6 
actor.save 

actor = Actor.new 
actor["name"] = "Aaron Eckhart" #7 
actor.save 

actor = Actor.new 
actor["name"] = "Maggie Gyllenhaal" #8 
actor.save 

actor = Actor.new 
actor["name"] = "Tom Hardy" #9 
actor.save 

actor = Actor.new 
actor["name"] = "Joseph Gordon-Levitt" #10 
actor.save 

actor = Actor.new 
actor["name"] = "Anne Hathaway" #11 
actor.save 

# puts actor.inspect 



### Table for Role + Insert data 

Role.destroy_all 

batman_begins = Movie.find_by({"title" => "Batman Begins"})
dark_knignt = Movie.find_by({"title" => "The Dark Knight"})
dark_knight_rises = Movie.find_by({"title" => "The Dark Knight Rises"})

cristianb = Actor.find_by({"name" => "Christian Bale"})
michaelc = Actor.find_by({"name" => "Michael Caine"})
liamn = Actor.find_by({"name" => "Liam Neeson"})
katieh = Actor.find_by({"name" => "Katie Holmes"})
garyo = Actor.find_by({"name" => "Gary Oldman"})
heathl = Actor.find_by({"name" => "Heath Ledger"})
aarone = Actor.find_by({"name" => "Aaron Eckhart"})
maggieg = Actor.find_by({"name" => "Maggie Gyllenhaal"})
tomh = Actor.find_by({"name" => "Tom Hardy"})
josephgl = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
annh = Actor.find_by({"name" => "Anne Hathaway"})


### Batman Begins 
role = Role.new 
role["character_name"] = "Bruce Wayne" 
role["movie_id"] = batman_begins["id"]
role["actor_id"] = cristianb["id"]
role.save 

role = Role.new 
role["character_name"] = "Alfred" 
role["movie_id"] = batman_begins["id"]
role["actor_id"] = michaelc["id"]
role.save 

role = Role.new 
role["character_name"] = "Ra's Al Ghul" 
role["movie_id"] = batman_begins["id"]
role["actor_id"] = liamn["id"]
role.save 

role = Role.new 
role["character_name"] = "Rachel Dawes" 
role["movie_id"] = batman_begins["id"]
role["actor_id"] = katieh["id"]
role.save 

role = Role.new 
role["character_name"] = "Commissioner Gordon" 
role["movie_id"] = batman_begins["id"]
role["actor_id"] = garyo["id"]
role.save 


### The Dark Knight 
role = Role.new 
role["character_name"] = "Bruce Wayne" 
role["movie_id"] = dark_knignt["id"]
role["actor_id"] = cristianb["id"]
role.save 

role = Role.new 
role["character_name"] = "Joker" 
role["movie_id"] = dark_knignt["id"]
role["actor_id"] = heathl["id"]

role.save 
role = Role.new 
role["character_name"] = "Harvey Dent" 
role["movie_id"] = dark_knignt["id"]
role["actor_id"] = aarone["id"]
role.save 

role = Role.new 
role["character_name"] = "Alfred" 
role["movie_id"] = dark_knignt["id"]
role["actor_id"] = michaelc["id"]
role.save 

role = Role.new 
role["character_name"] = "Rachel Dawes" 
role["movie_id"] = dark_knignt["id"]
role["actor_id"] = maggieg["id"]
role.save 


### The Dark Knight Rises 
role = Role.new 
role["character_name"] = "Bruce Wayne" 
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = cristianb["id"]
role.save 

role = Role.new 
role["character_name"] = "Commissioner Gordon" 
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = garyo["id"]
role.save 

role = Role.new 
role["character_name"] = "Bane" 
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = tomh["id"]
role.save 

role = Role.new 
role["character_name"] = "John Blake" 
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = josephgl["id"]
role.save 

role = Role.new 
role["character_name"] = "Selina Kyle" 
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = annh["id"]
role.save 

# puts role.inspect 


# Prints a header for the movies output
puts "Movies"
puts "======"

deliverable_movie = Movie.all.each
for movies in deliverable_movie
    title = movies["title"]
    year_released = movies["year_released"]
    rated = movies["rated"]
    studio = movies["studio_id"]
    puts "#{title} #{year_released} #{rated} #{studio}"
end

# Query the movies data and loop through the results to display the movies output.
# TODO!


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"

deliverable_actor = Role.all.each
for roles in deliverable_actor
    title = roles["movie_id"]
    actor = roles["actor_id"]
    character = roles["character_name"]
    puts "#{title} #{actor} #{character}"
end

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
