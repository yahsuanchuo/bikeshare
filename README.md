# California Bike Share Program dataset 
#### This project is to understand the route of bikes and examine whether the docks were built enough or not. The project is conducted in `SQL` using `Postgres`. Datasets are the records of bike trips from 2013-08-30 to 2016-08-30 with 983,648 trips. The average demand is about 898 trip/per day. This project used `survival analysis` to analyze and identify the stations with insufficent docks. 

#### Data source : https://cloud.google.com/bigquery/public-data/bay-bike-share

###### Assumptions: 
1. To examine whether the docks are enough or not, I first estimated the demand of renting and forecast the demand of returning.By calculating the average demand of bike renting per min, I used the number of rides in 3 years, and divided by the minutes. Thus, I assume that there will be 0.6 bikes per minutes demand in each station. That is to say, every 1 min would have 0.6 bikes being rented. After 1 hour, there will be 36 bikes that suppose to be in on the road. 
2. The end station is chosen by the most popular/frequent route from each start station. Compared with the docks in each end station, we can conclude that whether this station is able to accommodate the demand or not. 

However, not every bikes that will bike through a hour. So how many bikes will return after 1 hour, and does the end station have sufficient docks? 

#### Result: 
1. Stations that have insufficient docks:
San Francisco caltrain (Townsend 4th) (70)
San Francisco caltrain (300 Townsend) (69)
Santa Clara at Almaden
Cowper at University
Mountain View City Hall
2nd at South Park
San Antonio Shopping Center
Broadway at Main
Townsend at 7th

2. People started and the ended at the same stations:
San Mateo County Center
University and Emerson
5th S. at E. San Salvador St

  

