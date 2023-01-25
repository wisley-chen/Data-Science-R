library(tibble)
#DATAFRAMES--------------------------------------------------------------
#Data frames can contain more than 1 type of data 
#use data.frame() and as.data.frame() 

n <- 3
df1 <- data.frame(
  x1 = rnorm(n),
  x2 = sample(c("Y", "N"), n, replace = TRUE)
)

df1

m1 <- matrix(rnorm(8), nrow = 4)
glimpse(m1)
## num [1:4, 1:2] -0.242 1.0516 0.7157 -0.0563 0.4826 ...
df2 <- as.data.frame(m1) #Transforms matrix into a data frame
#Generic column names are generated 

#To change names, use name() function 
names(df2)
names(df2) <- paste0("col", 1:ncol(df2))

?paste0
?paste
glimpse(df2)

df2

#Add columns 
df2 <- cbind(df2, col11 = 1:4)
df2$col22 <- as.factor( #use the $ operator to create another new column 
  sample(c("L", "M", "H"), nrow(df2), replace = TRUE)
)
df2


#Alternative ways to display data frames
head(df1, n = 2)
tail(df2, n = 1)

#LISTS--------------------------------------------------------------
#Contain heterogeneous types 
#Use list() function
#Use append() function to add to lists
df1
lst1 <- list(df1, m1)
glimpse(lst1)

lst1

#Add another list to an existing list 
lst1 <- append(lst1, list(rnorm(10)))
glimpse(lst1)

#Lists don't always return what you think
lst_ <- append(list(rnorm(10)), rnorm(3))
lst_

#Length of lists
length(lst1) #Returns

#Names can be assigned to elements of lists
nl <- length(lst1)
nl
names(lst1) <- paste("elem", 1:nl, sep = "_") #paste() function has separator 
#argument 
glimpse(lst1)
lst1

#Access elements within list
lst1$elem_1$x2

#SUBSETTING--------------------------------------------------------------
#Every element within a data structure have indices assigned to them
#Available for each dimension of data structure
#R has index starts at 1!

#Subsetting vectors
m1
m1[2:3, 1] #Accesses all values from the 2nd and 3rd row in the 1st column 


m1[1, 1:2] #Access all values from 1st and second column in 1st row
m1[1, ] #Access all vakues within 1st row

#Logical vectors, and how they can be used 
vl <- logical(5)
vl[3:5] <- c(TRUE, TRUE, TRUE) #Change values within vector 
vl

vn <- 1:5
vn[vl] #Everywhere that vl is true, vn will be displayed 

#Subsetting data frames
df1
df1 [3,]
df1 [,2]
df1[1, c("x1", "x2")] #A logical vector is generated. The second parameter 
#is compared with what is within the list. If TRUE, then it is returned. If
#FALSE, nothing is returned 

#Subsetting lists
#list_name[1] returns a LIST
#list_name[[1]] returns the data structure within the list as specified index
#list_name$element_name returns the data structure within the list as specified
#list_name [c(1,3)] returns the 1st and 3rd element 
#list_name [[1]][3] returns the 3rd element of the specified vector

#Subsetting specific elements from a data structure within a list
vn_ <- rnorm(4)
vn_
list(vn_, df1)[[1]][3]

#Defining a new list by subsetting a previously existing list
el1 <- lst1[1]
glimpse(el1)
el1

#Defining a new data structure by subsetting a previously existing list
el2 <- lst1[[1]]
glimpse(el2)

#Subsetting specific elements from a list
lst1
lst1[[1]][1:2, ]$x2 #The $ accessor selects a specific column 

#Statistical and ML functions returns LISTS!
#Example 
fit1 <- lm(magnitude ~ temp, data = stars)
coef(fit1)
typeof(fit1)
fit1[[1]]
typeof(fit1[[1]])

#FYI
inherits(df1[2], "data.frame")
glimpse(df1[2])