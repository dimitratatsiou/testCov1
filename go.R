# Loading and cleaning data
source("include/prep.R")


# Question 1

cat("Σύνολο κρουσμάτων: ")
cat( nrow(cases) )
cat("\n")
cat("Σύνολο συμπτωματικών: ")
cat( sum(cases$symptomatic, na.rm=TRUE) )
cat("\n")
cat("Σύνολο ασυμπτωματικών: ")
cat( sum(!cases$symptomatic, na.rm=TRUE) )
cat("\n")



# Question 2

source("include/q2.R") # This will plot figures in /output



# Question 3

source("include/q3.R") # This will plot figures in /output


