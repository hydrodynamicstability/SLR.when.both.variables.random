SLR.when.both.variables.random
==============================

Functions related to simple linear regression when both variables are random.

These functions attempt to estimate the parameters of the line of symmetry for bivariate data.

When a Euclidean metric is justified, orthogonal distance regression (odr.r) could be considered.
(Example:  both variables have the same physical dimension and units.)

When a Euclidean metric is not justified, geometric mean regression (gmr.r) could be considered.

Put another way, when invariance to arbitrary rotations of the coordinate system is important, 
orthogonal distance regression is appropriate. When scale invariance is more important, use geometric mean regression. The choice
between them depends on which invariance property is relevant to the problem at hand.

The odr.r function also returns the sample eigenvalues of the data, a sample estimate of the eccentricity
of the best-fit elliptical contour to the bivariate data, and the sample Coleman correlation.

See C. Tong, 2011: Concordance correlation coefficient decomposed into the product of precision and accuracy. *Joint Statistical Meetings 2011*, 30 July-4 August 2011, Miami Beach, FL. *American Statistical Association 2011 Proceedings, Biometrics Section*, 649-662.

The above paper can be viewed at:  https://www.academia.edu/8840828/Concordance_correlation_coefficient_decomposed_into_the_product_of_precision_and_accuracy

See also C. Tong and S. Wang, 2009: Simple linear regression when both variables are random. *Joint Statistical Meetings 2009*, 1-6 August 2009, Washington, DC. *American Statistical Association 2009 Proceedings, Section on Physical and Engineering Sciences*, 2877-2890.

The above paper can be viewed at:  https://www.academia.edu/3873479/Simple_Linear_Regression_When_Both_Variables_are_Random
