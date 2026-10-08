#' Explain Pairwise t-test (Multiple paired t-test)
#'
#' Prints an explanation of Pairwise t-test (Multiple paired t-test),
#' it's definition, interpretation, examples and setup.
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.t_test_pairwise = function() {
  cat('
======================================================================
               PAIRWISE T-TEST (MULTIPLE PAIRED T-TEST)
======================================================================

----------------------------------------------------------------------
                  WHY DO WE USE PAIRWISE T-TEST?
----------------------------------------------------------------------

  Pairwise t-test is actually multiple paired t-tests. It investigates
  a difference in paired measurements. It is useful as a post hoc
  following a statistically significant Repeated Measures ANOVA result, 
  when the data collection is from more than two timepoints.
  
----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  Since this is a post hoc we rely on previously recorded data.
  In this setup we use the data from SLExplain.ANOVA_repeat().
  
  pairwise.t.test(x,
                  y,
                  paired=TRUE,
                  p.adjust.method="none",
                  data=df)
  
  
----------------------------------------------------------------------
                               EXAMPLE
----------------------------------------------------------------------

  We determined that Compost had a significantly different growth
  rate than Clay or Sand, and we wish to investigate which environment
  is most suitable for growth. We have decided to investigate indoors,
  outdoors and greenhouse environments. To conduct this test we have
  chosen six plants which will spend one day in each environment.
  
  One of the environments had a significant impact on the growth of
  the plants. We wish to investigate which environment differs by 
  using pairwise t-testing.
  
  
  pairwise.t.test(x,
                  y,
                  paired=TRUE,
                  p.adjust.method="none",
                  data=df)
                  
      
    	Pairwise comparisons using paired t tests 
  
  data:  x and y 

           Greenhouse Indoors
  Indoors  7.7e-07    -      
  Outdoors 0.0081     0.0706 

  P value adjustment method: none 
  
  Multiple paired t-tests show the p-values for comparisons between each 
  environment. Between indoors and outdoors there is a p-value > 0.05 
  and we retain H0, there is not enough evidence to show a difference 
  in growth between them.
  
  However, greenhouse shows a p-value < 0.05 when compared against
  both indoors and outdoors and we can reject H0, there is a 
  significant difference in growth between greenhouse and indoors,
  as well as greenhouse and outdoors.
  
  Note that we usually want to include a correction such as Holm
  or Bonferroni before declaring something statistically significant.
      
      ')
  
  invisible(NULL)
}