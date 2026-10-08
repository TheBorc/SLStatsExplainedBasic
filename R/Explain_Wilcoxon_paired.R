#' Explain Wilcoxon signed-rank test (paired)
#'
#' Prints an explanation of Wilcoxon signed-rank test,
#' it's definition, interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.wilcoxon_paired = function() {
  cat('
======================================================================
                      WILCOXON SIGNED-RANK TEST
======================================================================

----------------------------------------------------------------------
                WHY DO WE USE WILCOXON SIGNED-RANK TEST?
----------------------------------------------------------------------

  Wilcoxon signed-rank test can be used as a non-parametric version 
  of the paired t-test. It is used when we want to investigate
  the effects of, for example, an intervention on paired samples.
  Such as before and after treatments with a drug, or the effect of a
  training regime on running speed.
  
  Note that one of the assumptions is that the difference does not 
  have to be normally distributed, but it has to be symmetrical.
  
----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  As this is a non-parametric test, always control your data with
  a normality test such as shapiro.test() if needed, unless the data 
  is ordinal.
  
  
  x=c()                         #First measurement                         
  
  y=c()                         #Second measurement
  
  wilcox.test(x,
              y,              
              exact=FALSE,      #Use an approximate p-value
              correct=FALSE,    #No continuity correction
              paired=TRUE)      #Treat data as paired
    
  
  Explaining approximation of the p-value instead of exact and why
  we do not apply continuity correction to the data is beyond the
  scope of this basic tutorial.
  
----------------------------------------------------------------------
                               EXAMPLE
----------------------------------------------------------------------

  We want to investigate whether a training regime has an effect
  on the 5 km running speed of 10 participants in minutes. After 
  examining the difference, we noted that the data are non-normally 
  distributed and have chosen to use the Wilcoxon signed-rank test.
  
  
  x=c(28.4,
      31.2,
      26.8,
      35.5,
      29.1,
      27.6,
      30.3,
      34.8,
      28.9,
      32.1)
      
  y=c(27.9,
      30.6,
      26.1,
      34.7,
      28.2,
      24.5,
      27.1,
      31.5,
      25.5,
      28.6)
    
  CHECK FOR NORMALITY IN DIFFERENCE:
  shapiro.test(y-x)
  
    	Shapiro-Wilk normality test

  data:  y - x
  W = 0.75053, p-value = 0.003622
  
  The difference seems to be non-normally distributed. The
  Wilcoxon signed-rank test is appropriate.
  
  
  wilcox.test(x,
              y,
              exact=FALSE,
              correct=FALSE,
              paired=TRUE)
              
        		Wilcoxon signed rank test

  data:  x and y
  V = 55, p-value = 0.005062
  alternative hypothesis: true location shift is not equal to 0
  
  As the p-value < 0.05 we reject H0, there is a significant difference
  in running times between before and after going through the training 
  regime.
  
  
----------------------------------------------------------------------
                               IMPORTANT
----------------------------------------------------------------------
  
  One assumption for a Wilcoxon signed-rank test (paired) is a 
  symmetrical distribution of the difference. To check this
  assumption a simple histogram can be applied:
  
  hist(y-x)     #Create a histogram
  
  If the data is asymmetrical it is more appropriate to use
  the sign test, which is explained in SLExplain.sign_test().
      ')
  
  invisible(NULL)
}