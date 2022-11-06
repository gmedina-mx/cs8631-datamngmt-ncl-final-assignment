NUMBER_OF_RUNS <- 7
ENROLEMENTS_DATA_SET_BASE_STR <- "cyber.security.${i}_enrolments"

helper.function <- function()
{
  return(1)
}

get_enrolments_dataset_names <- function(number_of_runs = NUMBER_OF_RUNS) {
  dataset_names<-list()
  for(i in 1:NUMBER_OF_RUNS) {
    dataset_name <- str_interp(ENROLEMENTS_DATA_SET_BASE_STR)
    dataset_names <- append(dataset_names, dataset_name)
  }
  dataset_names
}
