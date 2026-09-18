#' Explain p-values
#'
#' Prints and explenation of p-values, it's definition, interpretation, 
#' some misconceptions, and connection to hypothesis testing
#'
#' @return Invisibly returns NULL.
#' @export

SLExplain.p_value = function() {
  cat("
      =======================================================================
                                P-VALUE
      =======================================================================
      
      WHAT IS P-VALUE?
      
      A p-value is the probability of obtaining a test statistic just as
      extreme as the one observed in your sample. Assuming that the null
      hypothesis (H0) is true
      
      If the null hypothesis is true, there is a 'p-value' chance that
      your next sample testing will be as extreme
      
      ----------------------------------------------------------------------
                              Null Hypothesis (H0)
      ----------------------------------------------------------------------
      
      The null hypothesis represents the assumption being tested
      
        H0: The population mean height is 165
        H1: The population mean height is different from 165
      
      The p-value is calculated under the assumption that H0 is true
      
      ----------------------------------------------------------------------
                              INTERPRETATION OF P-VALUE
      ----------------------------------------------------------------------
      
      A small p-value indicates a relatively unusual sample set if the null
      hypothesis is true.
      A small p-value would provide evidence against H0
      
      A large p-value indicates a sample set that has a mean near the expected 
      true mean of the population.
      A large p-value would provide evidence supporting H0, however, it does
      not prove the H0 to be true!
      
      ----------------------------------------------------------------------
                              SIGNIFICANCE LEVELS
      ----------------------------------------------------------------------
      
      A significance level (alpha) is most times chosen before conducting an 
      analysis.
      
      Most common choices are:
      
        alpha = 0.05
        alpha = 0.01
        alpha = 0.10
      
      Which is usually interpreted as
        
        p-value < alpha = Reject H0
        p-value > alpha = Retain H0
      
      Indicating that p-value < alpha is a significant result.
      
      ----------------------------------------------------------------------
                            MISCONCEPTIONS
      ----------------------------------------------------------------------
      
      A p-value is NOT:
        
        - The probability that H0 is true
        - The probability that H1 is true
        - The probability that the results happened by chance
        - A measure of the size or importance of an effect
      
      A p-value of 0.03 does NOT mean that 'There is a 3% probability that
      H0 is true'.
      
      What it tells us is that there is a 3% chance of having a similarly
      extreme result when testing a different sample of the same population.
      
      
      ----------------------------------------------------------------------
              STATISTICAL SIGNIFICANCE VS PRACTICAL SIGNIFICANCE
      ----------------------------------------------------------------------
      
      A small p-value does not sgiw that an effect is large or practically
      important.
      
      With a very large sample, minor effects can produce a small p-value.
      
      Which means that p-values should generally be considered together with:
      
        - Effect Size
        - Confidence Intervals
        - Sample Size
        - Study Design
        - Subject-matter context
      
      ----------------------------------------------------------------------
                        ONE-SIDED VS TWO-SIDED TESTS
      ----------------------------------------------------------------------
      
      A two-sided test considers H0 in both directions
      
      A one-sided test considers H0 from on specified direction
      
      Which mean that a two-sided tests checks for 'A change from H0'. 
      
      Whilst a one-sided test would check for example 'Is the result smaller 
      than H0' and would not consider a result larger than H0 to hold any 
      practical significance.
      
      ----------------------------------------------------------------------
                                    SUMMARY
      ----------------------------------------------------------------------
      
      p-value:
        Probability of observing a result at least this extreme,
        assuming a true null hypothesis.
      
      Small p-value:
        Data are relatively inconsistent with H0. Serves as evidence
        against H0
        
      Large p-value:
        Data are not particularly inconsistent with H0. This does not mean
        that H0 is true.
        
      Neither a small or large p-value serves as proof that H0 is true or 
      false.")
  
  invisible(NULL)
}