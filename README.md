# Movie and Soundtrack Query Application
NYU Tandon CS-GY 6083 Database Systems Fall 2021 Project

# Project Description
• Build a database of popular movies, tv shows and some metadata on these like actors who acted in them, their ratings, the background music score played in them with scene descriptions.

• In most Movies and TV Shows we hear a wide range of tunes and background scores

• We want to create an application where the user can obtain information about the songs that are being played in the background of a particular scene in a movie or a TV Show, and additionally generate more insights from the data.

# Data Sources
• https://www.imdb.com/interfaces/ Imdb provides title data for personal and non- commercial use. We have mailed and asked their permission for using this data in an academic setting for the purposes of this project.

• https://www.tunefind.com/product/api-docs-v2#overview Tunefind is an online web service which contains songs and composer data of various Movies and TV Shows. They also provide a public API to query that data, and the free trial version of that would be more than enough for the purposes of this project.

# Running the project

## Install PostgresSQL psql, Start the postgres instance 

psql postgres

## Create a new Postgres user inside Postgres 

CREATE ROLE sample WITH LOGIN PASSWORD 'quoted password' [OPTIONS]

## Create a new database in Postgres

CREATE DATABASE sample_db;

## Install Python dependencies either using pip, conda or homebrew - streamlit, psycopg2

pip install streamlit,pyscopg2

## Run movie-and-soundtrack-query-application/populateDatabase.sh. 
This will populate the database with relevant tables and add data to them through the csv files.

## Run the streamlit dashboard 
Assuming you are in the streamlit_dashboard directory

streamlit run query_dashboard.py
 
# List of Entity Sets
Songs, Composers Actors, Directors, Titles, Movies, TVShows, Episodes, Title_Genres, Ratings

# Business Rules
• Composers can compose 0 or many songs.

• Each song can have multiple composers (should have at least one Artists).

• Each TV Show has at least one episode

• Each TV Show /Movie can have 0 or more ratings.

• Each movie has exactly one director.

• Each director has directed at least one movie.

• Each TV Show has at least one artist acting in it.

• An artist can act in multiple TV Shows

• A song can appear in multiple episodes/TV Shows/Movies

• Each movie/episode can have multiple Songs

• Each movie / tv show is a title, and each title is either a movie or a tv show.

# User Interaction with Database (Queries)
• Find the songs played in a particular movie along with some other attributes.

• Find songs played in a particular episode of a TV Show.

• Find composers who have played more than 3 songs for a particular TV Show

• List pairs of directors and actors who have collaborated in a TV Show at least 20 times

• List top 5 highest rated episodes of a TV Show along with Director info.

• List pairs of directors who have directed different episodes of the same TV Show.

• Find composers by genre and group them according to the TV Show/Movie genre they play in.

• Find songs with a particular word in the song title along with the tv show and episode they are played in.

• Find Movie/TV Show genres that a particular composer plays across
