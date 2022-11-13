NUMBER_OF_RUNS <- 7

ARCHETYPE_SURVERY_RESPONSES_DATA_SET_BASE_STR <- "cyber.security.${i}_archetype.survey.responses"
ENROLEMENTS_DATA_SET_BASE_STR <- "cyber.security.${i}_enrolments"
LEAVING_SURVEY_DATA_SET_BASE_STR <- "cyber.security.${i}_leaving.survey.responses"
QUESTION_RESPONSE_DATA_SET_BASE_STR <- "cyber.security.${i}_question.response"
STEP_ACTIVITY_DATA_SET_BASE_STR <- "cyber.security.${i}_step.activity"
WEEKLY_SENTIMENT_SURVEY_DATA_SET_BASE_STR <-"cyber.security.${i}_weekly.sentiment.survey.responses"

DATASETS_TEMPLATE_NAMES <- list(ARCHETYPE_SURVERY_RESPONSES_DATA_SET_BASE_STR,
                                 ENROLEMENTS_DATA_SET_BASE_STR,
                                 LEAVING_SURVEY_DATA_SET_BASE_STR,
                                 QUESTION_RESPONSE_DATA_SET_BASE_STR,
                                 STEP_ACTIVITY_DATA_SET_BASE_STR,
                                 WEEKLY_SENTIMENT_SURVEY_DATA_SET_BASE_STR)



get_run_dataset_names <- function(run_number, datasets_template_names = DATASETS_TEMPLATE_NAMES) {
  i <- run_number
  dataset_names<-list()
  for(template_name in datasets_template_names) {
    # str_interp requires a variable i defined in scope
    dataset_name <- str_interp(template_name)
    dataset_names <- append(dataset_names, dataset_name)
  }
  dataset_names
}

#' Gets all the data names present in this project used in R environment
#' @param number_of_runs Number of runs
get_all_dataset_names <- function(number_of_runs = NUMBER_OF_RUNS, datasets_template_names = DATASETS_TEMPLATE_NAMES) {
  dataset_names<-list()
  for(i in 1:NUMBER_OF_RUNS) {
    current_run_names <- get_run_dataset_names(i, datasets_template_names)
    dataset_names <- append(dataset_names, current_run_names)
  }
  dataset_names
}



#' Gets all the data names of the enrolments dataset used in R environment
#' @param number_of_runs Number of runs
get_enrolments_dataset_names <- function(number_of_runs = NUMBER_OF_RUNS) {
  get_all_dataset_names(number_of_runs, list(ENROLEMENTS_DATA_SET_BASE_STR))
}

#' Gets all the data names of the enrolments dataset used in R environment
#' @param number_of_runs Number of runs
get_enrolments_dataset_names_v1 <- function(number_of_runs = NUMBER_OF_RUNS) {
  dataset_names<-list()
  for(i in 1:NUMBER_OF_RUNS) {
    dataset_name <- str_interp(ENROLEMENTS_DATA_SET_BASE_STR)
    dataset_names <- append(dataset_names, dataset_name)
  }
  dataset_names
}
