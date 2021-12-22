DROP DATABASE IF EXISTS CoViD-19;
CREATE DATABASE CoViD-19;
USE CoViD-19;

DROP TABLE IF EXISTS User;
CREATE TABLE User(
    username VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    admin BOOLEAN NOT NULL,
    PRIMARY KEY (username)
);

DROP TABLE IF EXISTS POI;
CREATE TABLE POI(
    id VARCHAR (50) NOT NULL,
    name VARCHAR (30) NOT NULL,
    address VARCHAR(50) NOT NULL,
    type VARCHAR,
    lat FLOAT,
    lon FLOAT,
    rating FLOAT,
    rating_n INT,
    current_popularity INT,
    Monday VARCHAR (50),
    Tuesday VARCHAR (50),
    Wednesday VARCHAR (50),
    Thursday VARCHAR (50),
    Friday VARCHAR (50),
    Saturday VARCHAR (50),
    Sunday VARCHAR (50),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Cases;
CREATE  TABLE Cases(
    user VARCHAR (45),
    diagnosis DATE,
    FOREIGN KEY (user) REFERENCES User(username)
);

DROP TABLE IF EXISTS Visit;
CREATE TABLE Visit(
    user VARCHAR (45),
    poi VARCHAR (50),
    visitTime DATETIME,
    timeSpent INT,
    FOREIGN KEY (user) REFERENCES User (username),
    FOREIGN KEY (poi) REFERENCES POI (id)
);