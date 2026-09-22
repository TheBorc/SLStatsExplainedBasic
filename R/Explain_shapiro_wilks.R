#' Explain t-test
#'
#' Prints and explenation of t-tests, it's definition,
#' interpretation, some misconceptions, and connection to hypothesis testing
#' Includes assumptions, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.shapirowilks = function() {
  cat('
======================================================================
                          SHAPIRO WILKS
======================================================================

----------------------------------------------------------------------
                  WHY DO WE USE SHAPIRO-WILK TEST?
----------------------------------------------------------------------

  Parametric tests rely on the data being normally distributed as an
  assumption for reliable analysis. Shapiro-Wilks normality test can
  be used on data to confirm normality or non-normality.
  
  If a test from Shapiro-Wilks has a p-value > 0.05, the samples can
  be considered normally distributed.

----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  x=c()             #Creating the vector
  
  shapiro.test(x)   #The test controls one vector at a time
  
  This setup allows control of one vector at a time, if there are
  more vectors, simply exchange the vector tested in shapiro.wilks().
         
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
      
  The p-value returned at 0.8649, which is above 0.05, thus we can 
  retain the H0, which in this case means that we retain the 
  assumption that our data is normally distributed.')
}