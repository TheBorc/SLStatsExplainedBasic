#' Explain Chi-Square test
#'
#' Prints an explanation of Chi-Square test, it's definition,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.chi_square = function() {
  cat('
======================================================================
                          CHI-SQUARE TEST
======================================================================

----------------------------------------------------------------------
                  WHY DO WE USE CHI-SQUARE TEST?
----------------------------------------------------------------------

  We use this test when we want to test associations and differences 
  of two variables that is nominal or ordinal. For example to see if 
  there is an effect of owning a cat and having a cat allergy, or 
  gaming and daily exercise.

----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  my_table=matrix(c(),        #Creating the result matrix
                  nrow=,
                  byrow=TRUE)             
  
  
  rownames(my_table)=c() #Declare row names with string which is ""
  colnames(my_table)=c() #Declare columnnames with string which is ""
  
  chisq.test(my_table,
             correct=FALSE) #Does not apply Yates continuity correction
  
  
  This setup will work most of the times, however, a assumption for
  running a Pearsons Chi Square test is that expected frequencies are
  not below 5.
  
  To control expected values:
  
  chisq.test(my_table,
             correct=FALSE)$expected  #Control frequencies
  
----------------------------------------------------------------------
                              EXAMPLE
----------------------------------------------------------------------

  We have studied 100 individuals who studies whilst listening
  to music and 100 who studies in silence to see if they pass or
  fail an exam. 
  
  my_table=matrix(c(78,         #Music, Pass
                    22,         #Music, Fail
                    68,         #Silence, Pass
                    32),        #Silence, Fail
                    nrow=2,     #Two rows in the table
                    byrow=TRUE) #This fills the table horizontally
                                # -> ->, if FALSE, it fills vertical
  
  rownames(my_table)=c("Music",   #Set row names
                       "Silence")                              
  colnames(my_table)=c("Pass",    #Set column names
                       "Fail")
  
  chisq.test(my_table,
             correct=FALSE)$expected
  
           Pass Fail
  Music     73   27
  Silence   73   27    
  
  We can see that expected values are all above 5, we can continue
  with a Pearsons Chi Square test with no corrections:
  
  
  chisq.test(my_table,
             correct=FALSE)
  
  Pearsons Chi-squared test
      
    data:  my_table
    X-squared = 2.5368, df = 1, p-value = 0.1112
    
  From a casual inspection of the data it would seem like those who
  study with music passes more often, but there is not enough
  evidence in this data to reject H0 as the p-value > 0.05.
  
----------------------------------------------------------------------
                            IMPORTANT
----------------------------------------------------------------------
  
  When a Chi-Square test show a significant value it shows how two
  variables are associated, however, it does not show that one of
  the variables causes the other.
  
  Owning a lighter can be associated with lung cancer due to smoking, 
  however, lighters does not cause lung cancer.')
  
  invisible(NULL)
}