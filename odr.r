##########################################################################
###
### R function for simple linear regression when both variables are random,
### and both variables have the same physical dimensions and units.
### Calculate the first principal component (Orthogonal distance regression line)
### Return eigenvalues and Coleman correlation
### See C. Tong (2011), "Concordance correlation decomposed into the
### product of precision and accuracy", JSM 2011 Proceedings, Biometrics Section, pp. 649-662.
### 
### Christopher Tong 9 May 2013
###
##########################################################################

# Assume x and y are numeric vectors of the same length, representing paired data.

odr <- function(x,y)
{
    # Check inputs
    x.numeric <- is.numeric(x)
    y.numeric <- is.numeric(y)
    xy.same.length <- length(x) == length(y)
    
    if (x.numeric & y.numeric & xy.same.length) {
    
        # Remove NAs
        x.nans <- is.na(x)
        y.nans <- is.na(y)
        all.nans <- x.nans | y.nans
        new.x <- x[!all.nans]
        new.y <- y[!all.nans]
        
        x <- new.x
        y <- new.y

        # Variances and covariances
        syy <- var(y)
        sxx <- var(x)
        sxy <- cov(x,y,use="pairwise.complete.obs")
    
        # Slope (m2) and intercept (int) of ODR line:
        m2 <- (syy - sxx + sqrt((syy - sxx)^2 + 4*sxy^2))/(2*sxy)
        int <- mean(y) - m2*mean(x)
    
        # Eigenvalues
        eval1 <- (syy + sxx + sqrt((syy - sxx)^2 + 4*sxy^2))/2
        eval2 <- (syy + sxx - sqrt((syy - sxx)^2 + 4*sxy^2))/2
    
        # Ratio of square roots of eigenvalues (called gof here); eccentricity
        gof <- sqrt(eval2/eval1)
        eccentricity <- sqrt(1 - (eval2/eval1))
    
        # Coleman correlation (rc) on raw data
        rc <- 1 - sqrt(eval2/eval1)
    
        list(int=int,slope=m2,gof=gof,eccentricity=eccentricity,eval1=eval1,eval2=eval2,rc=rc)
    } else {
        print("Input error")
    }
}

# Copyright (C) 2022 by Christopher Tong

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
