#'
#' eda.R Exploratory Data Analysis code
#'
#' This file contains all the necessary functions to create an EDA report
#' It contains functions that load dataframes and plottable objects ready to
#' be used for R-Markdown
#' 
#' In case a new analysis, table or graph needs to be done, this is the best 
#' place to include that function.
#' 

library(ProjectTemplate)
library(dplyr)
library(ggplot2)
library(forcats)
load.project()

#' Get a table that retrieves all the enrollments per country count
get_enrolments_count_per_country_df <- function(enrolments_df){
  #demographics (total of runs)
  #~from what countries (detected) have we have received enrollments (apart from the UK)? detected_country 
  enrolments_count_per_country_df <- enrolments_df %>% group_by(enrolments_df$detected_country) %>% summarise(n=n()) %>% arrange(desc(n))
  enrolments_count_per_country_df <- enrolments_count_per_country_df %>% left_join(countries, by = c("enrolments_df$detected_country" = "alpha.2")) %>% select("n", "name")  %>% tidyr::replace_na(list(name="Undetected"))
  
  enrolments_count_per_country_df
}

#' Get that contains all the count of enrollments per run
get_enrolments_count_per_run <- function(enrolments_df){
  # Exploring total runs
  #~Enrollments in total
  enrolments_count_per_run_df <- enrolments_df %>% group_by(run_num) %>% summarise(n=n()) %>% arrange(desc(n))
  enrolments_count_per_run_df
}

#' Get a plotable object contains a histogram that summarizes counts by country
get_plot_enrolements_count_per_country <- function(enrolments_df){
  plot_df <- head ( get_enrolments_count_per_country_df(enrolments_df), 10)
  # plot_df
  plottable <- ggplot(data = plot_df, aes(x=fct_rev(factor(name, level=plot_df$name)), y=n)) + 
    geom_bar(stat="identity", fill="steelblue") + 
    geom_text(aes(label=n), hjust=-0.25, color="black", size=3) + 
    theme_minimal() + 
    coord_flip() + 
    scale_y_continuous(expand = c(0.2, 0)) +
    theme(axis.title.x = element_blank(), axis.title.y = element_blank())
  plottable
}

get_plot_enrolments_count_per_run <- function(enrolments_df){
  df <- get_enrolments_count_per_run(enrolments_df)
  plottable <- ggplot(data=df, aes(x=run_num, y=n, group=1)) +
    geom_line() +
    geom_point() +
    xlab("Run Number") +
    ylab("Enrolments")
  plottable
}

get_total_enrollments <- function(enrolments_df) {
  enrolments_count_df <- enrolments_df %>% summarise(n=n())
  enrolments_count_df
}

get_plot_enrolments_run <- function() {
  enrolments_count_df <- enrolments_df %>% summarise(n=n())
}

#~enrollments per run
enrolments_count_per_run_df <- enrolments_df %>% group_by(run_num) %>% summarise(n=n()) %>% arrange(desc(n))
enrolments_count_per_run_df

#demographics (total of runs)
#~from what countries (detected) have we have received enrollments (apart from the UK)? detected_country 
enrolments_count_per_country_df <- enrolments_df %>% group_by(detected_country) %>% summarise(n=n()) %>% arrange(desc(n))
print(enrolments_count_per_country_df, n=100)

enrolments_count_per_run_and_country_df <- enrolments_df %>% group_by(run_num,detected_country) %>% summarise(n=n()) %>% arrange(desc(n))
print(enrolments_count_per_run_and_country_df, n=100)

enrolments_df
#  ~how many people have provided their details?
#  ~gender, country, age-range

