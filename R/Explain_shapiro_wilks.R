#' Explain Shapiro-Wilk Normality test
#'
#' Prints an explanation of Shapiro-Wilk, it's definition,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.shapirowilks = function() {
  cat('
======================================================================
                          SHAPIRO-WILK
======================================================================

----------------------------------------------------------------------
                  WHY DO WE USE SHAPIRO-WILK TEST?
----------------------------------------------------------------------

  Parametric tests rely on the data being normally distributed as an
  assumption for reliable analysis. The Shapiro-Wilk normality test 
  can be used on data to check for normality or non-normality.
  
  If a test from Shapiro-Wilk has a p-value > 0.05, the samples can
  be considered normally distributed, or more accurately, we do not
  have enough evidence to reject H0 which states that it is normally
  distributed.

----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  x=c()             #Creating the vector
  
  shapiro.test(x)   #The test controls one vector at a time
  
  This setup allows control of one vector at a time, if there are
  more vectors, simply exchange the vector tested in shapiro.test()
  for each vector and run them separately.
         
----------------------------------------------------------------------
                              EXAMPLE
----------------------------------------------------------------------

  Measuring the height of 8 different people. However, before running
  any statistical tests we would like to control the normality of
  the sample.
  
  x=c(163,
      169,
      161,
      167,
      165,
      170,
      164,
      168)
      
  shapiro.test(x)
    
      Shapiro-Wilk normality test

  data:  x
  W = 0.966, p-value = 0.8649
      
  The p-value is 0.8649, which is above 0.05, thus we can 
  retain the H0, which in this case means that we retain the 
  assumption that our data is normally distributed.')
  
  invisible(NULL)
}