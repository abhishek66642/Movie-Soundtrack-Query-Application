drop table if exists Songs cascade;
drop table if exists Composers cascade;
drop table if exists Actors cascade;
drop table if exists Directors cascade;
drop table if exists titles cascade;
drop table if exists Movies cascade;
drop table if exists TVShows cascade;
drop table if exists Episodes cascade;
drop table if exists Ratings cascade;
drop table if exists Song_Composers cascade;
drop table if exists Songs_Episodes cascade;
drop table if exists Songs_Movies cascade;
drop table if exists Movie_Actors cascade;
drop table if exists Episode_Actors cascade;
drop table if exists Title_Genres cascade;


create table Songs (
    song_id varchar(32) primary key,
    song_name varchar(256) not null,
    preview_url varchar(256),
    album_art varchar(256),
    duration integer
);

create table Composers (
    composer_id varchar(64) primary key,
    composer_name varchar(256) not null,
    image_url varchar(256)
);

create table Actors (
    actor_id varchar(64) primary key,
    actor_name varchar(256) not null
);

create table Directors (
    director_id varchar(64) primary key,
    director_name varchar(256) not null
);

CREATE TABLE Titles (
    title_id varchar(32),
    title_type VARCHAR(64),

    CHECK (title_type = 'movie' OR title_type = 'tvSeries' OR title_type='tvEpisode'),
    primary key (title_id, title_type)
);

create table Movies (
    movie_name varchar(256) not null,
    movie_id varchar(32) primary key,
    imdb_url varchar(256),
    title_type VARCHAR not null default 'movie',
    release_year integer,
    runtime_minutes integer,
    director_id varchar(32) not null,
    foreign key (director_id) references Directors(director_id),
    FOREIGN KEY (movie_id, title_type) REFERENCES titles (title_id, title_type),
    CHECK (title_type  = 'movie'),
    unique(release_year,movie_name, director_id)
);

create table TVShows (
    show_name varchar(256) not null,
    tvshow_id varchar(32) primary key,
    imdb_url varchar(256),
    year_of_release integer,
    title_type VARCHAR not null default 'tvSeries',    
    unique(year_of_release,show_name),
    num_seasons integer,
    num_episodes integer,
    FOREIGN KEY (tvshow_id, title_type) REFERENCES titles (title_id, title_type),
    CHECK (title_type  = 'tvSeries')
 );

 CREATE TABLE Title_Genres(
    title_id VARCHAR(32),
    title_type VARCHAR(64),
    genre VARCHAR(128),
    PRIMARY KEY (title_id, title_type, genre),
    FOREIGN KEY (title_id, title_type) REFERENCES titles(title_id, title_type) on delete cascade
);

 create table Episodes (
     episode_id varchar(32),
     tvshow_id varchar(32),
     season_number integer,
     episode_number integer,
     episode_name varchar(256),
     airing_year integer,
     runtime_minutes integer,
     director_id varchar(32) not null,
     title_type VARCHAR not null default 'tvEpisode',
     primary key(episode_id,tvshow_id),
     foreign key(tvshow_id) references TVShows(tvshow_id) on delete cascade,
     CHECK (title_type  = 'tvEpisode'),
     FOREIGN KEY (episode_id, title_type) REFERENCES titles (title_id, title_type),
     foreign key (director_id) references Directors(director_id)
 );

 create table Ratings (
     title_id varchar(32) NOT NULL,
     average_rating decimal,
     num_votes integer,
     title_type VARCHAR NOT NULL,
     primary key(title_id,title_type),
     foreign key (title_id, title_type) references titles(title_id, title_type)
 );

 create table Song_Composers (
    song_id varchar(32),
    composer_id varchar(32),
    primary key(song_id, composer_id),
    foreign key (song_id) references Songs(song_id),
    foreign key (composer_id) references Composers(composer_id)
);

create table Songs_Episodes (
    song_id varchar(32),
    description varchar(512),
    episode_id varchar(32),
    tvshow_id varchar(32),
    primary key (song_id, episode_id, tvshow_id),
    foreign key (song_id) references Songs(song_id),
    foreign key (episode_id, tvshow_id) references Episodes(episode_id, tvshow_id)
);

create table Songs_Movies (
    song_id varchar(32),
    movie_id varchar(32),
    description varchar(512),
    primary key (song_id, movie_id),
    foreign key (song_id) references Songs(song_id),
    foreign key (movie_id) references Movies(movie_id)
);

create table Movie_Actors (
    movie_id varchar(32),
    actor_id varchar(32),
    character_played varchar(256),
    primary key (actor_id, movie_id),
    foreign key (actor_id) references Actors(actor_id),
    foreign key (movie_id) references Movies(movie_id)
);

create table Episode_Actors (
    episode_id varchar(32),
    tvshow_id varchar(32),
    actor_id varchar(32),
    character_played varchar(256),
    primary key (actor_id, episode_id, tvshow_id),
    foreign key (actor_id) references Actors(actor_id),
    foreign key (episode_id, tvshow_id) references Episodes(episode_id, tvshow_id)
);
