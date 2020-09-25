ggplot(mtcars,aes(x=wt)) + geom_density() # vizualize the distribution using density plot

?shapiro.test


# Waht doing a quantitative chapiro test looks like.

shapiro.test(mtcars$wt)
