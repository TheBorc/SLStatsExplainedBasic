#' Explain Independent two-sample t-test
#'
#' Prints and explenation of two-sample t-test, it's definition,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.t_test_two_sample = function() {
  cat('
======================================================================
                  INDEPENDENT TWO-SAMPLE T-TEST
======================================================================

----------------------------------------------------------------------
            WHY DO WE USE INDEPENDENT TWO-SAMPLE T-TEST?
----------------------------------------------------------------------

  We use this test when we wish to see if means between two groups
  are significantly different. For example, if we wish to compare
  blood preassure from a treament or placebo group, or height between
  women and men.

----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  x=c()             #Creating the vector
  
  y=factor(c())     #Create the groups, factor makes it nominal value
  
  t.test(x~y,       #Test x against y
         var.equal=TRUE)       #We have equal variance
  
  This setup allows to control the vector x, against the groups
  created in variable y. It is common to use data frames however, the
  setup will be slightly different.
  
  
  WITH DATAFRAME:
  
  x=c()             #Creating the vector
  
  y=factor(c())     #Create the groups, factor makes it nominal value
  
  df=data.frame(x,  #Creating data frame
                y)
  
  t.test(x~y,
         data=df    #It will look for x and y in variable df
         var.equal=TRUE)   #We have equal variance 
----------------------------------------------------------------------
                              EXAMPLE
----------------------------------------------------------------------

  Measuring the height of 5 women and 5 men, after normality in
  variance between the groups has been established we wish to compare
  them and see if there is a significant difference.
  
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

  t.test(x~y,               #Comparing x with y
         var.equal=TRUE)    #We have equal variance
           
      
  	Two Sample t-test

  data:  x by y
  t = -4.7847, df = 8, p-value = 0.001382
  alternative hypothesis: true difference in means between 
  group F and group M is not equal to 0
  95 percent confidence interval:
   -26.378831  -9.221169
  sample estimates:
  mean in group F mean in group M   
            163.2           181.0 
      
  The p-value < 0.01 shows a highly significant difference in height
  between men and women
      
      
      
  This can be done with dataframe and shortening our group command:


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

  t.test(x~y,                #Comparing x with y
         data=df,            #Using df
         var.equal=TRUE)     #We have equal variance
      
    	Two Sample t-test

  data:  x by y
  t = -4.7847, df = 8, p-value = 0.001382
  alternative hypothesis: true difference in means between 
  group F and group M is not equal to 0
  95 percent confidence interval:
   -26.378831  -9.221169
  sample estimates:
  mean in group F mean in group M   
            163.2           181.0  
      
  The result is exactly the same, but the code is more campact.
      
  
  t.test() uses Welch Two Sample t-test by default, thus we
  have to set the var.equal=TRUE when equal variance
  can be reasonably assumed')
  
  invisible(NULL)
}