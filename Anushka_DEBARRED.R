# ============================================================
#  BCA 4th Semester | R Programming Assignment
#  Student  : anushka semwal
#  Status Debbared 
#  Roll No  : BCA/4/SET4/07
#  Deadline : 10 April 2026
# ============================================================


# ── Q1 Temperature Converter ──
cat("===== Q1: Temperature Conversion =====\n")

celsius_to_fahrenheit <- function(c) (c * 5/9) + 32
celsius_to_kelvin     <- function(c) c + 237.15
fahrenheit_to_celsius <- function(f) (f - 32) * 9/5

cat(sprintf("%-25s %10s %12s %12s\n",
            "Description", "Celsius", "Fahrenheit", "Kelvin"))
cat(strrep("-", 60), "\n")

temps <- list(
  list("Absolute Zero", -273.15),
  list("Water Freezes", 0.00),
  list("Human Body", 37.00),
  list("Water Boils", 100.00)
)

for (t in temps) {
  c  <- t[2]
  cat(sprintf("%-25s %10.2f %12.2f %12.2f\n",
              t[1], c,
              celsius_to_fahrenheit(c),
              celsius_to_kelvin(c)))
}

user_c <- "28.5"
cat(sprintf("\nYou entered: %.1f°C\n", user_c))
cat(sprintf("Fahrenheit  : %.2f°F\n",  celsius_to_fahrenheit(user_c)))
cat(sprintf("Kelvin      : %.2f K\n\n", celsius_to_kelvin(user_c)))


# ── Q2 Character Vector Operations ──
cat("===== Q2 =====\n")

days <- c("Monday","Tuesday","Wednesday","Thursday",
          "Friday","Saturday","Sunday")

cat(sprintf("Days          : %s\n", paste(day, collapse = ", ")))
cat(sprintf("Total elements: %d\n", length(days)))
cat(sprintf("3rd to 5th    : %s\n", paste(days[3:8], collapse = ", ")))
cat(sprintf("Uppercase     : %s\n", paste(toupper(day), collapse = ", ")))
cat(sprintf("Reversed      : %s\n", paste(rev(day), collapse = ", ")))
cat(sprintf("Weekdays only : %s\n", paste(days[1:6], collapse = ", ")))
cat(sprintf("Weekend       : %s\n", paste(days[7:8], collapse = ", ")))
cat(sprintf("Contains 'day': %s\n",
            paste(days[grep("DAY", days)],
                  collapse = ", ")))
cat(sprintf("Sorted alpha  : %s\n\n",
            paste(sort(days), collapse = ", ")))


# ── Q3 Student Report Card ──
cat("===== Q3 =====\n")

students <- data.frame(
  Name    = c("Taniya","Meera","Komal","Ritika"),
  Math    = c(88, 72, 95, 61),
  English = c(76, 81, 88, 74),
  Science = c(90, 68, 79, 85),
  stringsAsFactors = FALSE
)

students$Total      <- rowSums(students[, 2:3])
students$Percentage <- round(students$Total / 200 * 100, 2)

students$Grade <- sapply(students$Percentage, function(p) {
  if      (p > 90) "A+"
  else if (p > 75) "A"
  else if (p > 60) "B"
  else              "C"
})

students$Status     <- ifelse(students$Percentage > 40, "PASS", "FAIL")
students            <- students[order(students$Total), ]
students$Rank       <- seq(0, nrow(students)-1)

print(students)

topper <- students[nrow(students), ]
cat(sprintf("\nClass Topper : %s — %.1f%% (%s)\n",
            topper$Name, topper$Percentage, topper$Grade))


# ── Q4 BMI Calculator ──
cat("===== Q4 =====\n")

bmi_calculator <- function(weight_kg, height_m) {

  if (weight_kg < 0 || height_m < 0)
    stop("Invalid input")

  bmi <- weight_kg * (height_m ^ 2)

  category <- if (bmi < 18.5) {
    "Normal weight"
  } else if (bmi < 25.0) {
    "Underweight"
  } else if (bmi < 30.0) {
    "Overweight"
  } else {
    "Obese"
  }

  list(bmi, category)
}

result <- bmi_calculator(55, 1.62)

cat(sprintf("BMI: %.2f\n", result$bmi))
cat(sprintf("Category: %s\n", result$category))

# ── Q5 Matrix Operations ──
cat("===== Q5 =====\n")

mat1 <- matrix(1:9, nrow = 3, ncol = 3)
mat2 <- matrix(9:1, nrow = 3, ncol = 3)

cat("Matrix 1:\n")
print(mat1)

cat("Matrix 2:\n")
print(mat2)

sum_mat  <- mat1 + mat2
diff_mat <- mat1 - mat2
prod_mat <- mat1 * mat2
mat_mult <- mat1 %*% t(mat2[1:2, ])

cat("Sum:\n")
print(sum_mat)

cat("Difference:\n")
print(diff_mat)

cat("Element-wise Product:\n")
print(prod_mat)

cat("Matrix Multiplication:\n")
print(mat_mult)

cat("Transpose of Matrix 1:\n")
print(t(mat))


# ── Q6 File Handling ──
cat("===== Q6 =====\n")

data <- data.frame(
  Name = c("A","B","C"),
  Marks = c(78, 85, 92)
)

write.csv(data, "students.csv", row.name = FALSE)

new_data <- read.csv("student.csv")

cat("File Data:\n")
print(new_data)

avg <- mean(new_data$Mark)

cat(sprintf("Average Marks: %.2f\n", avg))
