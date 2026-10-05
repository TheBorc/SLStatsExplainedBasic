#' Explain Spearman's correlation
#'
#' Prints an explanation of Spearman's correlation,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.Spearman = function() {
  cat('
======================================================================
                        SPEARMANS CORRELATION
======================================================================

----------------------------------------------------------------------
                  WHY DO WE USE SPEARMANS CORRELATION?
----------------------------------------------------------------------

  We use this test when we want to investigate relationships between
  variables. It is a non-parametric alternative to Pearsons.
  For example if we wish to look at the relationship between weight 
  and cholesterol, or height and reading score.
  
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
           method="spearman",    #Method defines which correlation test
           exact=FALSE,
           data=df)
                                        
----------------------------------------------------------------------
                               EXAMPLE
----------------------------------------------------------------------

  We want to investigate the relationship between height and 
  reading score. When the data is collected  and analysed we chose 
  to use spearmans correlation to investigate a relationship
  as the assumptions for pearsons were not met during analysis.

  
  x=c(42,                           #Reading scores
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
  
  y=c(118,                          #Height
      137,
      133,
      144,
      148,
      152,
      151,
      158,
      157,
      158,
      161,
      160,
      159,
      161,
      159)

      
  
  
      
  df=data.frame(x,
                y)
                
                
                
  BEFORE CHECKING FOR CORRELATIONS WE CONTROL FOR ASSUMPTIONS
  
  NORMALITY:
  library(mvShapiroTest)        
                                #Checking multivariate normality
  mvShapiro.Test(cbind(x,       #This needs to be a matrix
                       y))      #Hence the cbind()
                       
	          Generalized Shapiro-Wilk test for Multivariate Normality 
	          by Villasenor-Alva and Gonzalez-Estrada

  data:  cbind(x, y)
  MVW = 0.83483, p-value = 0.001375
  
  
  LINEAR RELATIONSHIP & STRONG OUTLIERS:
  plot(x~y,
       data=df)
       
  abline(lm(x~y,
            data=df))
            
            
  The data seems to have a monotonic relationship, meaning that if
  the value of one variable increases the other also increases,
  however it is not completely linear. The multivariate normality
  gave a p-value < 0.05, we reject H0, the data is not normally
  distributed. We chose to use Spearmans correlation.
  
  
  cor.test(x,
           y,
           method="spearman",
           exact=FALSE,
           data=df)
  
	Spearmans rank correlation rho
      
      data:  x and y
      S = 41.61, p-value = 7.53e-07
      alternative hypothesis: true rho is not equal to 0
      sample estimates:
        rho 
      0.9256972 
      
  From the Spearman correlation we get a p < 0.05, we reject H0,
  there is a relationship between height and reading score.
  The correlation coefficient is referred to as rho in the output, 
  the test gave a rho value of 0.93 which indicates a  positive 
  relationship between height and reading score.
  
----------------------------------------------------------------------
                              IMPORTANT
----------------------------------------------------------------------

  Note that correlation does not mean causation. Two variables can
  have a relationship without having an effect on each other. In this
  example we used reading scores and height, which seems to have
  a positive correlation, however, the correlation is mostly driven
  by another variable, age, which affects both height and reding 
  scores.
  
  Age is what we call a confounding effect in our analysisand it is 
  very important to take these into consideration when interpreting 
  correlations.
      
      
      ')
  
  invisible(NULL)
}