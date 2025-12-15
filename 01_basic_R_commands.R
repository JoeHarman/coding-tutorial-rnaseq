## This is an R script! You write your R code here, then you can run it in the R console below.
## These lines are comments (beginning with #), and do not run as code.
## You can run any line of code by placing your cursor on the line and pressing Ctrl+Enter.
## You can also highlight multiple lines and run them all at once.



##### Simple calculations #####
# R can act as a calculator as needed

2 + 2
5 * 3
10 / 2
4 ^ 2
sqrt(25)-1


##### Functions #####
# Functions are pieces of pre-written code, packaged into a single "word"
# The sqrt(25) line above is using the sqrt() function to perform a square root on 25
# Arguments are passed to a function within the parenthesis ()
# Multiple arguments can be passed separated by a comma

min(2,4,6) # Returns the smallest value
sum(2,4,6) # Adds all the values together
max(2,4,6) # Returns the largest value

# Accessing function instruction manuals...
# Can be performed with the format ?function_name
?sqrt
?dir

# Argument order
# The order of arguments in many functions is important.
# For dir, it expects arguments in order that they are listed in the help page
# This can be overriden by explicitly naming the argument

dir() # No arguments, uses default settings
dir("test_dir", ".tsv") # Specifies path and pattern arguments
dir("test_dir", full.names = TRUE) # By specifying the "full.names" argument, we skip the order



##### Variables #####
# Variables store values for later use. Think algebra.
# The <- sign is used to add values to a variable.
x <- 10
x
x <- 20 # Using <- on the same variable will overwrite it
x

# Variables can be used in place of regular values
sqrt(x + 5)

# New variables can be constructed from old variables
y <- x + sqrt(25)
y



##### Vectors #####
# A vector is a type of variable, that is an ordered collection of values

# Vectors can be manually constructed using the c() function
x <- c(1,2,3,4,5,6,7,8,9,10)
x
length(x)

# Continuous vectors can also be constructed using colon (:) as a shortcut
y <- 6:10
y

# Complex vector generation can be performed with seq() and rep()
# Don't worry about this for now!
seq(from=1, to=5, by=2)
rep(c(1,5,10), 3)

# Arithmetic can be performed on the whole vector
x
x + 5
x * 2
x / x # Using two vectors will perform a different calculation for each position




##### Indexing #####
# Indexing is a key concept - you can access values in a vector using indices
# An index is specified using square brackets []
# In general, remember () for functions, [] for indexing

z <- 5:35
z[1] # Grab the first entry in the vector
z[15] # Grab the 15th entry in the vector
z[c(5,10,15)] # Grab the 5th, 10th, and 15th entry
x[-3] # Grab everything except the 3rd entry

# Indices can be used to replace specific values
z[5] <- 1000 # Change entry 5 to 1000

# Continuous vectors can also be constructed using colon (:) as a shortcut
y <- 6:10
y

# Complex vector generation can be performed with seq() and rep()
# Don't worry about this for now!
seq(from=1, to=5, by=2)
rep(c(1,5,10), 3)



##### Character vectors #####
# Characters are different to numbers. They are words or letters (called strings).
y <- c("DBT", "Oxford", "Science")
y[2]

# Characters can be used to name numeric vectors
x <- 1:3
names(x) <- y
x

x["Oxford"] # Names can also be used to index a vector

# Special functions can be used on character vectors, such as "unique()"
geneList <- c("Gene1", "Gene2", "Gene3", "Gene1", "Gene4", "Gene5", "Gene3")
geneList
unique(geneList)



##### Logical vectors #####
# Logical vectors are TRUE/FALSE boolean values
# TRUE/FALSE or T/F can be used

z <- c(TRUE, FALSE, TRUE, FALSE)
# or
z <- c(T,F,T,F)

# Booleans can be used in an index to extract values that match "TRUE"
x <- 1:4
x
x[z] # Extract values matching TRUE in z

# Boolean logic operators
# Several operators can be used that will evaluate TRUE or FALSE
5 == 5 # Do the values match exactly?
5 == 10

5 !=5 # Do the values NOT match? ! is a special operator that reverses logic
5 != 10

5 > 10 # Greater than?
5 < 10 # Less than?

5 == 5 & 2 == 2 # & requires both conditions to be TRUE
5 == 5 & 2 == 5

5 == 5 | 2 == 2 # | (OR) requires at least one condition to be TRUE
5 == 5 | 2 == 5

# The %in% operator
# This is a powerful operator. In A %in% B, it asks if any values in A match any values of B.
# Very useful for subsetting
geneList <- c("Gene1", "Gene2", "Gene3", "Gene4", "Gene5", "Gene1", "Gene3")
geneList2 <- c("Gene5", "Gene3")

geneList %in% geneList2 # Which of geneList are present in geneList2?

geneList[geneList %in% geneList2] # Filter geneList for those in geneList2



##### Matrix #####
# A matrix is a table of values, like in Excel
narrowMatrix <- matrix(1:10, nrow=5, ncol=2)
narrowMatrix

