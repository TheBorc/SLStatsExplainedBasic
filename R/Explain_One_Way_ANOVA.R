#' Explain One-way ANOVA
#'
#' Prints an explanation of One-way ANOVA, it's definition,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.ANOVA_one_way = function() {
  cat('
======================================================================
                            ONE-WAY ANOVA
======================================================================

----------------------------------------------------------------------
                    WHY DO WE USE ONE-WAY ANOVA?
----------------------------------------------------------------------

  We use this test when we want to investigate differences between
  groups of three or more. This could be the investigation of
  different drugs on CRP levels, or how different soils affect plant
  growth.

----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  x=c()
  
  y=factor(c(rep("Grp 1", nr), #It is good to start using rep function
             rep("Grp 2", nr), #The factor() makes the values nominal
             rep("Grp 3", nr)))#nr is the nr of itterations. e.g
                               #18 individuals in grp 3,
                               #replace nr to 18
                              
                    
  df=data.frame(x,             #Create data frame
                y)
  
  summary(aov(x~y,             #Comparing x vector to y groups.
              data=df))        #Look for x and y in df variable
  
----------------------------------------------------------------------
                               EXAMPLE
----------------------------------------------------------------------

  We want to investigate if soil type has an effect on plant growth.
  The soil types we wish to investigate is Sand, Clay and Compost,
  these soils will be used grow tomato plants in. We use five pots
  of each type of soil. The growth is measured in cm.
  
  x=c(13,                     #This is the vector of growth in cm.
      14,
      15,
      12,
      16,
      16,
      18,
      17,
      15,
      15,
      25,
      27,
      24,
      26,
      28)
  
  y=factor(c(rep("Sand", 5), #Creating a factor variable. We wish
             rep("Clay", 5), #to add 5 of each group.
             rep("Compost", 5)))
                               
                              
                    
  df=data.frame(x,             #Create data frame
                y)
  
  summary(aov(x~y,             #Comparing x vector to y groups.
              data=df))        #Look for x and y in df variable
              
  
              Df Sum Sq Mean Sq F value  Pr(>F)    
  y            2  413.3   206.7   82.67 9.6e-08 ***
  Residuals   12   30.0     2.5                    
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

  The test showed a p-value < 0.001 which means we reject H0.
  Somwhere in the data there is a very highly significant 
  difference. To investigate where this difference lies we need
  to perform post-hoc tests such as Tukeys test which is 
  appropriate after a significant One-Way ANOVA.
  
  Tukeys test is explained in SLExplain.tukeys()
')
  
  invisible(NULL)
}