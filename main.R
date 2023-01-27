
library(icarus)

N <- 300 ## Population size
## Compute the Horvitz-Thompson estimator (returns 1.666667)
weightedMean(data_employees$movies, data_employees$weight, N)

## Add calibration margins
mar1 <- c("category",3,80,90,60)
mar2 <- c("sex",2,140,90,0)
mar3 <- c("department",2,100,130,0)
mar4 <- c("salary", 0, 470000,0,0)
margins <- rbind(mar1, mar2, mar3, mar4)
## Compute calibration weights
wCal <- calibration(data=data_employees, marginMatrix=margins, colWeights="weight"
                           , method="raking", description=FALSE)

## Value of the calibrated estimator: 2.471917
weightedMean(data_employees$movies, wCal, N)