# Dimensions
dim(narrowMatrix) # How many rows and columns?
nrow(narrowMatrix) # Just rows?
ncol(narrowMatrix) # Just columns?

# Joining vectors and matrices
x <- 1:5
y <- 11:15
z <- 21:22

newMatrix <- cbind(x,y) # Join x and y as columns (cbind = column bind)
newMatrix

newerMatrix <- rbind(newMatrix, z) # Add z as a row (rbind = row bind)
newerMatrix

# Column/row names for matrices
namedMatrix <- matrix(1:10, ncol=5, nrow=2)
colnames(namedMatrix) <- paste0("Column", 1:5) # colnames() accesses the column names
rownames(namedMatrix) <- paste0("Row", 1:2) # rownames() accesses the row names
namedMatrix

# Indexing matrices
# matrix indexing works a little differently. [] brackets accept two values, one for rows the other for columns

narrowMatrix
narrowMatrix[2,1] # Access column 1 row 2 

narrowMatrix[,2] # Leaving the first value blank allows us to access the entire second column
narrowMatrix[3,] # Leaving the second value blank allows us to access the 3rd row
narrowMatrix[c(2,5),] # Pull 2nd and 5th rows

# Replacing data in matrix
narrowMatrix[1,1] <- 10 # Replace row1/col1 with the value 10
narrowMatrix

narrowMatrix[,2] <- 1 # Replace all of column 2 with the value 1
narrowMatrix



##### Data frames ##### 
# Data frames are an advanced type of matrix. Dataframes allow combinations of numbers and text.

# Example data frame construction
patientName <- c("patient1", "patient2", "patient3", "patient4")
patientType <- rep(c("male", "female"), 2)
survivalTime <- c(1, 30, 2, 20)

dfExample <- data.frame(
  Name = patientName,
  Type = patientType,
  Survival_Time = survivalTime
)
dfExample

# Accessing columns with $ operator
# This is the preferred method for accessing single-columns for data frames
# You can use your TAB key to autocomplete!
dfExample$Name
dfExample$Type
dfExample$Survival_Time

# Indexing and filtering
# Like with matrices, you can index data.frames that same way
# Legibility can be improved with the $ symbol
dfExample[dfExample$Survival_Time < 10, ] # Here we extract all rows where survival time < 10

# New column creation
# Data.frames allow new columns to be constructed using the $ operator
dfExample$newColumn <- rep("newData", nrow(dfExample)) # Create a new column with "newData"
dfExample

# Special data frame operations
head(dfExample, 2) # Find the top rows of the table
tail(dfExample, 2) # Find the bottom rows of the table
View(dfExample) # Export table to navigator
summary(dfExample) # Basic stats for each column



##### Lists ##### 
# Lists are a useful data type that differ from others.
# They are a general container that can basically hold anything, even of different types and lengths..

firstElement <- 1:4
secondElement <- matrix(1:10, nrow=2, ncol=5)
thirdElement <- data.frame(colOne = 4:7, colTwo = c("four", "five", "six", "seven"))

myList <- list(first = firstElement, second = secondElement, third = thirdElement)
myList

# Indexing lists requires the use of double brackets [[]]
myList[[1]]
myList[[2]]
myList[[3]]

# Indexing can also be done with $
myList$second

# If lists contain compatible objects, they can be flattened
myList <- list(first = 1:3, second = 4:6, third = 7:15)
myList
unlist(myList) # unList flattens the list into a single object



##### Coercing and identifying data classes ##### 
# Not sure what data type you have? use the class() function
class(namedMatrix)
class(dfExample)

# If the class isn't what you want, you can attempt to coerce the object
# This can give weird results...
as.character(namedMatrix)
as.vector(namedMatrix)
as.list(namedMatrix)
as.data.frame(namedMatrix)



##### Reading and writing data #####
# The first thing you should identify in R is your working directory
getwd() # Where are you right now??

# If this is not correct (i.e., you're not in the coding tutorial folder)...
setwd() # setwd() can be used.

# Data can be read using the read.table function...
# Sep specifies where it is "\t" (tab-separated) or "," (comma-separated)
Table <- read.table("data/readThisTable.csv", sep=",", header = TRUE)
Table

# Data can be written using write.table function...
write.table(Table, file = "data/writeThisTable.csv", sep = ",")

# RDS saving and loading
# RDS is a special R file that stores variables to disk, allowing for easy import later
saveRDS(myList, "my_list.rds")
my_newList <- readRDS("my_list.rds")
my_newList




##### Libraries #####
# Libraries are collections of code and functions written by others
# These are used for specific tasks, like running RNA-seq stats
# Libraries must be loaded as needed

# To load a library
library(Matrix) # Loads additional functions for matrix manipulation

# To install a package from CRAN repository
install.packages("gplots")

# To install a package from the Bioconductor repository
install.packages("BiocManager")
BiocManager::install("ggplot2")

library(ggplot2)