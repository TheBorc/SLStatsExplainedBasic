#' Explain McNemar's test
#'
#' Prints an explanation of McNemar's test, it's definition,
#' interpretation, examples and setup
#'
#' @return Invisibly returns NULL.
#' @export


SLExplain.mcnemar = function() {
  cat('
======================================================================
                            MCNEMARS TEST
======================================================================

----------------------------------------------------------------------
                    WHY DO WE USE MCNEMARS TEST?
----------------------------------------------------------------------

  We use this test when we want to study paired data and nominal data
  This could be to control how same individuals responds to different
  drugs, or investigate how the same individuals perform on exams
  using different methods of studying.

----------------------------------------------------------------------
                                SETUP
----------------------------------------------------------------------
  
  my_table=matrix(c(),           #Setting up the table
                  nrow=,
                  byrow=TRUE)    #This fills the table horizontally
                                 # -> ->, if FALSE, it fills vertical
                            
  rownames(my_table)=c()          #Adding rownames
  colnames(my_table)=c()          #Adding column names
  
  mcnemar.test(my_table)
  
----------------------------------------------------------------------
                              EXAMPLE
----------------------------------------------------------------------

  We have developed two methods of studying and recruited 50
  individuals to evaluate the methods. They were given 2 seperate but
  similar examss and applied Method A of studying for one exam and
  Method B to study for the other exam. The criteria is Pass or Fail.
  
  my_table=matrix(c(20,
                    12,
                    6,
                    12),           #Setting up the table
                    nrow=2,        #Two rows in the table
                    byrow=TRUE)    #This fills the table horizontally
                                # -> ->, if FALSE, it fills vertical

  rownames(my_table)=c("Method A: Pass", 
                       "Method A: Fail")   #Adding rownames
  colnames(my_table)=c("Method B: Pass",
                       "Method B: Fail")   #Adding column names

  mcnemar.test(my_table)
      
  McNemars Chi-squared test with continuity correction
      
      data:  my_table
      McNemars chi-squared = 1.3889, df = 1, p-value = 0.2386
      
      
  
  We see that we get a p-value > 0.05 and we ratain H0, the two
  methods developed appears to perform similarly to each other
  when analysed using McNemars test.
  
  It is always good to control a table before trusting any tests.
  Simply write:
  
  my_table
  
                 Method B: Pass Method B: Fail
  Method A: Pass             20             12
  Method A: Fail              6             12
  
  This looks like the data we noted down and the test can be trusted.
')
  
  invisible(NULL)
}