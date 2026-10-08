#' Explain significance levels
#'
#' Prints an explanation of significance levels, it's definition,
#' interpretation, some misconceptions, and connection to hypothesis testing
#'
#' @return Invisibly returns NULL.
#' @export

SLExplain.significance_level = function() {
  cat("
      =======================================================================
                              SIGNIFICANCE LEVELS
      =======================================================================
      
      WHAT ARE SIGNIFICANCE LEVELS?
      
      The significance level, (alpha), is a threshold which is chosen before
      conducting hypothesis testing. It represents the maximum probability
      of making a Type I Error.
      
      A Type I Error occurs when a true null hypothesis (H0) is rejected
      which is also known as a False Positive
      
      Common significance levels are:
        - alpha = 0.05
        - alpha = 0.01
        - alpha = 0.1
      
      Setting the significance level to 0.05 sets the accetable Type I Error
      rate to 5%.
      
      ----------------------------------------------------------------------
                                INTERPRETATION
      ----------------------------------------------------------------------
      
      The significance level is a decision threshold, not a probability of
      true or false.
      
      If an alpha of 0.05 is chosen, and a conducted statistical test gives
      a p-value of 0.03, we reject the H0 since the test showed a value
      lower than the one chosen as the threshold.
      
      Should the same test show a p-value of 0.08, we retain the H0, due to it 
      being above the threshold.
      
      Retaining a H0 does not mean that the H0 is true, it shows that the
      sample used could not reject the H0.
      
      ----------------------------------------------------------------------
                      CONNECTIONS TO HYPOTHESIS TESTING
      ----------------------------------------------------------------------
      
      Hypothesis testing generally consists of:
      
        - Null hypothesis (H0): The hypothesis we test against
        - Alternative hypothesis (H1): What we consider if H0 is rejected
        - Significance level (alpha): The threshold chosen for deciding
          whether the evidence against H0 is strong enough
        - p-value: A measure of how unusual the observed data is if the
                   H0 were true
      
      ----------------------------------------------------------------------
                                MISCONCEPTIONS
      ----------------------------------------------------------------------
      
      A p-value of 0.03 means there is a 3% probability that the H0 is true
        - No, the p-value is calculated assuming the H0 is true. It
          describes how unusual the observed data is under that assumption
      
      p-value < 0.05 proves that the result is true
        - No, statistical significance does not prove the H1. It indicates
          that the data would be unusual under H0 circumstances.
      
      p-value > 0.05 means there is no effect
        - No, it means that the evidence was not enough to reject H0 at the
          chosen significance level. Limited sample size or high variability
          could fail to show an effect.
      
      0.05 is a universal definition of significance
        - No, it is common, but the appropriate significance level depends on
          the context and the consequences of any errors.
      
      ----------------------------------------------------------------------
                              WHY DOES IT MATTER?
      ----------------------------------------------------------------------
      
      There is an important trade-off when choosing alpha.
      
      A smaller alpha, such as 0.01, makes it harder to reject H0. This
      reduces the probability of a Type I Error occurring, but can make it
      harder to find a real effect when there is one.
      
      A larger alpha, such as 0.10, makes it easier to reject H0, however,
      the probability of Type I errors increases.
      
      The significance level detemines how strong the evidence needs to be
      before we reject H0, and it should be based on the context and
      consequences of making different types of errors.
      
      ----------------------------------------------------------------------
                                  SUMMARY
      ----------------------------------------------------------------------
      
      The alpha is a threshold chosen before hypothesis testing. It
      determines how much evidence is required to reject H0.
      
      It represents the maximum acceptable probability of a Type I Error,
      which is rejecting a true H0, or a false positive.
      
      A common choice is 0.05.
      
      Significance levels are compared with p-values
      
        - p < alpha - Reject H0
        - p > alpha - Retain H0
      
      The significance level alpha is not the probability that H0 is true
      and a statistically significant result does not prove that there is
      a large, important or practically meaningful effect.
      
      Choosing a smaller alpha reduces the chance of Type I Errors but
      makes it harder to find a true effect, the alpha level should be
      chosen before looking at the data.")
  invisible(NULL)
}