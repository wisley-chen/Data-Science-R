library(tidyverse)

#INDICATING ABSENCE-----------------------------------------------------

#NULL is used to denote missing vector------------------------------------
v1 <- NULL
glimpse(v1)

#NA is how to indicate a value in a data structure is missing-----------------
c(1, NA, 3)

#Imputing: relacing missing data with substituted values 
  #Imputing is better than data being discarded

#To test for NA values: use the is.na() function 
  #Do not use x == NA (x will almost always be a different type than NA)

#any() + all() function----------------------------------------------------
v_na <- c(1, 5, NA, 8, NA, 10)
v_na

is.na(v_na) #Test each entry if value is NA or not 

any(is.na(v_na)) #for any(), if any value is TRUE, returns TRUE
all((is.na(v_na))) #for all(), if all values are TRUE, returns TRUE

#Return indices of all TRUE values in a logical vector------------------------
which(is.na(v_na)) #useful for subsetting 

v_na[-which(is.na(v_na))] #subsets the non-NA values 

v_na[-c(3,5)] #This expression is equivalent to the above

#Summary statistics----------------------------------------------------------
mean(v_na) #returns NA
mean(v_na, na.rm = TRUE) #Exclude NA values with na.rm = TRUE 

#CONDITIONAL STATEMENTS-----------------------------------------------------

#if statement used to test a logical expression
  #expression must evaluate TRUE or FALSE 
  #if expression is TRUE, if statement is executed 
if (expression) {
  # statement
}

#else statements---------------------------------------------------------------
  #are evalutated if the if expression is FALSE

if (expression) {
  # if R code statements
} else {
  # else R code statements
}

#Multiple if statements can be chained together ------------------------------
if (FALSE) {
  v_ <- NULL
} else if (TRUE) {
  v_ <- c("else", "if")
} else {
  v_ <- c("else", NA)
}

v_ #will be a vector of "else", "if"

#Another example-------------------------------------------------------------
if (FALSE) {
  cat("Apple")
} else {
  cat("Mango")
}

#case_when--------------------------------------------------------------------- 
  #in dplyr package
  #replaces each if statement with 1 line
case_when(
  FALSE ~ "Apple",
  TRUE ~ "Mango",
)

#Testing a vector with if and else statements--------------------------------
n <- 10
va <- rnorm(n) #generating a vector of 10 random numbers
va > 1 #generates a logical vector testing every value within va if > 1

if (any(va > 1)) {
  cat("A value in va is > 1: ", va[which(va > 1)], "\n")
} else {
  cat("va does not contain any values > 1 \n")
}

#Type coersion, and using that to count and find %--------------------------
v_g5 <- 3:7 >= 5
v_g5 #Logical vector testing if original v_g5 >= 5

sum(v_g5) #sum expects a numeric vector. FALSE = 0, TRUE = 1
#Can use this strategy to count the number of values greater than 5

mean(v_g5) #same principle as above, type coersion in play here
#returns the percentage of values in the vector >=5

#Logical operator difference -------------------------------------------------
n <- 3
va <- rnorm(n)
va

vb <- rnorm(n)
vb


if (any(va > 0.5 & va < 1) || any(vb > 0.5 & vb < 1)) { #both vectors will 
  #return true, and therefore the statement below will be printed
  cat("va or vb have values between 0.5 and 1")
} 

#Breaking down operators------------------------------------------------------
vb

vb_logic <- vb > 0.5 & vb < 1
vb_logic

vb[vb_logic] #subset of vb where elements of vb are true
any(vb_logic) #if atleast 1 value within is true, returns true 

#%in% operator--------------------------------------------------------------- 
fruit <- as.factor(
  c("mango", "apple", "pear", "mango", "pineapple")
)
tropical <- as.factor(c("mango", "pineapple"))
v_logic <- fruit %in% tropical #compare large vector with small vector
#what this does is generate a vector the same length as the longer vector
#and you can see at what index the smaller vector is within the larger vector
glimpse(v_logic)

#ifelse() function-----------------------------------------------------------
new_obj <- ifelse(expression, TRUE_value, FALSE_value)
?ifelse
#dummy variables--------------------------------------------------------------
  #machine learning variables require dummy variable columns 
tfv <- ifelse(fruit %in% tropical, 1, 0)
tfv #this vector converts the logical vector into a numerical vector
table(tfv, fruit)
?table

#Errors with ifelse()--------------------------------------------------------
v_ <- factor(sample(c("y", "n"), 3, replace = TRUE))
glimpse(v_)

glimpse(ifelse(v_ %in% "y", 1, "NA"))

if_else(v_ %in% "y", 1, "NA") #function will fail bc "NA" is a character vector


#Modulo operator-------------------------------------------------------------
  #Returns the remainder of division 
  #Useful for example if you want to print every 3rd value within a vector
35 / 10 ## division
35 %% 10 ## modulo
35 %/% 10 ## quotient

#Using modulo----------------------------------------------------------------
v_ <- letters[1:6]
v_

i_ <- 1:length(v_)
i_

v_[i_ %% 2 == 0] #subsets every 2 value within the letters vector 

