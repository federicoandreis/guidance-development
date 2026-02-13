# Generate synthetic data for all examples
# This script creates CSV files that can be loaded by both R and Python
# Run this script once to generate all example datasets

set.seed(42)

# Create data directory if it doesn't exist
if (!dir.exists("examples/data")) {
  dir.create("examples/data", recursive = TRUE)
}

# ==============================================================================
# Example 1: GP Access Analysis
# ==============================================================================

n_practices <- 6500

gp_data_raw <- data.frame(
  practice_code = paste0(sample(LETTERS, n_practices, replace = TRUE),
                        sample(LETTERS, n_practices, replace = TRUE),
                        sample(LETTERS, n_practices, replace = TRUE),
                        sample(1:9, n_practices, replace = TRUE),
                        sample(0:9, n_practices, replace = TRUE),
                        sample(0:9, n_practices, replace = TRUE),
                        sample(0:9, n_practices, replace = TRUE)),
  practice_name = paste("Practice", 1:n_practices),
  icb_code = sample(paste0("Q", sample(10:99, 20)), n_practices, replace = TRUE),
  icb_name = sample(paste("NHS", c("Devon", "Cornwall", "Somerset", "Dorset"), "ICB"), 
                   n_practices, replace = TRUE),
  region = sample(c("South West", "South East", "London", "Midlands", "North East", 
                   "North West", "East"), n_practices, replace = TRUE),
  list_size = round(rnorm(n_practices, 8000, 4000)),
  survey_responses = round(rnorm(n_practices, 200, 100)),
  imd_quintile = sample(1:5, n_practices, replace = TRUE),
  rural_urban = sample(c("Urban", "Rural"), n_practices, replace = TRUE, prob = c(0.7, 0.3))
)

# Ensure positive values
gp_data_raw$list_size <- pmax(500, pmin(25000, gp_data_raw$list_size))
gp_data_raw$survey_responses <- pmax(30, pmin(800, gp_data_raw$survey_responses))

# Generate phone difficulty responses (with deprivation gradient)
base_rate <- 0.35
deprivation_effect <- (gp_data_raw$imd_quintile - 3) * -0.02
gp_data_raw$phone_difficult_n <- rbinom(n_practices, 
                                        gp_data_raw$survey_responses,
                                        pmax(0.1, pmin(0.6, base_rate + deprivation_effect + rnorm(n_practices, 0, 0.08))))

# Add ~5% missing data
missing_idx <- sample(1:n_practices, round(n_practices * 0.05))
gp_data_raw$phone_difficult_n[missing_idx] <- NA

# Save to CSV
write.csv(gp_data_raw, "examples/data/gp_access_data.csv", row.names = FALSE, na = "")

cat("✓ Generated: examples/data/gp_access_data.csv\n")

# ==============================================================================
# Example 2: Care Home Falls
# ==============================================================================

# Baseline period (months 1-12): mean ~17.5, with special cause at month 8
baseline_falls <- rpois(12, lambda = 17.5)
baseline_falls[8] <- 26  # Special cause: flu outbreak

# Post-intervention (months 13-24): mean ~13 (25% reduction)
post_falls <- rpois(12, lambda = 13)

falls_data <- data.frame(
  month = 1:24,
  date = seq(as.Date("2023-01-01"), by = "month", length.out = 24),
  falls_count = c(baseline_falls, post_falls),
  phase = c(rep("Baseline", 12), rep("Post-intervention", 12))
)

write.csv(falls_data, "examples/data/falls_data.csv", row.names = FALSE)

cat("✓ Generated: examples/data/falls_data.csv\n")

# ==============================================================================
# Example 3: Mental Health Wait Times
# ==============================================================================

n_services <- 150

# Generate log-normal wait times (creates right skew)
log_mean <- log(75)
log_sd <- 0.4

