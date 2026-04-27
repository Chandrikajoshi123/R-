# ============================================================
#  BCA 4th Semester | R Programming Assignment
#  Student  : Saniya Chauhan
#  Status: Debarred
#  Deadline : 10 April 2026
#bugs fixed :improved output formatting and checks
# ── Q1 [Unit 1] All Data Types with Verification ────────────
cat("===== Q1: R Data Types =====\n")

# Integer
age <- 21L
cat(sprintf("integer   | value: %-8s | is.integer: %s | class: %s\n",
            age, is.integer(age), class(age)))

# Double
height <- 5.9
cat(sprintf("double    | value: %-8s | is.double: %s | class: %s\n",
            height, is.double(height), class(height)))

# Character
name <- "Saniya Chauhan"
cat(sprintf("character | value: %-15s | is.character: %s | nchar: %d\n",
            name, is.character(name), nchar(name)))

# Logical
is_pass <- TRUE
cat(sprintf("logical   | value: %-8s | is.logical: %s | class: %s\n",
            is_pass, is.logical(is_pass), class(is_pass)))

# Complex
z <- 3 + 4i
cat(sprintf("complex   | value: %-8s | Mod: %.2f | Arg: %.4f rad\n",
            z, Mod(z), Arg(z)))

# Raw
r <- as.raw(65L)
cat(sprintf("raw       | value: %s | is.raw: %s\n\n",
            r, is.raw(r)))

# Type Conversion Table
cat("Type Conversion Table:\n")
cat(sprintf("  %-10s → integer: %-5s char: %-10s logical: %s\n",
            "3.7", as.integer(3.7), as.character(3.7), as.logical(3.7)))

cat(sprintf("  %-10s → integer: %-5s double: %-10s logical: %s\n",
            "TRUE", as.integer(TRUE), as.double(TRUE), as.logical(TRUE)))

cat(sprintf("  %-10s → double: %-10s logical: %s\n\n",
            '"0"', as.double("0"), as.logical("TRUE")))
# ── Q2 [Unit 2] Matrix Operations ────────────
cat("===== Q2: Matrix Operations =====\n")

M <- matrix(c(2, 4, 1,
              7, 3, 8,
              5, 6, 9),
            nrow = 3, ncol = 3, byrow = TRUE)

cat("Matrix M:\n")
print(M)

# Transpose
cat("\nTranspose of M:\n")
print(t(M))

# Row & Column operations
cat("\nRow Sums  :", rowSums(M), "\n")
cat("Col Sums  :", colSums(M), "\n")
cat("Row Means :", rowMeans(M), "\n")
cat("Col Means :", colMeans(M), "\n")

# Basic operations
cat("\nM × 5:\n")
print(M * 5)

cat("\nElement-wise Square (M^2):\n")
print(M ^ 2)

# Matrix multiplication
cat("\nMatrix Multiplication (M × M):\n")
print(M %*% M)

# Determinant
det_M <- det(M)
cat(sprintf("\nDeterminant of M: %.2f\n", det_M))

# Inverse (if possible)
if (abs(det_M) > 1e-10) {
  inv_M <- solve(M)
  cat("\nInverse of M:\n")
  print(round(inv_M, 4))
}

# Diagonal & Trace
cat(sprintf("\nMain Diagonal: %s\n", paste(diag(M), collapse = ", ")))
cat(sprintf("Trace (sum of diagonal): %d\n\n", sum(diag(M))))
# ── Q3 [Unit 2] iris Dataset ────────────
cat("===== Q3: iris Dataset =====\n")

data(iris)

# Basic info
cat("Total Rows:", nrow(iris), "\n")
cat("Total Columns:", ncol(iris), "\n")

# Species count
cat("\nSpecies Count:\n")
print(table(iris$Species))

# Summary of Sepal Length
cat("\nSummary of Sepal Length:\n")
print(summary(iris$Sepal.Length))

# Scatter Plot
plot(iris$Sepal.Length, iris$Sepal.Width,
     col = as.numeric(iris$Species),
     pch = 19,
     main = "Sepal Length vs Width",
     xlab = "Sepal Length",
     ylab = "Sepal Width")

legend("topright",
       legend = levels(iris$Species),
       col = 1:3,
       pch = 19)

# Correlation
cat("\nCorrelation (Sepal Length vs Width):\n")
print(cor(iris$Sepal.Length, iris$Sepal.Width))

# ── Q4 [Unit 3] Star Patterns ────────────
cat("===== Q4: Star Patterns =====\n")

rows <- 5

# 1. Right Triangle
cat("\nPattern 1: Right Triangle\n")
for(i in 1:rows){
  cat(strrep("* ", i), "\n")
}

# 2. Inverted Triangle
cat("\nPattern 2: Inverted Triangle\n")
for(i in rows:1){
  cat(strrep("* ", i), "\n")
}

# 3. Pyramid
cat("\nPattern 3: Pyramid\n")
for(i in 1:rows){
  cat(strrep(" ", rows-i))
  cat(strrep("* ", i), "\n")
}

# 4. Diamond
cat("\nPattern 4: Diamond\n")
for(i in 1:rows){
  cat(strrep(" ", rows-i))
  cat(strrep("* ", i), "\n")
}
for(i in (rows-1):1){
  cat(strrep(" ", rows-i))
  cat(strrep("* ", i), "\n")
}

# 5. Number Triangle
cat("\nPattern 5: Number Triangle\n")
for(i in 1:rows){
  for(j in 1:i){
    cat(j, " ")
  }
  cat("\n")
}

# 6. Pascal's Triangle
cat("\nPattern 6: Pascal Triangle\n")

pascal <- function(n){
  row <- 1
  for(i in 1:n){
    cat(strrep(" ", n-i))
    cat(paste(row, collapse=" "), "\n")
    row <- c(0, row) + c(row, 0)
  }
}

pascal(rows)
