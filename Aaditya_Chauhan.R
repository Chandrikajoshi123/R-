# ============================================================
#  BCA 4th Semester | R Programming Assignment
#  Student  : Aaditya Chauhan
#  Status   : Regular (Not Debarred)
#  Tasks    : 4 Questions
#  Deadline : 10 April 2026
# ============================================================

# ----------------------------------------------------------
# Q1. [Unit 1 – Variables & I/O]
# Write an R program that asks the user to enter their name
# and age, stores them in variables, and prints a greeting
# message like: "Hello, Aaditya! You are 20 years old."
# ----------------------------------------------------------

name <- readline(prompt = "Enter your name: ")
age <- as.integer(readline(prompt = "Enter your age: "))

cat("Hello, ", name, "! You are ", age, " years old.\n")


# ----------------------------------------------------------
# Q2. [Unit 1 – Basics of R Syntax]
# Create a numeric vector of 10 elements (any values).
# Find and print: sum, mean, median, min, and max.
# ----------------------------------------------------------

v <- c(10, 25, 30, 45, 50, 60, 70, 80, 90, 100)

cat("Sum:", sum(v), "\n")
cat("Mean:", mean(v), "\n")
cat("Median:", median(v), "\n")
cat("Min:", min(v), "\n")
cat("Max:", max(v), "\n")


# ----------------------------------------------------------
# Q3. [Unit 2 – Basic Data Analysis & Charts]
# Create a data frame with 5 students having columns:
# Name, Marks (out of 100), Grade (A/B/C).
# Plot a bar chart showing Marks for each student.
# Add proper title and axis labels.
# ----------------------------------------------------------

students <- data.frame(
  Name = c("A", "B", "C", "D", "E"),
  Marks = c(85, 72, 90, 66, 78),
  Grade = c("A", "B", "A", "C", "B")
)

barplot(
  students$Marks,
  names.arg = students$Name,
  col = "skyblue",
  main = "Student Marks",
  xlab = "Students",
  ylab = "Marks"
)


# ----------------------------------------------------------
# Q4. [Unit 3 – Functions]
# Write a function called `calculate_grade` that accepts
# a numeric marks value and returns the grade:
#   >= 90 → "A+"
#   >= 75 → "A"
#   >= 60 → "B"
#   >= 45 → "C"
#   below 45 → "Fail"
# Test it with at least 5 different marks values.
# ----------------------------------------------------------

calculate_grade <- function(marks) {
  if (marks >= 90) {
    return("A+")
  } else if (marks >= 75) {
    return("A")
  } else if (marks >= 60) {
    return("B")
  } else if (marks >= 45) {
    return("C")
  } else {
    return("Fail")
  }
}

# Testing
test_marks <- c(95, 80, 65, 50, 30)

for (m in test_marks) {
  cat("Marks:", m, "Grade:", calculate_grade(m), "\n")
}
