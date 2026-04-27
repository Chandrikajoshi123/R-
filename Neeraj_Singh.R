# ============================================================
#  BCA 4th Semester | R Programming Assignment
#  Student  : Neeraj Singh
#  Roll No  : BCA/4/SET4/05
#  Deadline : 10 April 2026
# ============================================================

# ── Q1 [Unit 1] Sequences, rep() & Vector Operations ────────
cat("===== Q1: Sequences and Vectors =====\n")

# Sequence with step 3
seq1 <- seq(from = 1, to = 50, by = 3)

#  FIX: sum() printed using %d (integer) but result can be numeric
#  Use %.0f or %.2f instead
cat(sprintf("Length: %d  |  Sum: %.0f  |  Mean: %.2f\n\n",
            length(seq1), sum(seq1), mean(seq1)))

# 10 equally spaced values 0–1
seq2 <- seq(0, 1, length.out = 10)
cat(round(seq2, 4), "\n")

# rep() patterns
cat("rep() Examples:\n")

#  No error, but output cluttered → better formatting
cat("rep(1:4, times=3): ", paste(rep(1:4, times = 3), collapse=" "), "\n")

cat("rep(1:4, each=2): ", paste(rep(1:4, each = 2), collapse=" "), "\n")

cat("rep(c(0,1), len=11): ",
    paste(rep(c(0,1), length.out = 11), collapse=" "), "\n\n")


# Vector arithmetic
v1 <- seq(2, 20, by = 2)
v2 <- seq(1, 19, by = 2)

cat("Sum of evens:", sum(v1), "| Sum of odds:", sum(v2), "\n")

#  FIX: cumsum() prints messy without paste
cat("Cumulative sum of evens:",
    paste(cumsum(v1), collapse=" "), "\n\n")




# ── Q2 [Unit 1] String Manipulation ─────────────────────────
cat("===== Q2: String Operations =====\n")

first_name <- "Neeraj"
last_name  <- "Singh"
roll_no    <- 5L
branch     <- "BCA"

student_id <- paste0(toupper(branch), "/SEM4/", sprintf("%03d", roll_no))
full_name  <- paste(first_name, last_name)

cat(sprintf("Full Name  : %s\n", full_name))

#  FIX: sprintf %03d expects numeric → roll_no must be numeric (already OK)
# but mention: using character here would break formatting
cat(sprintf("Student ID : %s\n", student_id))

#  FIX: strsplit may fail if string empty → safe extraction
chars <- strsplit(full_name, "")[[1]]

cat(sprintf("Reversed   : %s\n",
            paste(rev(chars), collapse = "")))
 FIX: If name has multiple spaces → strsplit safer with trim
words <- strsplit(trimws(full_name), "\\s+")[[1]]

cat(sprintf("Initials   : %s\n",
            paste(substr(words, 1, 1), collapse = ".")))

sentence <- "R programming is very very powerful and R is fun"

#  FIX: sub() replaces ONLY first occurrence (correct but mention)
cat(sprintf("Replace 1: %s\n", sub("very", "extremely", sentence)))

#  FIX: gsub replaces ALL occurrences (correct usage)
cat(sprintf("Replace all: %s\n\n",
            gsub("very", "extremely", sentence)))




# ── Q3 [Unit 2] airquality Dataset Deep Dive ────────────────
cat("===== Q3: Air Quality Analysis =====\n")

data(airquality)

#  IMPORTANT FIX:
# na.omit() removes MANY rows → may bias results
#  Better approach: use complete cases per column when needed
aq <- na.omit(airquality)

cat(sprintf("Rows after removing NAs: %d (was %d)\n\n",
            nrow(aq), nrow(airquality)))

for (col in c("Ozone", "Wind", "Temp")) {
  vals <- aq[[col]]

  #  FIX: sd() returns NA if length < 2 (safe guard)
  sd_val <- ifelse(length(vals) > 1, sd(vals), NA)

  cat(sprintf("%-6s | Mean=%.2f Med=%.2f SD=%.2f Min=%.1f Max=%.1f\n",
              col, mean(vals), median(vals), sd_val,
              min(vals), max(vals)))
}

#  FIX: cor() fails if NA present → safe use complete.obs
cat(sprintf("\nCorrelation(Ozone, Temp) : %.4f\n",
            cor(aq$Ozone, aq$Temp, use="complete.obs")))

cat(sprintf("Correlation(Ozone, Wind) : %.4f\n\n",
            cor(aq$Ozone, aq$Wind, use="complete.obs")))


# Plot
first30 <- head(aq, 30)

#  FIX: Day repeats across months → misleading X-axis
#  Better use index instead
plot(
  1:30, first30$Temp,
  type = "b",
  main = "Daily Temperature — First 30 Observations",
  xlab = "Observation Index",
  ylab = "Temperature (°F)"
)

abline(h = mean(first30$Temp), col = "red", lty = 2)


# ── Q4 [Unit 3] FizzBuzz ───────────────────────────────────
cat("===== Q4: FizzBuzz =====\n")

for (i in 1:30) {

  #  FIX: label initialized correctly
  label <- ""

  if (i %% 15 == 0) label <- "FizzBuzz"
  else if (i %% 3 == 0) label <- "Fizz"
  else if (i %% 5 == 0) label <- "Buzz"
  else label <- as.character(i)

  cat(sprintf("%8s", label))
}

cat("\n")

# Extended
perfect_squares <- (1:7)^2

for (i in 1:50) {

  parts <- character(0)

  if (i %% 3 == 0) parts <- c(parts, "Fizz")
  if (i %% 5 == 0) parts <- c(parts, "Buzz")
  if (i %% 7 == 0) parts <- c(parts, "Woof")

  #  FIX: %in% is correct but inefficient for large data
  #  acceptable here since range small
  if (i %in% perfect_squares) parts <- c(parts, "SQ")

  label <- if (length(parts) > 0)
    paste(parts, collapse="") else as.character(i)

  cat(sprintf("%10s", label))
}
