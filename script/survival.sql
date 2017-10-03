with t as (													
    select bt.*,duration/60 as tenure													
     from biketrips bt													
          ),													
      h as(													
       SELECT tenure, startstationid, count(*) as tenpop,													
       sum(count(*)) over (partition by startstationid order by tenure desc) as poprisk,													
       count(*)/ sum(count(*)) over (partition by startstationid order by tenure desc) as h													
       from t													
       where tenure >=0	 and tenure <=60												
       group by tenure, startstationid 													
          ),         													
    m as ( 													
       select mm, 0 as h  													
       from generate_series (1,60) g(mm)													
         ), 													
    n as (													
       select distinct startstationid 													
       from biketrips													
        ),													
    mn as (													
        select *													
        from m cross join n 													
          ),       													
    nh as (													
      select mn.mm, mn.startstationid, h.h, mn.h, coalesce(h.h, mn.h) as h_act													
      from h full join mn 													
       on mn.mm = h.tenure and mn.startstationid = h.startstationid													
       ),													
          													
    s as (													
         Select nh.*, EXP(SUM(LN(1 - h_act)) OVER(partition by startstationid ORDER BY mm))/ (1-h_act) as S 													
         FROM nh													
         where h_act <1													
          ),													
    b as (													
     select startstationid, endstationid													
     from (select startstationid, endstationid, count(*), row_number() over (partition by startstationid order by count(*)DESC) as sqeum													
           from biketrips													
           group by startstationid, endstationid) a													
          where sqeum =1 													
          ),     													
     f as (				      									
     select s.startstationid, b.endstationid, 0.5*(SUM(CASE WHEN mm < 60+1 Then S ELSE 0 END))as actives, 													
           (30 - 0.5*(SUM(CASE WHEN mm < 60+1 Then S ELSE 0 END))) as stop, bk.dockcount, 													
           bk.dockcount -  (30 - 0.5*(SUM(CASE WHEN mm < 60+1 Then S ELSE 0 END))) as avaliable													
     from  s  left join													
           b 													
           on b.startstationid = s.startstationid left join 													
           bikestations bk													
           on b.endstationid = bk.stationid													
     group by s.startstationid, b.endstationid, bk.dockcount													
     order by actives desc													
         )													
SELECT startstationid, endstationid, bk.landmarkid, lm.landmarkname, stationname,stop, f.dockcount, avaliable 													
FROM f left join 													
     bikestations bk													
     on f.endstationid = bk.stationid left join													
     landmarks lm													
     on lm.landmarkid = bk.landmarkid													
GROUP BY startstationid, endstationid, bk.landmarkid, lm.landmarkname, stationname, stop, f.dockcount, avaliable													
GROUP BY startstationid													
													
