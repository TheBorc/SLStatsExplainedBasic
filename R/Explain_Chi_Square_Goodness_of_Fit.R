#' Explain Chi-Square Goodness of Fit
#'
#' Prints an explanation of Chi-Square Goodness of Fit, its definition,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.chi_square_goodness = function() {
  cat('
======================================================================
                    CHI-SQUARE GOODNESS OF FIT
======================================================================

----------------------------------------------------------------------
              WHY DO WE USE CHI-SQUARE GOODNESS OF FIT?
----------------------------------------------------------------------

  We use this test when we want to determine if data collected is
  different from an expected distribution. This could be gonetype
  studies or comparing car colors seen on the street to the colors
  sold in car dealerships.

----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  x=c()         #Creating observed vector
  
  y=c()         #Creating expected vector
  
  chisq.test(x,
             p=y/sum(y)) #This creates proportions. Turns the values
                         #Into % instead of observed values.
                         #If we dont change p, R assumes all
                         #Categories are equal
  
----------------------------------------------------------------------
                              EXAMPLE
----------------------------------------------------------------------

  We have studied cars driving by the street and noted down the color
  of each one, we have also pulled numbers of sold cars and their 
  respective color and should observe the same poroportions on the
  streets as the ones sold in stores.
  
  x=c(32, #Black These values are the ones noted on the street.
      27, #White 
      21, #Gray
      12, #Blue
      8)  #Red
      
  y=c(28, #These values are the ones sold at dealerships
      30, #Same order as above
      22,
      12,
      8)
      
  chisq.test(x,
             p=y/sum(y))
             
  	Chi-squared test for given probabilities

  data:  x
  X-squared = 0.91688, df = 4, p-value = 0.9221
  
  The test showed a p-value > 0.05, we do not reject H0 and we
  observed that the expected distribution of car colors sold is
  similar to the distribution seen in the streets.')
  
  invisible(NULL)
}