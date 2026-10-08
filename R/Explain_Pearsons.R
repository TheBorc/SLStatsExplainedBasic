#' Explain Pearson's correlation
#'
#' Prints an explanation of Pearson's correlation,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.Pearson = function() {
  cat('
======================================================================
                        PEARSONS CORRELATION
======================================================================

----------------------------------------------------------------------
                  WHY DO WE USE PEARSONS CORRELATION?
----------------------------------------------------------------------

  We use this test when we want to investigate relationships between
  variables. For example if we wish to look at the relationship
  between weight and cholesterol, or childrens age and reading score.
  
----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  Note that there are a few assumptions to control. We will go
  through them at the example, but the following is the most basic
  of setups, always try to include data frames:
  
  x=c()
  
  y=c()
  
  df=data.frame(x,
                y)
  
  cor.test(x,
           y,
           method="pearson",    #Method defines which correlation test
           data=df)
                                        
----------------------------------------------------------------------
                               EXAMPLE
----------------------------------------------------------------------

  We want to investigate the relationship between children age
  between 6 and 12 and reading score. When the data is collected
  and analysed we chose to use pearsons correlation to investigate a 
  relationship as the assumptions for pearsons were met during analysis.

  
  x=c(42,                       #Reading scores
      48,
      47,
      53,
      55,
      61,
      60,
      66,
      68,
      74,
      73,
      80,
      82,
      88,
      65)
  
  y=c(6,                        #Age
      6,
      7,
      7,
      8,
      8,
      9,
      9,
      10,
      10,
      11,
      11,
      12,
      12,
      9)
  
  
      
  df=data.frame(x,
                y)
                
                
                
  BEFORE CHECKING FOR CORRELATIONS WE CONTROL FOR ASSUMPTIONS
  
  NORMALITY:
  library(mvShapiroTest)        
                                #Checking multivariate normality
  mvShapiro.Test(cbind(x,       #This needs to be a matrix
                       y))      #Hence the cbind()
                       
     	Generalized Shapiro-Wilk test for Multivariate Normality by 
  	  Villasenor-Alva and Gonzalez-Estrada

  data:  cbind(x, y)
  MVW = 0.97027, p-value = 0.9511
  
  
  LINEAR RELATIONSHIP & STRONG OUTLIERS:
  plot(x~y,
       data=df)
       
  abline(lm(x~y,
            data=df))
            
            
  The data was normally distributed and the relationship appears
  to be linear with no strong outliers when we observe the 
  scatterplot. We continue with Pearsons.
  
  
  
  cor.test(x,
           y,
           method="pearson",
           data=df)
  
  	Pearsons product-moment correlation
      
      data:  x and y
      t = 15.01, df = 13, p-value = 1.369e-09
      alternative hypothesis: true correlation is not equal to 0
      95 percent confidence interval:
        0.9166603 0.9909948
      sample estimates:
        cor 
      0.9723403 
      
  From the Pearsons correlation we get a p < 0.05, we reject H0,
  there is a relationship between age and reading score.
  The r value is referred to as cor in the output, the test gave
  a cor value of 0.97 which indicates a strong positive relationship
  between age and reading score.
')
  
  invisible(NULL)
}