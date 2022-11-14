# 01 -> Mergining and Standarize Data
# 01 - B -> Archetype Survey Response RAW merge

library(stringr)
library(dplyr)
library(snakecase)

# Grab all the Archetype Survey data sets
dataset_names <- get_archetype_survey_dataset_names()

# Create a union of all Archetype Survey, adding a custom column with the run number
df <- data.frame()
i<-3 # Starting point is set as 3, as previous data do not contain records
dataset_names <- dataset_names[i:NUMBER_OF_RUNS]
for(name in dataset_names) {
  run_df <- get(name,globalenv())
  run_df <- run_df %>% 
    add_column(run_num = i) 
  df <- bind_rows(df, run_df)
  i <- i+1
}
archetype_survey_df <- df
cache("archetype_survey_df")
