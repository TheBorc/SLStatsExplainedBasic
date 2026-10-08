#' Explain Mann-Whitney U test
#'
#' Prints an explanation of Mann-Whitney U test,
#' it's definition, interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.mann_whitney_U = function() {
  cat('
======================================================================
                        MANN-WHITNEY U TEST
======================================================================

----------------------------------------------------------------------
                  WHY DO WE USE MANN-WHITNEY U TEST?
----------------------------------------------------------------------

  Mann-Whitney U can be used as a non-parametric version of the 
  independent two-samples t-test. It is used when we want to
  investigate differences in two independent samples, for example
  reaction times between two groups or pain scores for two different
  methods.
  
----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  As this is a non-parametric test, always control your data with
  a normality test such as shapiro.test(), unless the data is ordinal.
  
  
  x=c()                         
  
  y=factor(c(rep("Grp 1", nr),    #Exchange nr for number of IDs
             rep("Grp 2", nr)))   #In respective group.
  
  df=data.frame(x,
                y)
  
  wilcox.test(x~y,              
              exact=FALSE,      #Use an approximate p-value
              correct=FALSE,    #No continuity correction
              data=df)    
  
  Going into approximation of the p-value instead of exact and why
  we do not apply continuity correction to the data is beyond the
  scope of this basic tutorial.
  
----------------------------------------------------------------------
                               EXAMPLE
----------------------------------------------------------------------

  We want to investigate whether pain scores differ between two
  separate treatments for back pain. The data collected are ordinal
  so we chose to use Mann-Whitney U test.
  
  x=c(10,
      8,
      0,
      0,
      1,
      6,
      1,
      1,
      2,
      1,
      3,
      6,
      3,
      1,
      5,
      6,
      7,
      6,
      8,
      1,
      7,
      4,
      5,
      5,
      7,
      5,
      7,
      0,
      7,
      6)
      
  y=factor(c(rep("Treatment A", 15),
             rep("Treatment B", 15)))
             
  df=data.frame(x,
                y)
  
  wilcox.test(x~y,
              exact=FALSE,
              correct=FALSE,
              data=df)
              
        	Wilcoxon rank sum test

  data:  x by y
  W = 63.5, p-value = 0.04004
  alternative hypothesis: true location shift is not equal to 0
  
  As the p-value < 0.05 we reject H0, there is a significant difference
  between Treatment A and Treatment B. A simple tapply() will help us
  investigate further:
  
  
  
  tapply(x, y, sum)       #This sums all x values for each factor
                          #in y.
  
  Treatment A Treatment B 
          48          81
          
  Treatment A appears to give a significantly lower pain score than
  Treatment B.
      ')
  
  invisible(NULL)
}