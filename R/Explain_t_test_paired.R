#' Explain Paired sample t-test
#'
#' Prints and explenation of Paired sample t-test, it's definition,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.t_test_paired = function() {
  cat('
======================================================================
                        PAIRED SAMPLE T-TEST
======================================================================

----------------------------------------------------------------------
                WHY DO WE USE PAIRED SAMPLE T-TEST?
----------------------------------------------------------------------

  We use this test when we have two sets of paired measurements,
  this can be before and after treatments, or if we have matching
  pairs of individuals with similar characteristics, such as age,
  location or occupation.

----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  x=c()             #Creating the first vector
  
  y=c()             #Creating the second vector
  
  shapiro.test(x-y) #Controls for normality before using t.test
  
  t.test(x,         #Testing x against y as paired measurements
         y,
         paired=TRUE)
  
  This setup checks the value of x against y with the assumption
  that the measurements are paired. Which usually includes checking
  the difference in values e.g. paired x-value - y-value = difference.
  
  
----------------------------------------------------------------------
                              EXAMPLE
----------------------------------------------------------------------

  Measuring the CRP levels before and after antibiotic treatment of
  ten seperate individuals.
  
  x=c(126,         #Creating the before CRP concentration vector
      89,
      174,
      95,
      143,
      72,
      118,
      156,
      103,
      137)             

  y=c(48,           #Creating the after CRP concentration vector
      31,
      62,
      27,
      55,
      24,
      39,
      51,
      34,
      43)             

  shapiro.test(x-y) #Controls for normality before using t.test

	Shapiro-Wilk normality test

  data:  x - y
  W = 0.98052, p-value = 0.967

  The difference in the values before and after treamtent can be
  assumed normaly distributed as Shapiro-Wilks returned a p-value
  of 0.967.


  t.test(x,         #Testing x against y as paired measurements
         y,
         paired=TRUE)
      
  	Paired t-test

  data:  x and y
  t = 12.484, df = 9, p-value = 5.496e-07
  alternative hypothesis: true mean difference is not equal to 0
  95 percent confidence interval:
   65.42121 94.37879
  sample estimates:
  mean difference 
             79.9 
      
  The t-test returned a p-value < 0.001 which is a very highly
  significant difference in CRP levels before and after treatment 
  with antibiotics')
  
  invisible(NULL)
}