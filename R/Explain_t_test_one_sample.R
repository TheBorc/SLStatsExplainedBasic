#' Explain one-sample t-test
#'
#' Prints an explanation of one-sample t-test, it's definition,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export

SLExplain.t_test_one_sample = function() {
  cat('
======================================================================
                          ONE-SAMPLE T-TEST 
======================================================================

----------------------------------------------------------------------
                  WHEN DO WE USE ONE-SAMPLE T-TEST?
----------------------------------------------------------------------

  One-sample t-test is used when we want to compare our sample to a
  manually chosen cutoff. This could be for example that we want to
  check if a group has a different blood pressure mean or perhaps
  height than a hypothesised mean value of the population. You can
  also check if the mean is specifically lower or greater than the
  hypothesised population mean.
  
  In short:
  To see if your sample has a significantly different mean value than
  your chosen cutoff.


----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  x=c()          #Creating the vector
  
  t.test(x,
         mu=nr)  #mu is the cutoff value to test against
  
  Add alternative= to the t.test function to check for less or greater
         
----------------------------------------------------------------------
                              EXAMPLE
----------------------------------------------------------------------

  Measuring the height of 8 different people. The population mean is
  hypthesised to be 165 cm.
  
  x=c(163,
      169,
      161,
      167,
      165,
      170,
      164,
      168)
      
  t.test(x,
         mu=165) #Note that we chose 165 as mu, H0 in this case.
         
  Here we check for any difference and this gives us the following:
         
    One Sample t-test

  data:  x                    
  t = 0.78899, df = 7, p-value = 0.456
  alternative hypothesis: true mean is not equal to 165
  95 percent confidence interval:
    163.2526 168.4974
  sample estimates:
  mean of x 
    165.875 
         
         
  
  We can also check for one-sided tests, to see if the change is
  higher or lower than the chosen cutoff.
 
  
  LOWER:
  
  t.test(x,
         mu=165,
         alternative="less") #This checks if the value is less.
         
    One Sample t-test

  data:  x
  t = 0.78899, df = 7, p-value = 0.772 #Note: The p-value changed
  alternative hypothesis: true mean is less than 165
  95 percent confidence interval:
    -Inf 167.9761
  sample estimates:
  mean of x 
    165.875 
  
  
  HIGHER:
  
  t.test(x,
         mu=165,
         alternative="greater") #This checks if the value is greater
         
    One Sample t-test
  
  data:  x
  t = 0.78899, df = 7, p-value = 0.228 #Even greater change
  alternative hypothesis: true mean is greater than 165
  95 percent confidence interval:
    163.7739      Inf
  sample estimates:
  mean of x 
    165.875        
    
  
  None of the tests could identify a significant difference in the
  mean height of the sample when compared to H0 (165 cm)
      ')
  invisible(NULL)
}