require 'sqlite3'

def db
    if @db == nil
        @db = SQLite3::Database.new('./db/db.sqlite')
        @db.results_as_hash = true
    end
    return @db
end

def drop_tables
    db.execute('DROP TABLE IF EXISTS movies')
end

def create_tables

    # db.execute('CREATE TABLE fruits(
    #     id INTEGER PRIMARY KEY AUTOINCREMENT,
    #     name TEXT NOT NULL,
    #     description TEXT
    # )')

    CREATE TABLE "movies" (
	"id"	INTEGER,
	"title"	TEXT,
	"year"	TEXT,
	"desc"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
    );

    CREATE TABLE "genre" (
	"id"	INTEGER,
	"name"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
    );

    CREATE TABLE "movie_genre" (
	"movie_id"	INTEGER,
	"genre_id"	INTEGER
    );


    CREATE TABLE "actors" (
        "id"	INTEGER,
        "name"	TEXT,
        PRIMARY KEY("id" AUTOINCREMENT)
    );

    CREATE TABLE "movie_actor" (
	"movie_id"	INTEGER,
	"actor_id"	INTEGER
    );

    CREATE TABLE "ratings" (
        "id"	INTEGER,
        "comment"	TEXT,
        "stars"	INTEGER,
        "movie_id"	TEXT,
        "user_id"	TEXT,
        PRIMARY KEY("id" AUTOINCREMENT)
    );

    CREATE TABLE "users" (
        "id"	INTEGER,
        "name"	TEXT,
        "username"	TEXT NOT NULL UNIQUE,
        "password"	TEXT,
        PRIMARY KEY("id" AUTOINCREMENT)
    );

end

def seed_tables

    # movie = [
    #     {name: 'Pear', description: 'a sweet, juicy, yellow or green fruit with a round base and slightly pointed top'},
    #     {name: 'Apple', description: 'a round, edible fruit having a red, green, or yellow skin'},
    #     {name: 'Banana', description: 'a long, curved fruit with a usually yellow skin and soft, sweet flesh inside'},
    #     {name: 'Orange', description: 'a round, orange-colored fruit that is valued mainly for its sweet juice'}
    # ]

    # fruits.each do |fruit|
    #     db.execute('INSERT INTO fruits (name, description) VALUES (?,?)', fruit[:name], fruit[:description])
    # end

    movies = [
        {title:'Star wars: The empire strikes back', year:'2008', desc:'rymden, slåss, pappor'},
        {title:'Lego filmen', year:'2014', desc:'the matrix fast lego'},
        {title:'The matrix ', year:'1990', desc:'legofilmen fast inte lego'},
        {title:'Pitch perfect', year:'2012', desc:'iconer'},
        {title:'Lego filmen 2', year:'2019', desc:'ånej'},
    ]

    movies.each do |movie|
        db.execute('INSERT INTO movies (title, year, desc) VALUES (?,?,?)', movie[:title], movie[:year], movie[:desc])
    end
end

drop_tables
create_tables
seed_tables
