

########################################################################## 
### 
### R function for calculating the ordinary least product regression
### for bivariate data (aka, geometric mean regression).
### This can be used when both variables are random but have different
### physical dimensions and/or units.  It corresponds to the standardized
### first principal component.  
###
### See C. Tong (2011), "Concordance correlation decomposed into the
### product of precision and accuracy", JSM 2011 Proceedings, Biometrics Section, pp. 649-662.
### 
### C. Tong 
### Initial version 27 July 2011; revised 25 May 2013
### 
########################################################################## 

# Assume x and y are numeric vectors of the same length, representing paired data

gmr <- function(x,y)
{
    # Check inputs
    if (is.numeric(x) & is.numeric(y) & length(x) == length(y)) {

    # Remove NAs
    na.idx <- is.na(x) | is.na(y)
    x <- x[!na.idx]
    y <- y[!na.idx]

    # Calculate slope and intercept of gmr line.
    slope <- sign(cov(x,y))*sd(y)/sd(x)
    int <- mean(y) - slope*mean(x)
    } else {
        int <- NA
        slope <- NA
        print("Wrong data type input")
    }
    
    list(int=int,slope=slope)
}
