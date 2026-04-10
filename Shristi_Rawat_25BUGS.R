# ============================================================
#  BCA 4th Semester | R Programming - CRITICAL Bug Fix
#  Student  : Shristi Rawat
#  Status   : DEBARRED + NO ASSIGNMENT SUBMITTED
#  Tasks    : Fix ALL 25 Bugs (each marked with # BUG N)
#  Deadline : 10 April 2026
#  NOTE     : For every bug: write what was wrong and the fix.
#             This file must also be attached in Practical File.
# ============================================================

# ===== UNIT 1: Getting Started with R (Bugs 1-9) =====

# BUG 1 - Missing assignment operator
name "Shristi"              
cat(name)
# FIX:missing assignment operator (<-)corrected.
name <-"shristi"
cat(name)
# BUG 2 - Wrong function name for printing
Print("Hello World")              #
# FIX:corected function name to print()
print("Hello World")
# BUG 3 - Integer division confused with decimal
result <- 7 / 2                   
cat("Integer div:", result)
# FIX:replaced / with %% for integer division 
result <- 7 %/%2
cat("Integer division result:",7%/%2)
# BUG 4 - Wrong concatenation
x <- "R"
y <- "Programming"
z <- x - y                       
cat(z)
# FIX:used paste()for string concatenation instead of subtraction.
x <- "R"
y <- "Programming"
z <- paste(x,y)
cat("z i :",z)
# BUG 5 - Vector created incorrectly
nums <- [1, 2, 3, 4, 5]      
# FIX:used c() to create vector
nums <- c(1, 2, 3, 4, 5)
# BUG 6 - Case sensitive function
my_name <- "shristi rawat"
upper <- Toupper(my_name)        
cat(upper)
# FIX:used correct function toupper() instead of wrong function
my_name <- "shristi rawat"
upper <- toupper(my_name)
cat("Upper name:",upper)
# BUG 7 - Incorrect comparison operator
age <- 18
cat(age = 18)                     #
# FIX:used == for comparision instead of =
age <- 18
cat(age ==18)                   
# BUG 8 - Wrong readline usage
name <- readline(Enter your name:)  
# FIX:promt string should be in quotes in readline()
name <- readline("Enter your name:")
# BUG 9 - Logical NOT operator wrong
is_sunny <- TRUE
cat(!1 is_sunny)                  
# FIX:corrected logical NOT operator usage
is_sunny <- TRUE
cat("Is it sunny?",!is_sunny)                 

# ===== UNIT 2: Working with Data (Bugs 10-17) =====

# BUG 10 - data.frame column wrong type assignment
df <- data.frame(Name=c("A","B"), Score=c("90","85"))
mean_score <- mean(df$Score)       #
cat("Mean:", mean_score)
# FIX:converterd score properly
df <- data.frame(
Name=c("A","B"),
Score=c("90","85")
)
df$Score <-
as.numeric(as.character(df$Score))
mean_score <- mean(df$Score,na.rm=TRUE) 
cat("Mean score:", mean_score)
# BUG 11 - Wrong index for row access
students <- data.frame(Name=c("Anu","Ravi","Priya"), Marks=c(70,85,92))
cat("Second student:", students[1, 1])  
# FIX:studdent[2,1]
students <- data.frame(
  Name= c("Anu","Ravi","Priya"),
  Marks= c(70,85,92))
cat("Second student:", students[2, 1])  
# BUG 12 - Missing na.rm in mean
values <- c(10, NA, 30, NA, 50)
avg <- mean(values)               
cat("Average:", avg)
# FIX:added na.rm=TRUE to ignore the NA valuess
values <- c(10, NA, 30, NA, 50)
avg <- mean(values, na.rm=TRUE)
cat("Average:", avg)
# BUG 13 - Wrong plot type for trend
x <- 1:10
y <- x^2
plot(x, y, type="p")             
# FIX:changed type="l" to type="p"
x <- 1:10
y <- x^2
plot(x, y, type="l")          
# BUG 14 - Pie chart using wrong function
scores <- c(30, 25, 45)
labels <- c("A","B","C")
barplot(scores, labels)      
# FIX:using pie()function instead of barplot
scores <- c(30, 25, 45)
labels <- c("A","B","C")
pie(scores, labels=labels)          
# BUG 15 - Adding column to df incorrectly
df <- data.frame(Name=c("X","Y"), Price=c(100,200))
df["Discount"] = 10               
print(df)
# FIX:added'DISCOUNT'column using $ sign
df <- data.frame(Name=c("X","Y"), Price=c(100,200))
df$Discount <-10
print(df)
# BUG 16 - Accessing nonexistent column
df2 <- data.frame(City=c("Delhi","Mumbai"), Pop=c(300,200))
cat(df2$Population)              
# FIX:use 'pop' instead of 'population'
df2 <- data.frame(City=c("Delhi","Mumbai"), Pop=c(300,200))
cat(df2$Pop)              
# BUG 17 - Wrong summary call
x <- c(5,10,15,20,25)
summery(x)                      
# FIX:correct the spelling
x <- c(5,10,15,20,25)
summary(x)                  

# ===== UNIT 3: Control Flow & Functions (Bugs 18-25) =====

# BUG 18 - Function keyword misspelled
square <- Funtion(n) {            
  return(n * n)
}
cat(square(5))
# FIX:corrected function instead Funtion
square <- function(n) {     
  return(n * n)
}
cat(square(5))
# BUG 19 - Missing return value
cube <- function(n) {
  result <- n^3                   
}
cat(cube(3))
# FIX:added return()to send the result back
cube <- function(n) {
  result <- n^3 
  return(result)
}
cat(cube(3))
# BUG 20 - Infinite for loop
for i in 1:5 {                  
  cat(i, "")
}
# FIX:added parentheses
for (i in 1:5) {                   
  cat(i, "")
}
# BUG 21 - while loop condition never false
n <- 10
while (n >= 1) {
  cat(n, "")
  n <- n + 1                   
}
# FIX:changed + to -
n <- 10
while (n >= 1) {
  cat(n, "")
  n <- n - 1        
}
# BUG 22 - else if without if
score <- 75
else if (score >= 60) {          
  cat("B Grade")
}
# FIX:added an 'if'block before 'else if'
score <- 75
if(score>=90){
  cat("A Grade")
}else if (score >= 60) {     
  cat("B Grade")
}
# BUG 23 - Missing braces in if
x <- 10
if (x > 5)                       
  cat("Greater")
  cat("than five")               
# FIX:added curly braces{} to group both cat statements
x <- 10
if (x > 5) {                  
  cat("Greater")
  cat("than five")
}
# BUG 24 - Wrong recursion base case
factorial_r <- function(n) {
  if (n == 1) return(n)          
  return(n * factorial_r(n - 1))
}
cat(factorial_r(0))          
# FIX:base case should handle n==0
factorial_r <- function(n) {
  if (n == 0) return(n)          
return(n * factorial_r(n - 1))
}
cat(factorial_r(0))           
# BUG 25 - tryCatch used incorrectly
result <- tryCatch(
  log(-1),                     
)
cat("Result:", result)
# FIX:added an error handler function
result <- tryCatch(
  log(-1),
  error = function(e){
    return("Error: Cannot take log of negative number")
  }
)
cat("Result:", result)

