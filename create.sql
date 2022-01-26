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
    types VARCHAR (50),
    lat FLOAT,
    lng FLOAT,
    rating FLOAT,
    rating_n INT,
    current_popularity INT,
    day VARCHAR (15),
    data INT,
    time_spent INT,
    time_wait INT,
    PRIMARY KEY (id)
);

<<<<<<< Updated upstream
=======
DROP TABLE IF EXISTS ACTIVITY;
CREATE TABLE ACTIVITY(
	poiid VARCHAR (50) NOT NULL,
	day VARCHAR (10) NOT NULL,
	hour1 INT NOT NULL,
	hour2 INT NOT NULL,
	hour3 INT NOT NULL,
	hour4 INT NOT NULL,
	hour5 INT NOT NULL,
	hour6 INT NOT NULL,
	hour7 INT NOT NULL,
	hour8 INT NOT NULL,
	hour9 INT NOT NULL,
	hour10 INT NOT NULL,
	hour11 INT NOT NULL,
	hour12 INT NOT NULL,
	hour13 INT NOT NULL,
	hour14 INT NOT NULL,
	hour15 INT NOT NULL,
	hour16 INT NOT NULL,
	hour17 INT NOT NULL,
	hour18 INT NOT NULL,
	hour19 INT NOT NULL,	
	hour20 INT NOT NULL,
	hour21 INT NOT NULL,
	hour22 INT NOT NULL,
	hour23 INT NOT NULL,
	hour24 INT NOT NULL,
	FOREIGN KEY (poiid) REFERENCES POI(id)
);

>>>>>>> Stashed changes
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