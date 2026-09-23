#' Explain Tukey's test
#'
#' Prints an explanation of Tukey's test, it's definition,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.tukeys = function() {
  cat('
======================================================================
                            TUKEYS TEST
======================================================================

----------------------------------------------------------------------
                    WHY DO WE USE TUKES TEST?
----------------------------------------------------------------------

  We commonly use this test as a post-hoc following a significant
  value from a One-Way ANOVA test. One-Way ANOVA tells us that there
  is a difference of means between groups, whilst Tukeys invistigate
  which groups differ.
----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  Since this is a post-hoc we rely in previously recorded data.
  In this setup we use the data from SLExplain.ANOVA_one_way().
  
  TukeyHSD(One-way ANOVA test)
  
----------------------------------------------------------------------
                               EXAMPLE
----------------------------------------------------------------------

  We want to investigate if soil type has an effect on plant growth.
  The soil types we wish to investigate is Sand, Clay and Compost,
  these soils will be used grow tomato plants in. We use five pots
  of each type of soil. The growth is measured in cm.
  
  The One-Way ANOVA that was conducted on the data set showed a
  significant difference and we would like to inspect where this
  difference occurs.
  
  TukeyHSD(aov(x~y,
              data=df))
              
    Tukey multiple comparisons of means
    95% family-wise confidence level

  Fit: aov(formula = x ~ y, data = df)

  $y
               diff        lwr        upr     p adj
  Compost-Clay   10   7.332136 12.6678637 0.0000010
  Sand-Clay      -2  -4.667864  0.6678637 0.1545800
  Sand-Compost  -12 -14.667864 -9.3321363 0.0000001
  
  We can see that padj shows a p-value > 0.05 between Sand and
  Clay indicating a smaller difference than what ANOVA showed, 
  however, when Compost is compared to both Sand and Clay it
  shows a p-value < 0.001, which indicates that Compost has
  a significantly larger effect on growth when compared to
  Clay and Sand.
')
  
  invisible(NULL)
}