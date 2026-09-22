#' Explain McNemar's test
#'
#' Prints an explanation of McNemar's test, it's definition,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.mcnemar = function() {
  cat('
======================================================================
                            MCNEMARS TEST
======================================================================

----------------------------------------------------------------------
                    WHY DO WE USE MCNEMARS TEST?
----------------------------------------------------------------------

  We use this test when we want to controll if data collected is
  different from an expected distribution. This could be gonetype
  studies or comparing car colors seen on the street to the colors
  sold in car dealerships.

----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  x=matrix(c(),             #Setting up the table
           nrow=,
           byrow=TRUE)      #This fills the table horizontally
                            # -> ->, if FALSE, it fills vertical
                            
  
  
----------------------------------------------------------------------
                              EXAMPLE
----------------------------------------------------------------------

  We have studied cars driving by the street and noted down the color
  of each one, we have also pulled numbers of sold cars and their 
  respective color and should observe the same porportions on the
  streets as the ones sold in stores.
  
  x=c(32, #Black These values are the ones noted on the street.
      27, #White 
      21, #Gray
      12, #Blue
      8)  #Red
      
  y=c(28, #These values are the ones sold at dealershio
      30, #Same order as above
      22,
      12,
      8)
      
  chisq.test(x,
             p=y/sum(y))
             
  	Chi-squared test for given probabilities

  data:  x
  X-squared = 0.91688, df = 4, p-value = 0.9221
  
  The test showed a p-value > 0.05, we do not reject H0 and we can
  assume that the expected distribution of car colors sold is the
  the same distibution seen in the streets.')
  
  invisible(NULL)
}