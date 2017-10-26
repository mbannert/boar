library(UsingR)
library(manipulate)
y <- galton$child - mean(galton$child)
x <- galton$parent - mean(galton$parent)
df <- as.data.frame(table(x, y))
names(df) <- c("child", "parent", "freq")
head(df)

myPlot <- function(beta) {
  plot(as.numeric(as.vector(df$parent)),
       as.numeric(as.vector(df$child)),
       cex=0.15*df$freq,
       pch=21,
       col="black",
       bg="lightblue",
       xlab="Parent",
       ylab="Child"
  )
  abline(0, beta, lwd=3)
  points(0,0,cex=2,pch=19)
  mse=mean((y-(beta*x))^2)
  title(paste0("beta=", beta, ", mse=", round(mse,3)))
}
manipulate(myPlot(beta), beta=slider(0.5, 0.9, step=0.02))

# The following will fit the data and show the best possible slope.
# The "-1" below means "don't fit an intercept"...need to look this up
fit <- lm(I(child - mean(child)) ~ I(parent - mean(parent)) - 1, data=galton)
summary(fit)


y <- scale(mtcars$mpg)
x <- scale(mtcars$disp)
mse <- mean((y-(-8.476e-01*x))^2)
plot(scale(mtcars$mpg),scale(mtcars$disp))
lm(y~x)

abline(0,-1,lwd=2)
