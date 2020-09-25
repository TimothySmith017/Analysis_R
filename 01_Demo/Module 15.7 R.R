# looking at correlation coefficient

?cor()

# Look at mt cars dataset
head(mtcars)

#Testing if HP is correlated with QT

plt <- ggplot(mtcars,aes(x=hp,y=qsec)) # import dataset
plt + geom_point() # Create scatter

# Use cor() to evaluate the strength of the function

cor(mtcars$hp,mtcars$qsec) # Calculate Correlation Coefficient
# That's strong! -0.78

#now with used cars
used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F) #read in dataset
head(used_cars)

# find cor between miles driven and selling price
plt <- ggplot(used_cars,aes(x=Miles_Driven,y=Selling_Price)) #import into ggplot
plt + geom_point() #Create scat


# Check with cor()

cor(used_cars$Miles_Driven,used_cars$Selling_Price) #calculate correlation coefficient


# Create a numeric matrix
used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")]) #Convert dataframe into numeric matrix
cor(used_matrix)


#15.7.2 Linear Regreession
?lm()


#Linear Model between quatermile and horsepower
lm(qsec~hp,mtcars) # Creat linear model


# USe summary function to get the p-value and r-squared value of linear model

summary(lm(qsec~hp,mtcars)) #SUmmarize the linear model



# After determining we can reject the null, We can plot the line of the model
#But first, lets get the datapoints

model <- lm(qsec~hp,mtcars) #xreate linear model
yvals <- model$coefficients['hp']*mtcars$hp +
  model$coefficients['(Intercept)'] # determine yaxis values from linear model.


plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model)


#Perform Multiple Linear Regression: 15.7.3

lm(qsec~mpg+disp+drat+wt+hp,data=mtcars) #generate multiple linear regression model


# Now that we have the linear model, lets get its statistics using summary()
  
  summary(lm(qsec~mpg+disp+drat+wt+hp,data=mtcars)) # Gen the summary stats