mh_data <- data.frame(
  service_code = sprintf("MHS%03d", 1:n_services),
  service_name = paste("Mental Health Service", 1:n_services),
  trust_name = sample(paste("NHS Trust", LETTERS[1:20]), n_services, replace = TRUE),
  region = sample(c("South West", "South East", "London", "Midlands", 
                   "North East", "North West", "East"), n_services, replace = TRUE),
  survey_responses = round(rnorm(n_services, 150, 50)),
  deprivation_score = runif(n_services, 10, 40)
)

# Ensure positive survey responses
mh_data$survey_responses <- pmax(50, pmin(300, mh_data$survey_responses))

# Generate wait times with log-normal distribution
deprivation_effect <- (mh_data$deprivation_score - 25) * 0.01
mh_data$wait_time_days <- round(rlnorm(n_services, 
                                       meanlog = log_mean + deprivation_effect, 
                                       sdlog = log_sd))

# Ensure reasonable bounds
mh_data$wait_time_days <- pmax(30, pmin(250, mh_data$wait_time_days))

write.csv(mh_data, "examples/data/mental_health_wait_times.csv", row.names = FALSE)

cat("✓ Generated: examples/data/mental_health_wait_times.csv\n")

# ==============================================================================
# Example 4: Medication Safety Pilot
# ==============================================================================

n_homes <- 15

med_data <- data.frame(
  home_id = sprintf("CH%02d", 1:n_homes),
  home_name = paste("Care Home", LETTERS[1:n_homes]),
  beds = round(runif(n_homes, 20, 80))
)

# Baseline incidents
med_data$incidents_before <- round(med_data$beds * runif(n_homes, 0.08, 0.15), 1)

# Post-intervention: most homes show 20-30% reduction
reduction_pct <- runif(n_homes, 0.20, 0.35)
reduction_pct[3] <- 0.65  # Outlier: 65% reduction

med_data$incidents_after <- round(med_data$incidents_before * (1 - reduction_pct), 1)

# Calculate difference
med_data$difference <- med_data$incidents_after - med_data$incidents_before

write.csv(med_data, "examples/data/medication_safety_data.csv", row.names = FALSE)

cat("✓ Generated: examples/data/medication_safety_data.csv\n")

# ==============================================================================
# Example 5: Regional A&E Performance
# ==============================================================================

n_trusts_per_ics <- 100

# North Region ICS
north_data <- data.frame(
  trust_code = sprintf("RN%03d", 1:n_trusts_per_ics),
  trust_name = paste("North Trust", 1:n_trusts_per_ics),
  ics = "North",
  monthly_attendances = round(rnorm(n_trusts_per_ics, 12000, 5000)),
  deprivation_score = runif(n_trusts_per_ics, 15, 35),
  beds = round(rnorm(n_trusts_per_ics, 500, 200))
)

# South Region ICS
south_data <- data.frame(
  trust_code = sprintf("RS%03d", 1:n_trusts_per_ics),
  trust_name = paste("South Trust", 1:n_trusts_per_ics),
  ics = "South",
  monthly_attendances = round(rnorm(n_trusts_per_ics, 12000, 5000)),
  deprivation_score = runif(n_trusts_per_ics, 15, 35),
  beds = round(rnorm(n_trusts_per_ics, 500, 200))
)

# Combine
ae_data <- rbind(north_data, south_data)

# Ensure positive values
ae_data$monthly_attendances <- pmax(5000, pmin(25000, ae_data$monthly_attendances))
ae_data$beds <- pmax(200, pmin(1000, ae_data$beds))

# Generate A&E performance
base_performance <- ifelse(ae_data$ics == "North", 75, 72)
deprivation_effect <- (ae_data$deprivation_score - 25) * -0.15
ae_data$ae_performance <- base_performance + deprivation_effect + rnorm(nrow(ae_data), 0, 4)

# Ensure reasonable bounds
ae_data$ae_performance <- pmax(60, pmin(85, ae_data$ae_performance))

write.csv(ae_data, "examples/data/ae_performance_data.csv", row.names = FALSE)

cat("✓ Generated: examples/data/ae_performance_data.csv\n")

cat("\n✅ All example datasets generated successfully!\n")
