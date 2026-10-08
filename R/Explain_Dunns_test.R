#' Explain Dunn's test
#'
#' Prints an explanation of Dunn's test,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.Dunns_test = function() {
  cat('
======================================================================
                             DUNNS TEST
======================================================================

----------------------------------------------------------------------
                      WHY DO WE USE DUNNS TEST?
----------------------------------------------------------------------

  We use this test when we want to control several groups pairwise.
  It usually serves as a post-hoc to a Kruskal-Wallis test, it
  is used to identify significant differences between groups.

----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  As this is a post-hoc we rely on previous recorded data.
  In this setup we use the data from SLExplain.Kruskal_Wallis().
  
  library(FSA)
  
  dunnTest(x~y,
           data=df,
           method="none")     #method="bonferroni" to make a
                              #bonferroni correction to the analysis
  
----------------------------------------------------------------------
                               EXAMPLE
----------------------------------------------------------------------

  We want to investigate the recovery time for patients undergoing 
  three different treatments. The data is collected in number of days
  and Treatment C seems to be non-normally distributed. We chose
  to analyze with Kruskal-Wallis test.
  
  The Kruskal-Wallis test gave a significant difference between the
  groups and we wish to investigate how the groups differ from each
  other. We do this with Dunns test.

  
  library(FSA)
  
  dunnTest(x~y,
           data=df,
           method="none")
           
                   Comparison         Z     P.unadj       P.adj
  1 Treatment A - Treatment B -1.755268 0.079213501 0.079213501
  2 Treatment A - Treatment C -2.750523 0.005950024 0.005950024
  3 Treatment B - Treatment C -0.995255 0.319612271 0.319612271
  
  We see that Treatment A and Treatment C has a p-value < 0.05,
  we reject H0, showing evidence for a significant difference in 
  recovery time between Treatment A and Treatment C.
  
  
  BONFERRONI CORRECTION:
  
  It is generally a good idea to make corrections for multiple
  comparisons to reduce the risk of committing a Type I Error,
  or a False Positive. Bonferroni correction can accomplish this.
    
  library(FSA)
  
  dunnTest(x~y,
           data=df,
           method="bonferroni")
           
                   Comparison         Z     P.unadj      P.adj
  1 Treatment A - Treatment B -1.755268 0.079213501 0.23764050
  2 Treatment A - Treatment C -2.750523 0.005950024 0.01785007
  3 Treatment B - Treatment C -0.995255 0.319612271 0.95883681 
  
  Note that Treatment A and Treatment C comparison p-value rose
  from 0.006, to 0.018, this is still below alpha = 0.05 and we
  still reject H0.
  
')
  
  invisible(NULL)
}