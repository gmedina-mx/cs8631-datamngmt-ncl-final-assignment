# 01 -> Mergining and Standarize Data
# 01 - A -> Enrollments RAW merge

library(stringr)
library(dplyr)
library(snakecase)

# Grab all the enrollments data sets
dataset_names <- get_enrolments_dataset_names()

# Create a union of all enrollments, adding a custom column with the run number
df <- data.frame()
i<-1
for(name in dataset_names) {
  run_df <- get(name,globalenv())
  run_df <- run_df %>% 
    add_column(run_num = i) %>% 
    mutate(employment_area = to_title_case(employment_area)) %>% 
    mutate(highest_education_level = to_title_case(highest_education_level)) %>% 
    mutate(employment_status = to_title_case(employment_status))
  df <- bind_rows(df, run_df)
  i <- i+1
}
enrolments_df <- df
cache("enrolments_df")

#
