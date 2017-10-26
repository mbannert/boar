library(MASS)
set.seed(123)
mu <- rep(0,3)
Sigma <- matrix(.7, nrow=3, ncol=3) + diag(3)*.3

rawvars <- mvrnorm(n=100, mu=mu, Sigma=Sigma)

d <- as.data.frame(rawvars)
fit1 <- lm(V3~V2,data=d)
fit2 <- lm(V1~V2,data=d)

r13.2 <- cor(resid(fit1),resid(fit2))

plot(resid(fit1),resid(fit2))
cor(d$V1,d$V3)

par(mfrow=c(2,2))
plot(d$V1,d$V3)
plot(resid(fit1),resid(fit2))
#plot(1,axes=F,ann=F,type="n")
plot(d$V3,d$V2)
plot(d$V1,d$V2)


# SO posts and web help
# https://www.r-bloggers.com/how-to-calculate-a-partial-correlation-coefficient-in-r-an-example-with-oxidizing-ammonia-to-make-nitric-acid/
# http://www.yilab.gatech.edu/pcor.html
# http://stackoverflow.com/questions/14250792/partial-correlations-in-r


# http://shiny.rstudio.com/gallery/plot-interaction-advanced.html



# GARY:  
#   partial correlation:  show three scattergrams.  Y with X1 is the featured one, but also show Y with X2 and X1 with X2.   From looking at the three graphs one can visually assess the first-order correlations.  Then the user moves the regression line (starting at flat) in, say, Y with X2.  A meter is presented to help user find the best slope.  As the regression line is moved, the points in the Y with X1 scattergram change to be Y - Yhat based on the fit in the Y with X2 graph.  Similarly, the X1 points in the Y with X1 graph change as the fit is improved in the X1 with X1 graph.  That is, X1 is replaced by X1 - X1hat (with the predictions based on X2).  The observed scatter in the Y1 - Yhat with X1 - X1hat represents the partial correlation between Y and X1 with X2 partialed out of both Y and X1.  
# 
# The semi-partial correlation is similar except one omits the Y with X2 graph.  X2 is only partialed from X1.  User finds best slope for X1 with X2 and then the other graph is between Y and X1-X1hat.  The observed scatter in that plot corresponds to the correlation between Y and X1 with X2 partialed out of ONLY X1.  I never find semi-partial correlation very useful.
# 
# A nice feature would be hovering over a point in one graph would show the same point in all the other graphs.
# 
# I detest venn digram representations like the youtube you sent.  For one thing, they can’t deal with suppression effects.  


cor(rawvars)


cov(rawvars); cor(rawvars)
# We can see our normal sample produces results very similar to our 
#specified covariance levels.

# No lets transform some variables
pvars <- pnorm(rawvars)

# Through this process we already have 
cov(pvars); cor(pvars)
# We can see that while the covariances have dropped significantly, 
# the simply correlations are largely the same.

plot(rawvars[,1], pvars[,2], main="Normal of Var 1 with probabilities of Var 2") 


library(ppcor)


library(ppcor)
y.data <- data.frame(
hl = c(7,15,19,15,21,22,57,15,20,18),
disp = c(0,0.964,0,0,0.921,0,0,1.006,0,1.011),
deg = c(9,2,3,4,1,3,1,3,6,1),
BC = c(1.78e-02,1.05e-06,1.37e-05,7.18e-03,0,0,0,4.48e-03,2.10e-06,0)
)


cor(y.data$hl,y.data$disp)
cov(y.data$hl,y.data$disp)

pcor(x=y.data,method="spearman")
