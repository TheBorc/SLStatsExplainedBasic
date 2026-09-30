#' Explain Friedman's test
#'
#' Prints an explanation of Friedman's test,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.Friedmans = function() {
  cat('
======================================================================
                          FRIEDMANS TEST
======================================================================

----------------------------------------------------------------------
                    WHY DO WE USE FRIEDMANS TEST?
----------------------------------------------------------------------

  We use this test when we want to investigate differences between
  three or more paired measurements. This is a non-parametric 
  alternative to repeated-measures ANOVA. This could be the 
  investigation of the effect of different treatments on tumor size, 
  or heart-rate after different exercise intensities.

----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  x=c()
  
  y=factor(c(rep("Condition 1", nr),    #nr represents how many there
             rep("Condition 2", nr),    #are in each group.
             rep("Condition 3", nr)))
                               
  z=factor(c(rep(1:nr, 3)))             #replace nr for the amount
                                        #of individual IDs
  df=data.frame(x,             
                y,
                z)
  
  friedman.test(x~y|z,                  #x - Measured value
                data=df)                #y - Condition to compare
                                        #z - Compare within subject ID
                                        
----------------------------------------------------------------------
                               EXAMPLE
----------------------------------------------------------------------

  We want to investigate the effect of different intensity of training
  has on the heart-rate of 8 individuals. The data observed was
  non-normally distributed and we chose to use Friedmans test for
  the analysis.

  
  x=c(82,      #Low intensity
      84,
      85,
      86,
      87,
      89,
      96,
      115,
      101,     #Medium intensity
      103,
      104,
      105,
      106,
      108,
      116,
      137,
      124,     #High intensity
      126,
      127,
      128,
      129,
      131,
      140,
      162)
  
  y=factor(c(rep("Low intensity", 8),     #8 measurements in
             rep("Medium intensity", 8),  #each condition
             rep("High intensity", 8)))
                               
  z=factor(c(rep(1:8, 3)))                #Subject 1-8, 3 times
                    
  df=data.frame(x,             
                y,
                z)
  
  friedman.test(x~y|z,
                data=df)
              
  
	  Friedman rank sum test

  data:  x and y and z
  Friedman chi-squared = 16, df = 2, p-value = 0.0003355
  
  The p-value < 0.05 shows a significant difference between the three
  intensities of exercise, we reject H0. A pairwise Wilcoxon signed-
  rank test can be used as a post-hoc to investigate the difference.
  
  
  
  POST-HOC WITH PAIRWISE WILCOXON SIGNED-RANK TEST:
  
  pairwise.wilcox.test(x,
                       y,
                       p.adj="bonferroni",
                       exact=FALSE,
                       correct=FALSE,
                       paired=TRUE,
                       data=df)
                       
    	Pairwise comparisons using Wilcoxon signed rank test 

  data:  x and y 
  
                   High intensity Low intensity
  Low intensity    0.025          -            
  Medium intensity 0.025          0.025        

  P value adjustment method: bonferroni 
  
  The p-value < 0.05 for each intensity compared to the others. We
  reject H0 for each pair, this gives evidence that each intensity
  gives a significantly different heart-rate compared to each other.
  
----------------------------------------------------------------------
                              IMPORTANT
---------------------------------------------------------------------- 

  Non-parametric tests have less statistical power than their parametric
  counterparts. In this example the 0.025 derives from the ranking of 
  change between subjects and the conditions, thus, the amount of 
  change is not recorded. This is why we get a 0.025 p-value between 
  low and high intensity, just as we get when we compare with medium..

')
  
  invisible(NULL)
}