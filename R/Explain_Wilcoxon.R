#' Explain One-Sample Wilcoxon Signed Rank test
#'
#' Prints an explanation of One-Sample Wilcoxon Signed Rank test,
#' it's definition, interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.wilcoxon = function() {
  cat('
======================================================================
               ONE-SAMPLE WILCOXON SIGNED RANK TEST
======================================================================

----------------------------------------------------------------------
        WHY DO WE USE ONE-SAMPLE WILCOXON SIGNED RANK TEST?
----------------------------------------------------------------------

  Wilcoxon can be used as a non-parametric version of the one-sample
  t-test. It will focus on the median as a center instead of the mean
  and can be used to investigate if the median is significantly
  different from a chosen cutoff value, or the hypothesized median.
  
  Non-parametric tests are used when the sample does not have a 
  normal distribution or when outliers affect normality but cannot
  be removed.
  
----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  As this is a non-parametric test, always check your data with
  a normality test such as shapiro.test() when needed, unless the data 
  is ordinal.
  
  x=c()
  
  shapiro.test(x)               #Control normality, p-value < 0.05
                                #indicates non-normal distribution
  wilcox.test(x, 
              mu=cut off value, #The value the median is compared to.
              exact=FALSE,      #Use an approximate p-value
              correct=FALSE)    #No continuity correction
  
  Explaining the approximation of the p-value instead of exact and why
  we do not apply continuity correction to the data is beyond the
  scope of this basic tutorial.
  
----------------------------------------------------------------------
                               EXAMPLE
----------------------------------------------------------------------

  We want to investigate if the waiting times at a clinic which uses
  a slightly different system differs from other clinics. We collect
  data by recording when a patient arrives and when the nurse calls 
  their number in minutes.
  
  x=c(10,
      16,
      18,
      21,
      25, 
      26, 
      27,
      28,
      31,
      33,
      34,
      35,
      36,
      59,
      69)
      
  shapiro.test(x)
  
    	Shapiro-Wilk normality test

  data:  x
  W = 0.87434, p-value = 0.03909
  
  The Shapiro test showed a p-value < 0.05 and we can reject H0,
  the data is not normally distributed.
  
  
  wilcox.test(x,
              mu=30,        #Average waiting time in other clinics
              exact=FALSE,
              correct=FALSE)

  	  Wilcoxon signed rank test

  data:  x
  V = 55.5, p-value = 0.7982
  alternative hypothesis: true location is not equal to 30
  
  The sample showed a p-value > 0.05 and we retain H0, the
  waiting times do not seem to be different using the
  system at the clinic.
  
      ')
  
  invisible(NULL)
}