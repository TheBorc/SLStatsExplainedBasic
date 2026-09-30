#' Explain Sign test
#'
#' Prints an explanation of Sign test,
#' it's definition, interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.sign_test = function() {
  cat('
======================================================================
                              SIGN TEST
======================================================================

----------------------------------------------------------------------
                      WHY DO WE USE SIGN TEST?
----------------------------------------------------------------------

  The Sign test is much like the Wilcoxon signed-rank test (paired),
  it is used when doing pairwise analysis, however, when the difference 
  is non-normally distributed and there is no symmetry in the 
  difference, we use a sign test.
  
  In short:
  Normally distributed differences:
  Paired t-test
  
  Non-normally distributed differences, symmetrical: 
  Wilcoxon signed rank test
  
  Non-normally distributed differences, non symmetrical:
  Sign test
  
----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  As this is a non parametric test, always control your data with
  a normality test such as shapiro.test(), unless the data is ordinal.
  
  
  x=c()                             #First measurement                         
  
  y=c()                             #Second measurement
  
  positive_results=sum(y-x > 0)     #Sum all positive differences
  
  non_zero_results=sum(y-x != 0)    #Sum all differences that is not 0
  
  binom.test(positive_results,      #Sign test uses the number of
             non_zero_results)      #positive results and compares
                                    #with all results that is not 0
  
  
----------------------------------------------------------------------
                               EXAMPLE
----------------------------------------------------------------------

 We want to investigate whether sleep has an effect on reaction time,
 we recruit 8 individuals who will try a reaction test after 8 hours
 of sleep, and then perform the same test after 5 hours of sleep,
 the results are noted in ms.
 
 The differences seem to be non-normally distributed and there is 
 no symmetry observed when checking with hist().
 
  x=c(240,                            #8-hours of sleep
      255,
      230,
      265,
      250,
      245,
      260,
      235)                                                       

  y=c(252,                            #5-hours of sleep
      269,
      241,
      281,
      263,
      258,
      251,
      190)                               

  positive_results=sum(y-x > 0)       

  non_zero_results=sum(y-x != 0)      

  binom.test(positive_results,        
             non_zero_results)   
  
  	    Exact binomial test

  data:  positive_results and non_zero_results
  number of successes = 6, number of trials = 8, p-value = 0.2891
  alternative hypothesis: true probability of success is not equal to 0.5
  95 percent confidence interval:
   0.3491442 0.9681460
  sample estimates:
  probability of success  
                    0.75 
  
  
  We see that we got a p-value > 0.05 and we do not reject H0. Those
  with keen eyes might notice that the CI is between 0.35 and 0.97,
  this does not include 0 but yet we do not reject H0.
  
  An important part about binom.test() is that it uses p=0.5 as
  default, and since 0.35 and 0.97 includes 0.5, we do not reject H0. 
  This can be changed by adding another p value as an argument inside 
  the function.
      ')
  
  invisible(NULL)
}