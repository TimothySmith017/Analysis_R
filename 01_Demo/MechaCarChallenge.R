library(ggplot2)
library(ggpubr)
library(tidyverse)

mecha_cars <- read.csv('MechaCar_mpg.csv',stringsAsFactors = F) # Read in the Mechacars dataset
head(mecha_cars) 
# Reading the first entries of the dataset 
# to make sure it's imported and to check the data fields

?lm() #Reading up on the linear regression model documentation

# Creating Single Linear Regression Model as a test for functionality
lm(mpg~vehicle.weight,mecha_cars) #-- Okay cool, this works.

#Creating a Multiple Linear Regression Model to test different variables' effect on MPG
# Variables used will be: Vehicle.length, Vehicle.weight, spoiler.angle, ground.clearance, and presence of AWD
lm(mpg~vehicle.weight+vehicle.length+spoiler.angle+ground.clearance+AWD,data =mecha_cars)

#Creating the statistics summary table from the Multiple Line Regression Model
# This is so that I can look at individual P values and look at which variables are contributing

summary(lm(mpg~vehicle.weight+vehicle.length+spoiler.angle+ground.clearance+AWD,data =mecha_cars))


#Loading the Suspension Coils test into the data structure
sus_coils <- read.csv('Suspension_Coil.csv',stringsAsFactors = F)

#Checking out the suspension test data
head(sus_coils)


#Note using summary(sus_coils) does not work for building the summary table.

?summarize() # Seeing what the summarize method does

#Creates a summary statistics table witht he Mean, Median, Variance, and Standard Deviation.
lot_summary <- sus_coils %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

# According to Module Data: It looks like the proper test would be a One-Tail T-test
#Read documentation on T-test
?t.test()

#One sided T test on our Sus_coils PSI metric. Population mean of 1500
t.test(log10(sus_coils$PSI),mu= 1500)







