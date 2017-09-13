####################################################
# Daniel Breitigan - Dalton Becker - Matt Mousetis #
#          Project 2 - World War 2 Database        #
###################################################

CREATE TABLE IF NOT EXISTS Nations (
     Name varchar(30) NOT NULL,
     Prisoner_Count int(8) DEFAULT NULL,
     Allies_Axis_Neutral varchar(15) DEFAULT NULL,
     Year_Entered int(4) DEFAULT NULL,
     Military_Size_Before int(10) DEFAULT NULL,
     Military_Size_After int(10) DEFAULT NULL,
     Theatre varchar(30) DEFAULT NULL,
     Territory_Gained_Or_Loss  varchar(30) DEFAULT NULL,
     PRIMARY KEY (Name)
);

CREATE TABLE IF NOT EXISTS Equipment (
     Equipment_ID int(5) NOT NULL AUTO_INCREMENT,
     Type varchar(30) DEFAULT NULL,
     Casualties_Inflicted int(10) DEFAULT NULL,
     Name varchar(30) DEFAULT NULL,
     Unique_To_Nation bool DEFAULT NULL,
     PRIMARY KEY (Equipment_ID)
);

CREATE TABLE IF NOT EXISTS Generals (
     General_ID int(5) NOT NULL AUTO_INCREMENT,
     Name varchar(30) DEFAULT NULL,
     Military_Branch varchar(30) DEFAULT NULL,
     Battalion varchar(30) DEFAULT NULL,
     Nation varchar(30) NOT NULL,
     PRIMARY KEY (General_ID),
     FOREIGN KEY (Nation) REFERENCES Nations(Name)
);

CREATE TABLE IF NOT EXISTS Leaders (
     Leader_ID int(5) NOT NULL AUTO_INCREMENT,
     Name varchar(30) DEFAULT NULL,
     START_DATE DATE DEFAULT NULL,
     END_DATE DATE DEFAULT NULL,
     Nation varchar(30) NOT NULL,
     PRIMARY KEY (Leader_ID),
     FOREIGN KEY (Nation) REFERENCES Nations(Name)
);

CREATE TABLE IF NOT EXISTS Medals (
     Medal_Name varchar(30) NOT NULL,
     Purpose varchar(200) DEFAULT NULL,
     PRIMARY KEY (Medal_Name)
);

CREATE TABLE IF NOT EXISTS Battles (
     Name varchar(40) NOT NULL,
     Location varchar(40) NOT NULL,
     Date DATE DEFAULT NULL,
     Victor varchar(30) DEFAULT NULL,
     PRIMARY KEY (Name, Location)
);

CREATE TABLE IF NOT EXISTS Fought_In (
     Fought_In_ID int(5) NOT NULL AUTO_INCREMENT,
     Nation varchar(30) NOT NULL,
     Battle varchar(40) NOT NULL,
     Location varchar(30) NOT NULL,
     Casualties int(7) DEFAULT NULL,
     FOREIGN KEY (Nation) REFERENCES Nations(Name),
     FOREIGN KEY (Battle) REFERENCES Battles(Name),
     PRIMARY KEY (Fought_In_ID)
);

CREATE TABLE IF NOT EXISTS Commands (
     General_ID int(5) NOT NULL,
     Name varchar(40) NOT NULL,
     Location varchar(40) NOT NULL,
     FOREIGN KEY (General_ID) REFERENCES Generals(General_ID),
     FOREIGN KEY (Name) REFERENCES Battles(Name),
     FOREIGN KEY (Location) REFERENCES Battles(Location),
     PRIMARY KEY (General_ID, Name)
);

CREATE TABLE IF NOT EXISTS Used (
     Name varchar(30) NOT NULL,
     Equipment_ID int(5) NOT NULL,
     FOREIGN KEY (Name) REFERENCES Nations(Name),
     FOREIGN KEY (Equipment_ID) REFERENCES Equipment(Equipment_ID)
);

CREATE TABLE IF NOT EXISTS Earned_Medal_General (
     General_ID int(5) NOT NULL,
     Medal_Name varchar(30) NOT NULL,
     FOREIGN KEY (General_ID) REFERENCES Generals(General_ID),
     FOREIGN KEY (Medal_Name) REFERENCES Medals(Medal_Name)
);

CREATE TABLE IF NOT EXISTS Earned_Medal_Leader (
     Leader_ID int(5) NOT NULL,
     Medal_Name varchar(30) NOT NULL,
     FOREIGN KEY (Leader_ID) REFERENCES Leaders(Leader_ID),
     FOREIGN KEY (Medal_Name) REFERENCES Medals(Medal_Name)
);
