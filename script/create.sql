CREATE TABLE bikes (			
    bikenumber serial PRIMARY KEY,			
    durationall INT NULL,			
    tripall INT NULL			
);			
			
CREATE TABLE landmarks(			
    landmarkid serial primary key,			
    landmarkname varchar(255)			
);			
			
CREATE TABLE bikestations (			
    stationid serial primary key,    			
    stationname varchar(255) NULL,			
    latitude real  NULL,			
    longtitude real  NULL,			
    dockcount INT  NULL,			
    landmarkid INT NULL,			
    installdate timestamp NULL,			
    CONSTRAINT fk_bikestations_landmarkid FOREIGN KEY (landmarkid) REFERENCES landmarks(landmarkid)			
);			
			
			
CREATE TABLE bikestatus (			
    statusid serial primary key,			
    stationid int NULL,			
    bikesavailable int NULL,			
    docksavailable int NULL,			
    date date NULL,			
    time time NULL			
);			
			
CREATE TABLE biketrips (			
    tripid serial primary key,			
    duration int NULL,			
    startdate date NULL,			
    starttime time NULL,			
    startstationid int NULL,			
    enddate date NULL,			
    endtime time NULL,			
    endstationid int  NULL,			
    bikenumber int NULL,			
    zipcode char(5) NULL,			
    subscribertype varchar(255) NULL			
);			
