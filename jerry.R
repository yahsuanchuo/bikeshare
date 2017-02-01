#2
length(data$Gender[data$Gender=="M"])
summary(data$Gender) #57096

#3
dim(subset(data,data$Gender=="F"& data$any_aid=="TRUE")) #367 $eeee

#4
class <- data$WealthRanking
sapply(data, class)
mean(data, )

tapply(data$ActualWeight,data$Age,quantile)

#5
tapply(data$ActualWeight,data$Age,function(t) quantile(t, prob=seq(0,1,0.05)))
tapply(data$ActualWeight,data$Age,function(t) quantile(t, prob=c(0.05,0.5,0.95)))

#6
data$NewID <- as.factor(data$ChildHHID) 

data$diff <- unlist(tapply(data$ActualWeight,data$Age, function(x) c(NA,diff(x))))
