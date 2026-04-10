# ============================================================
#  BCA 4th Semester | R Programming - CRITICAL Bug Fix
#  Student  : Ishita Joshi
#  Status   : DEBARRED + NO ASSIGNMENT SUBMITTED
#  Tasks    : Fix ALL 25 Bugs (each marked with # BUG N)
#  Deadline : 10 April 2026
#  NOTE     : For every bug: write what was wrong and the fix.
#             This file must also be attached in Practical File.
# ============================================================

# ===== UNIT 1: Getting Started with R (Bugs 1-9) =====

# BUG 1 - Wrong data type usage
age <- "21"
next_year <- age + 1              
cat(next_year)
# FIX:
age <- "21"
next_year <- as.numeric(age) + 1
cat(next_year)
# Convert character to numeric using as.numeric

# BUG 2 - Variable name has space
my name <- "Ishita"              
# FIX:
my_name <- "Ishita" #Variable names cannot contain spaces; use underscore _ instead


# BUG 3 - Using = inside cat
cat("Sum =", 5 == 3 + 2)        
# FIX:
pcat("Sum =", 5 + 2)
# == is for comparison, not calculation; use + to compute sum


# BUG 4 - Print vs cat confusion for newline
print("Line 1\nLine 2")         
# FIX:
cat("Line 1\nLine 2\n")
# print() shows \n as text; cat() correctly handles newline characters

# BUG 5 - Negative index misunderstanding
vec <- c(10, 20, 30, 40, 50)
cat(vec[-6])                     
# FIX:
vec <- c(10, 20, 30, 40, 50)
cat(vec[-5]) # Negative index removes that position; use valid index (here -5 removes last element)


# BUG 6 - seq() wrong arguments
s <- seq(1, 10, length = 3, by = 2)  
# FIX:
s <- seq(1, 10, by = 2) # Cannot use length.out and by together; choose one argument only


# BUG 7 - Wrong class check
x <- 42L
cat(class(x) == "numeric")     
# FIX:
x <- 42L
cat(class(x) == "integer")  # 42L is of type "integer"


