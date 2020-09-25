# 15.8 Chisq test

?chisq.test()

#Wnat to test if theres a stats difference in the distrubutions of vehicle class from 1999 to 2008 from our mpg dataset
# Need to build a contingency table first

table(mpg$class,mpg$year) # Generate contingency table


# Now pass the table through a contingency function/table

tbl <- table(mpg$class,mpg$year) # generate contingency table
chisq.test(tbl) #compare categorical distributions