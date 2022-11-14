# 01 -> Mergining and Standarize Data
# 01 - C -> Leaving Survey Responses

dataset_names <- get_leaving_survey_dataset_names()

# Create a union of all Leaving Survey Responses, adding a custom column with the run number
df <- data.frame()
i<-4
dataset_names <- dataset_names[i:NUMBER_OF_RUNS]
for(name in dataset_names) {
  run_df <- get(name,globalenv())
  run_df <- run_df %>% 
    add_column(run_num = i)
  df <- bind_rows(df, run_df)
  i <- i+1
}
leaving_survey_df <- df
cache("leaving_survey_df")