# BUG 8 - Missing closing parenthesis
cat("Welcome to R Programming"  
# FIX:
cat("Welcome to R Programming") #forget to close the bracket

# BUG 9 - Overwriting built-in function
c <- 5                          
d <- c(1,2,3)                 
cat(d)
# FIX:
c_val <- 5              
d <- c(1,2,3)          # c() now works correctly
cat(d)
# renamed variable to avoid shadowing built-in c()    


# ===== UNIT 2: Working with Data (Bugs 10-17) =====

# BUG 10 - rbind instead of cbind to add column
df <- data.frame(X=1:3, Y=4:6)
new_col <- c(7,8,9)
df <- rbind(df, new_col)       
print(df)
# FIX:
df <- data.frame(X=1:3, Y=4:6)
new_col <- c(7,8,9)
df <- cbind(df, new_col)   
print(df) # use cbind to add a column


# BUG 11 - Filter with single = instead of ==
df2 <- data.frame(Name=c("A","B","C"), Score=c(80,55,70))
passing <- df2[df2$Score = 60, ]   
print(passing)
# FIX:
 df2 <- data.frame(Name=c("A","B","C"), Score=c(80,55,70))
 passing <- df2[df2$Score >= 60, ]   
print(passing)   #used >= instead of = for correct comparison

# BUG 12 - nrow vs ncol confusion
df3 <- data.frame(A=1:4, B=5:8, C=9:12)
cat("Columns:", nrow(df3))     
# FIX:
 df3 <- data.frame(A=1:4, B=5:8, C=9:12)
cat("Columns:", ncol(df3))   #changed nrow() to ncol() to count columns correctly

# BUG 13 - boxplot wrong variable reference
data_vec <- c(22, 35, 41, 29, 55, 18)
boxplot(Data_vec)               
# FIX:
 Data_vec <- c(22,35,41,29,55,18)
boxplot(Data_vec) # changed the lowercase to uppercase
   

# BUG 14 - hist() bin specification wrong
heights <- c(150,162,155,170,168,145,180)
hist(heights, breaks="auto")   
# FIX:
 heights <- c(150,162,155,170,168,145,180)
hist(heights) # removed the "auto" argument

# BUG 15 - Applying mean to entire data frame
df4 <- data.frame(Name=c("X","Y"), Marks=c(75,88))
cat(mean(df4))                 
# FIX:
df4 <- data.frame(Name=c("X","Y"), Marks=c(75,88))
cat(mean(df4$Marks))               # use mean(df4$marks)

# BUG 16 - table() on wrong object type
nums <- 1:10
cat(table(sum(nums)))          
# FIX:
 nums <-
cat(table((nums))       # remove the sum()   

# BUG 17 - Overwriting data frame unintentionally
marks <- c(55,70,80)
marks <- data.frame(marks)
marks <- c(90,95)              
cat(is.data.frame(marks))
# FIX:
    marks_vec <- c(55,70,80)
marks_df <- data.frame(marks_vec)
new_marks <- c(90,95)           
cat(is.data.frame(marks_df)) # do not assign the same vector back to the same variable



# ===== UNIT 3: Control Flow & Functions (Bugs 18-25) =====

# BUG 18 - break outside loop
if (TRUE) {
  break                       
}
# FIX:
    for (i in 1:10){
  if (i>5) {
  break                     
  }
  print(i)
}
# keep the break inside the loop

# BUG 19 - next used incorrectly
for (i in 1:5) {
  if (i == 3) {
    next                       
    cat(i, "")                 
  }
}
# FIX (explain what happens and whether it is a logical bug):
    for (i in 1:5) {
  if (i == 3) {
    next
  }
    cat(i, "")          
}
# next used incorrectly


# BUG 20 - Function argument mismatch
multiply <- function(a, b, c) {
  return(a * b)                
}
cat(multiply(2, 3, 4))
# FIX:
    multiply <- function(a, b, c) {
  return(a * b *c)          
}
cat(multiply(2, 3, 4))
# added c in the calculaion function


# BUG 21 - Nested if missing else
score2 <- 82
if (score2 >= 90) {
  cat("A+")
} else if (score2 >= 75) {
  cat("A")
} else if (score2 >= 60) {
  cat("B")
                              
# FIX:
multiply <- function(a, b, c) {
  return(a * b *c)          
}
cat(multiply(2, 3, 4))
# added c in the calculaion function

# BUG 22 - Boolean returned as string
check_even <- function(n) {
  if (n %% 2 == 0) {
    return("TRUE")             
  }
  return("FALSE")
}
cat(is.logical(check_even(4)))
# FIX:
check_even <- function(n) {
  if (n %% 2 == 0) {
    return(TRUE)            
  }
  return(FALSE)
}
cat(is.logical(check_even(4)))
# removed quotes

# BUG 23 - Recursive function missing decrement
countdown <- function(n) {
  if (n == 0) return("Done!")
  cat(n, "")
  countdown(n)                 
}
countdown(3)
# FIX:
  countdown <- function(n) {
  if (n == 0){
    return("Done!")
  }
  cat(n, "")
  countdown(n-1)  
}
countdown(3)
#  we use n to (n-1) for contuining the loop
  

# BUG 24 - Default argument overriding
greet <- function(name, msg = "Hello") {
  cat(msg, name)
}
greet(msg="Hi", "Ishita")     
# FIX:
  greet <- function(name, msg = "Hello") {
  cat(msg, name)
}
greet(msg="Hi",name= "Ishita")
# we named the argument


# BUG 25 - tryCatch without finally clean-up
safe_log <- function(x) {
  tryCatch({
    log(x)
  }, error = function(e) {
    cat("Error: invalid input\n")
  })                           
}
safe_log(-5)
# FIX:
  safe_log <- function(x) {
  tryCatch({
    if(x<o)stop("negative input not allowed")
   print(log(x))
  }, error = function(e) {
    cat("Error: invalid input\n")
  },
  finally={
    cat("execution completed(cleanup area\n")
})
}
safe_log(10)
safe_log(-5)
# added tryCatch with error handling and finally block for cleanup, also handled negative input

