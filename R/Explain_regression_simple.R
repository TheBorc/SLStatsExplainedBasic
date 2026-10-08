#' Explain simple linear regression
#'
#' Prints an explanation of simple linear regression,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.Regression_simple = function() {
  cat('
======================================================================
                        SIMPLE LINEAR REGRESSION
======================================================================

----------------------------------------------------------------------
                  WHY DO WE USE SIMPLE LINEAR REGRESSION?
----------------------------------------------------------------------

  We use simple linear regression when we wish to predict values in
  a variable based on the values of another variable with a linear
  relationship. The linear relationship can be approximated between two 
  variables, the R2 value explains what percentage of the variance is 
  explained by the model.
  
----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  Note that linear regression concerns normality of the residuals.
  This is not covered in this guide and has to be investigated
  after running this setup.
  
  x=c()
  
  y=c()
  
  df=data.frame(x,
                y)
  
  summary(lm(x~y,               # Outcome ~ Predictor
             data=df))
                                        
----------------------------------------------------------------------
                               EXAMPLE
----------------------------------------------------------------------

  We want to investigate the relationship between height and 
  reading score. When the data is collected and analysed we have 
  noted that they have a monotonic relationship. Meaning that if
  one variable increases or decreases the other one does as well.
  We wish to see if the model will be able to predict the reading
  scores based on height.
  

  
  x=c(42,                           #Reading scores
      48,
      47,
      53,
      55,
      61,
      60,
      66,
      68,
      74,
      73,
      80,
      82,
      88,
      65)
  
  y=c(118,                          #Height
      137,
      133,
      144,
      148,
      152,
      151,
      158,
      157,
      158,
      161,
      160,
      159,
      161,
      159)

      
  
  
      
  df=data.frame(x,
                y)
                
                
  
  
  summary(lm(x~y,
             data=df))
             
  Call:
  lm(formula = x ~ y, data = df)

  Residuals:
     Min     1Q Median     3Q    Max 
  -7.291 -4.882 -2.394  4.709 13.812 

  Coefficients: 
              Estimate Std. Error t value Pr(>|t|)    
  (Intercept) -78.5339    22.3502  -3.514  0.00381 ** 
  y             0.9486     0.1481   6.404 2.33e-05 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

  Residual standard error: 6.956 on 13 degrees of freedom
  Multiple R-squared:  0.7593,	Adjusted R-squared:  0.7408 
  F-statistic: 41.01 on 1 and 13 DF,  p-value: 2.329e-05
  
  
  We can see on the Pr(>|t|) line that height is statistically 
  significantly associated with reading scores. And we should be
  able to estimate someones reading score by using their height.
  The Adjusted R2: 0.7408 tells us that height explains 74% of the
  variability in reading scores in our current model.
  
  Outcome = Intercept + Predictor*Coefficient
  Note that the values are gathered under the "Estimate" column
  
  If someone is 143 cm tall, their reading score is estimated
  to be:
  
  -78.5339 + 143*0.9486 = 57.1
  
  
----------------------------------------------------------------------
                              IMPORTANT
----------------------------------------------------------------------

  Note that correlation does not mean causation. Two variables can
  have a relationship without having an effect on each other. In this
  example we used reading scores and height, which seem to have
  a positive correlation, however, the correlation is mostly driven
  by another variable, age, which affects both height and reading 
  scores.
  
  Age is what we call a confounding variable in our analysis and it is 
  very important to take confounders into consideration when 
  interpreting correlations.
      
      ')
  
  invisible(NULL)
}