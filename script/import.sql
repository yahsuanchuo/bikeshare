CREATE TABLE bikestatus_staging (			
    stationid int NULL,			
    bikesavailable int NULL,			
    docksavailable int NULL,			
    date date NULL,			
    time time NULL			
 );			
			
COPY bikestatus_staging FROM 'C:\Users\Amy Chuo\Desktop\sql\project\bike_status000000000000.txt'			
    WITH HEADER NULL 'NULL' DELIMITER '	' CSV;		
			
			
			
CREATE TABLE bikestations_staging (			
    stationid INT NULL,			
    stationname varchar(255) NULL,			
    Latitude  real NULL,			
    Longitude  real NULL,			
    dockcount INT NULL,			
    landmark varchar(255) NULL,			
    installdate timestamp NULL			
);	

COPY bikestations_staging FROM 'C:\Users\Amy Chuo\Desktop\sql\project\bikeshare_stations.txt'			
    WITH HEADER NULL 'NULL' DELIMITER '	' CSV;		
			
			
CREATE TABLE biketrips_staging (			
    tripid int NULL,			
    duration int NULL,			
    startdate date NULL,			
    starttime time NULL,			
    startstation varchar(255) NULL,			
    startstationid int NULL,			
    enddate date NULL,			
    endtime time NULL,			
    endstation varchar(255) NULL,			
    endstationid int  NULL,			
    bikenumber int NULL,			
    zipcode char(5) NULL,			
    subscribertype varchar(255) NULL			
);			
			
COPY biketrips_staging FROM 'C:\Users\Amy Chuo\Desktop\sql\project\biketrips.txt'			
    WITH HEADER NULL 'NULL' DELIMITER '	' CSV;		
