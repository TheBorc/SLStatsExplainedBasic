#' Explain Repeated Measures ANOVA
#'
#' Prints an explanation of Repeated Measures ANOVA, it's definition,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.ANOVA_repeat = function() {
  cat('
======================================================================
                      REPEATED MEASURES ANOVA
======================================================================

----------------------------------------------------------------------
                WHY DO WE USE REPEATED MEASURES ANOVA?
----------------------------------------------------------------------

  Much like the paired t-test we use this test to study a difference
  measured over time on the same subjects. This could be the effect
  of different treatments or the growth rate of plants in different
  environments. 
  
----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  Instead of using rep() funciton you could write each coniditon and
  each subject ID individual, but that will create a very large code
  and its good to start working on utilizing the rep() function.
  
  
  x=c()

  y=factor(c(rep("Condition 1", nr),     #Set the factors "nr" times
             rep("Condition 2", nr),     #each nr is set to the amount 
             rep("Condition 3", nr)))    #of subjects analyzed

  z=factor(c(rep(1:nr,                   #Make nominal values of
                 3)))                    #1 to "nr" of subjects
                                         #They are repeated for ea
                                         #Condition
  df=data.frame(x,
                y,
                z)

  summary(aov(x~y+Error(z/y),            #ANOVA analysis, we measure
              data=df))                  #x against y, Error(z/y) tells
                                         #the test that this is a
                                         #repeated measures ANOVA
                                         #It tells it to look at
                                         #subject ID across conditions
  
----------------------------------------------------------------------
                               EXAMPLE
----------------------------------------------------------------------

  We determined that Compost had a significantly different growth
  rate than Clay or Soil, and we wish to investigate which environment
  is most suitable for growth. We have decided to investigate indoors,
  outdoors and greenhouse environments. To conduct this test we have
  chosen six plants which will spend one day in each environment.
  
  This can be alot to take in, so here is a breakdown of each variable:
  
  x - What are we measuring?
      Growth
      
  y - What conditions are we comparing?
      Indoors - Outdoors - Greenhouse
      
  z - What is being measured repeatedly?
      Plant ID 1 - 2 - 3 - 4 - 5 - 6
  
  x=c(1.2,                    #Growth rate, cm per day
      1.1,
      1.3,
      1.0,
      1.2,
      1.1,
      1.1,
      1.1,
      1.5,
      1.3,
      1.6,
      1.6,
      1.8,
      1.7,
      1.9,
      1.6,
      1.8,
      1.7)

  y=factor(c(rep("Indoors", 6),     #Set the factors 6 times each
             rep("Outdoors", 6),    #As we have 6 plants.
             rep("Greenhouse", 6)))

  z=factor(c(rep(1:6,           #This repeats 1-6, 3 times. Which
                 3)))           #will represent plant ID 1 to 6
                                #for all 3 environments
  df=data.frame(x,
                y,
                z)

  summary(aov(x~y+Error(z/y),   #ANOVA analysis, we measure
              data=df))         #x against y, Error(z/y) tells
                                #the test that this is a
                                #repeated measures ANOVA
                                #It tells it to look at
                                #subject ID across conditions


      
      
    Error: z
            Df Sum Sq Mean Sq F value Pr(>F)
  Residuals  5 0.2067 0.04133               

  Error: z:y
            Df Sum Sq Mean Sq F value   Pr(>F)    
  y          2  1.243  0.6217   32.72 4.09e-05 ***
  Residuals 10  0.190  0.0190                     
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
      
  The p-value at 4.09e-05 is less than 0.05 and we can reject H0.
  There is a significant difference in the growth rate between the
  various conditions, as such, we would like to invetstigate where
  this difference is. We can do that with a pairwise t-test.
      
  Pairwise t-test is explained in SLExplain.t_test_pairwise()')
  
  invisible(NULL)
}