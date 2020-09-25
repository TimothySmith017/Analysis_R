?sample_n()

library(ggplot2)
library(ggpubr)
library(tidyverse)

# Visualize the driven miles for entire used_vehicle dataset

population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F) #import used car dataset
plt <- ggplot(population_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot


# Create a sample of the same dataset

sample_table <- population_table %>% sample_n(50) #Randomly sample 50 datapoints
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven))) # Import into ggplot2
plt + geom_density() #Visualize sample

# What is a T-Test? Module 15.6.2
?t.test()

# test to see if the sample mile sdriven is statistically significant to the population

t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven))) #Compare sample mean vs pop mean

#**Module 15.6.3 Two sided T test ****#
sample_table <- population_table %>% sample_n(50) #generate 50 randomly sampled data points
sample_table2 <- population_table %>% sample_n(50) #generate ANOTHER 50 randomly sampled data points



# use a t test to test that those samples are not biased.
t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven)) #compare means of two samples

#**** Module 15.6.4 Paired T-test
?t.test()


mpg_data <- read.csv('mpg_modified.csv') #import dataset
mpg_1999 <- mpg_data %>% filter(year==1999) #select only data points where the year is 1999
mpg_2008 <- mpg_data %>% filter(year==2008) #select only data points where the year is 2008fsa



# Conduct our t test to test hwy mpg between the 1999 and 2008 sample

t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T) #compare the mean difference between two samples



# ANOVA lookup
?aov()


#To practice our one-way ANOVA, return to the mtcars dataset. 
#For this statistical test, we’ll answer the question, 
#“Is there any statistical difference in the horsepower of a vehicle based on its engine type?”


#However, in the mtcars dataset, the cyl is considered a numerical interval vector, not a categorical vector. 
#MUST CLEAN TEH DATA FIRST

mtcars_filt <- mtcars[,c("hp","cyl")] #filter the dataset columns
mtcars_filt$cyl <- factor(mtcars_filt$cyl) #convert the numeric column to factor


aov(hp~cyl,data=mtcars_filt) #compare means across multiple levels



# Need to wrap our aov() function into a summary function to get our p values so we know.

summary(aov(hp~cyl,data=mtcars_filt))


















