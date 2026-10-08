#' Explain Kruskal-Wallis test
#'
#' Prints an explanation of Kruskal-Wallis test,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.Kruskal_Wallis = function() {
  cat('
======================================================================
                          KRUSKAL-WALLIS
======================================================================

----------------------------------------------------------------------
                    WHY DO WE USE KRUSKAL-WALLIS?
----------------------------------------------------------------------

  We use this test when we want to investigate differences between
  groups of three or more. This is a non-parametric alternative to
  the one-way ANOVA test. This could be the investigation of
  different drugs on CRP levels, or how long the recovery time are
  for different treatments.

----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  x=c()
  
  y=factor(c(rep("Grp 1", nr),        #nr represents how many there
             rep("Grp 2", nr),        #are in the group.
             rep("Grp 3", nr)))
                               
                              
                    
  df=data.frame(x,             
                y)
  
  kruskal.test(x~y,
               data=df)
  
----------------------------------------------------------------------
                               EXAMPLE
----------------------------------------------------------------------

  We want to investigate the recovery time for patients undergoing 
  three different treatments. The data is collected in number of days
  and Treatment C seems to be non-normally distributed. We chose
  to analyze with Kruskal-Wallis test.

  
  x=c(6,      #Treatment A
      7,
      8,
      8,
      9,
      9,
      10,
      11,
      8,      #Treatment B
      9,
      9,
      10,
      10,
      11,
      11,
      12,
      10,     #Treatmtent C
      10,
      10,
      10,
      11,
      11,
      11,
      16)
  
  y=factor(c(rep("Treatment A", 8), #Creating a factor variable. We wish
             rep("Treatment B", 8), #to add 8 of each group.
             rep("Treatment C", 8)))
                               
                              
                    
  df=data.frame(x,             #Create data frame
                y)
  
  kruskal.test(x~y,
               data=df)
              
  
        	Kruskal-Wallis rank sum test

  data:  x by y
  Kruskal-Wallis chi-squared = 7.7579, df = 2, p-value = 0.02067

  The p-value < 0.05 and we reject H0, there is a difference between
  the three groups. A post-hoc is necessary to find out which group,
  this can be done by conducting the Dunns test.
  
  Dunns test will be explained in SLExplain.Dunns_test().

')
  
  invisible(NULL)
}