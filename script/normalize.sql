INSERT INTO bikes (bikenumber, durationall, tripall)													
    select bikenumber::int, sum(duration::int) as durationall, count(*) as tripall 													
    from biketrips_staging													
    group by bikenumber													
													
INSERT INTO landmarks(landmarkname)													
    select distinct landmark													
    from bikestations_staging													
													
													
INSERT INTO bikestations(stationid, stationname, latitude, longtitude, dockcount, landmarkid, installdate) 													
    select a.stationid, a.stationname, a.latitude, a.longitude, a.dockcount, l.landmarkid,  a.installdate													
    from(													
         select bs.stationID, bs.stationname, bs.latitude, bs.longitude, bs.dockcount, bs.landmark, bs.installdate, 													
         row_number() over(partition by stationid) as sequm													
         from bikestations_staging bs) a LEFT JOIN													
         landmarks l 													
         on l.landmarkname = a.landmark													
    where sequm = 1													
    order by stationid													
													
													
INSERT INTO bikestatus(stationid, bikesavailable, docksavailable, date, time)													
    select stationid, bikesavailable, docksavailable, date, time													
    from bikestatus_staging													
    													
													
INSERT INTO biketrips(tripid, duration, startdate, starttime, startstationid, enddate, endtime, endstationid,													
bikenumber, zipcode, subscribertype)													
    select tripid, duration, startdate, starttime, startstationid, enddate, endtime, 													
           endstationid, bikenumber, zipcode, subscribertype													
    from biketrips_staging													
