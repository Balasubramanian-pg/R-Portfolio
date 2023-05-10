#creating vectors
poker_vector<- c(140,-50,20,-120,240)
roulette_vector <- c(-24,-50,100,-350,10)
print(poker_vector)
print(roulette_vector)

#creating a week names vector
days<-c(“Monday”,”Tuesday”,”Wednesday”,”Thursday”,”Friday”)
print(days)

#Indexing: finding specific values
poker_Wednesday<-poker_vector[3]
print(poker_Wednesday)
roulette_Monday<-roulette_vector[1]
print(roulette_Monday)
poker_midweek<-poker_vector[c(2,3,4)]
print(poker_midweek)
poker_md<-poker_vector[2:5]
print(poker_md)

#logical operations: TRUE/FALSE
total_poker<-sum(poker_vector)
total_roulette<-sum(roulette_vector)
total_poker>total_roulette

#conclusion: I have made more earning from playing poker than roulette

#factors

gender<- c('M','F','M','F','F','M','F','M','F','M')
factors_gender<-factor(gender)
print(factors_gender)

#putting the earnings to specific days
names(poker_vector)<-days
print(poker_vector)
names(roulette_vectos)<-days
print(roulette_vector)

#total winnings of week for both poker and roulette
total_winnings<-poker_vector + roulette_vector
print(total_winnings)

