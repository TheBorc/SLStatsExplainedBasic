#' Explain Levenes test
#'
#' Prints and explenation of Levenes, it's definition,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.levene = function() {
  cat('
======================================================================
                          LEVENES TEST
======================================================================

----------------------------------------------------------------------
                  WHY DO WE USE LEVENES TEST?
----------------------------------------------------------------------

  If we wish to see if two groups have similar variance. We use this
  information to control assumptions for tests such as default t-test 
  and ANOVA.

----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  library("car")    #leveneTest is under the library car
  
  x=c()             #Creating the vector
  
  y=factor(c())     #Create the groups, factor makes it nominal value
  
  leveneTest(x~y,   #Compare x with y
             center=mean)
  
  This setup allows to control the vector x, against the groups
  created in variable y. It is common to use data frames however, the
  setup will be slightly different.
  
  
  WITH DATAFRAME:
  
    library("car")
  
  x=c()             #Creating the vector
  
  y=factor(c())     #Create the groups, factor makes it nominal value
  
  df=data.frame(x,
                y)
  
  leveneTest(x~y,
             center=mean,
             data=df)
         
----------------------------------------------------------------------
                              EXAMPLE
----------------------------------------------------------------------

  Measuring the height of 5 women and 5 men, after gather the data
  we control for equal variance between the two groups.
  
  library("car")

  x=c(174,        #Creating the vector
      183,
      179,
      189,
      180,
      160,
      165,
      168,
      169,
      154)             

  y=factor(c("M",   #Create the groups, factor makes it nominal value
             "M",
             "M",
             "M",
             "M",
             "F",
             "F",
             "F",
             "F",
             "F"))     

  leveneTest(x~y,   #Comparing x with y
             center=mean)
      
  Levenes Test for Homogeneity of Variance (center = mean)
      Df F value Pr(>F)
      group  1  0.2498 0.6307
      8      
      
  The p-value was above 0.05 and we can retain the H0, there is
  an equal variance between the two groups
      
      
      
  This can be done with dataframe and shortening our group command:
      
  library("car")

  x=c(174,                    #Creating the vector
      183,
      179,
      189,
      180,
      160,
      165,
      168,
      169,
      154)             

  y=factor(c(rep("M", 5),    #Create the groups, factor makes it 
             rep("F", 5)))   #nominal value. We repeat M and F   
                             #5 times each
  df=data.frame(x,
                y)

  leveneTest(x~y,            #Comparing x with y
             center=mean,
             data=df)
      
  Levenes Test for Homogeneity of Variance (center = mean)
      Df F value Pr(>F)
      group  1  0.2498 0.6307
      8      
      
  The result is exactly the same, but the code is more campact.')
  
  invisible(NULL)
}