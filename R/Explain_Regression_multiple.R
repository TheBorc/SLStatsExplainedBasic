#' Explain multiple linear regression
#'
#' Prints an explanation of multiple linear regression,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.Regression_multiple = function() {
  cat('
======================================================================
                       MULTIPLE LINEAR REGRESSION
======================================================================

----------------------------------------------------------------------
              WHY DO WE USE MULTIPLE LINEAR REGRESSION?
----------------------------------------------------------------------

  We use multiple linear regression when we want to investigate
  associations between a variable and several others in the same
  model. There might be significant associations with several of
  these variables separately, and we wish to investigate which of
  the variables remain associated after introducing other
  variables. Such as how blood pressure is associated with age,
  weight and exercise.
  
----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  The amount of vectors varies from model to model.
 
 
  x=c()
  
  y=c()
  
  z=c()
  
  a=c()
  
  df=data.frame(x,
                y,
                z,
                a)
  
  summary(lm(x~y+z+a,
             data=df))
                                        
----------------------------------------------------------------------
                               EXAMPLE
----------------------------------------------------------------------

  We wish to investigate if age, weight and exercise have an 
  association with blood pressure. We want to see which of these
  variables explains variation in blood pressure when accounting
  for the other variables as well.
  
  x=c(113,                      #Blood pressure
      112,
      119,
      129,
      112,
      124,
      131,
      134,
      144,
      120,
      149,
      148,
      145,
      159,
      154,
      147,
      158,
      153,
      165,
      163)
                   
  y=c(24,                       #Age in years
      31,
      27,
      38,
      35,
      46,
      42,
      51,
      57,
      44,
      63,
      55,
      68,
      72,
      65,
      76,
      70,
      81,
      74,
      84)
        
  z=c(68,                       #Weight in kg
      75,
      82,
      71,
      88,
      79,
      91,
      84,
      96,
      76,
      89,
      101,
      86,
      94,
      105,
      92,
      108,
      97,
      112,
      103)
      
  a=c(5,                        #Exercise in hours per week
      4,
      6,
      3,
      4,
      2,
      3,
      2,
      1,
      5,
      2,
      1,
      3,
      1,
      1,
      2,
      0,
      1,
      0,
      0)

  df=data.frame(x,
                y,
                z,
                a)
                
  summary(lm(x~y+z+a,
             data=df))
             
        Call:
  lm(formula = x ~ y + z + a, data = df)

  Residuals:
       Min       1Q   Median       3Q      Max 
  -11.5774  -2.7215   0.0329   3.5008   7.1543 

  Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
  (Intercept)  84.7445    18.7388   4.522 0.000347 ***
  y             0.5373     0.1262   4.258 0.000601 ***
  z             0.3327     0.1808   1.841 0.084295 .  
  a            -2.3123     1.4812  -1.561 0.138058    
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

  Residual standard error: 5.445 on 16 degrees of freedom
  Multiple R-squared:  0.9216,	Adjusted R-squared:  0.9069 
  F-statistic: 62.68 on 3 and 16 DF,  p-value: 4.602e-09

  
  After creating a multiple regression model we see that age (y)
  has a p-value < 0.05 and remains significantly associated
  to the variability in blood pressure when accounting for both
  weight (z) and exercise (a) which have a p-value > 0.05.
  
  Multiple R-squared: 0.92 shows that the model explains 92% of
  the variation in blood pressure.
  
  F-statistic:... p-value: 4.602e-09 shows that the model we have
  created is statistically significant in explaining the variation
  found in the blood pressure data.
  
  
  SCATTERPLOT:
  
  The relationship between the variables can be visualised using 
  scatterplotMatrix():
  
  scatterplotMatrix(~x+y+z+a,
                    data=df,
                    smooth=FALSE)
                    
  This can be very useful to visually compare each variable to the
  others.
  
  
----------------------------------------------------------------------
                              IMPORTANT
----------------------------------------------------------------------

  Note that correlation does not mean causation. Age is simply a
  variable with a statistical significant predictor in our current 
  model. Age does not cause a rise in blood pressure, but it can be 
  an explanation of why a data point shows high blood pressure in our
  model.
      
      ')
  
  invisible(NULL)
}