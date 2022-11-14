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

library(dplyr)
library(ggplot2)
library(forcats)

#' Get a table that retrieves all the enrollments per country count
get_enrolments_count_per_country_df <- function(enrolments_df){
  #demographics (total of runs)
  #~from what countries (detected) have we have received enrollments (apart from the UK)? detected_country 
  enrolments_count_per_country_df <- enrolments_df %>% group_by(enrolments_df$detected_country) %>% dplyr::summarise(n=n()) %>% arrange(desc(n))
  enrolments_count_per_country_df <- enrolments_count_per_country_df %>% left_join(countries, by = c("enrolments_df$detected_country" = "alpha.2")) %>% select("n", "name")  %>% tidyr::replace_na(list(name="Undetected"))
  
  enrolments_count_per_country_df
}

#' Get that contains all the count of enrollments per run
get_enrolments_count_per_run <- function(enrolments_df){
  # Exploring total runs
  #~Enrollments in total
  enrolments_count_per_run_df <- enrolments_df %>% group_by(run_num) %>% dplyr::summarise(n=n()) %>% arrange(desc(n))
  enrolments_count_per_run_df
}

get_enrolments_count_per_age <- function(enrolments_df){
  enrolments_count_per_age_df <- enrolments_df %>% filter(age_range != "Unknown") %>% group_by(age_range) %>% dplyr::summarise(n=n()) %>% arrange(desc(n)) 
  enrolments_count_per_age_df
}

get_enrolments_count_per_edlvl <- function(enrolments_df){
  enrolments_count_per_edlvl <- enrolments_df %>% filter(highest_education_level != "Unknown") %>% group_by(highest_education_level) %>% dplyr::summarise(n=n()) %>% arrange(desc(n))
  enrolments_count_per_edlvl
}

get_enrolments_count_per_employment_status <- function(enrolments_df){
  enrolments_count_per_employment_status <- enrolments_df %>% filter(employment_status != "Unknown") %>% group_by(employment_status) %>% dplyr::summarise(n=n()) %>% arrange(desc(n))
  enrolments_count_per_employment_status
}

get_enrolments_count_per_employment_area <- function(enrolments_df){
  enrolments_count_per_employment_area <- enrolments_df %>% filter(employment_area != "Unknown") %>% group_by(employment_area) %>% dplyr::summarise(n=n()) %>% arrange(desc(n))
  enrolments_count_per_employment_area
}

get_archetypes_count_from_survey_responses <- function(archetype_survey_df){
  archettpes_count_from_survey_responses <- archetype_survey_df %>% filter(archetype != "Unknown") %>% group_by(archetype) %>% dplyr::summarise(n=n()) %>% arrange(desc(n))
  archettpes_count_from_survey_responses  
}

get_leaving_reasons_count <- function(leaving_survey_df){
  leaving_reasons_count <- leaving_survey_df %>% group_by(leaving_reason) %>% dplyr::summarise(n=n()) %>% arrange(desc(n))
  leaving_reasons_count
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

get_plot_enrolments_count_per_age <- function(enrolments_df) {
  plot_df <- get_enrolments_count_per_age(enrolments_df)
  plottable <- ggplot(data = plot_df, aes(x=fct_rev(factor(age_range, level=plot_df$age_range)), y=n)) + 
    geom_bar(stat="identity", fill="pink") + 
    geom_text(aes(label=n), hjust=-0.25, color="black", size=3) + 
    theme_minimal() + 
    coord_flip() + 
    scale_y_continuous(expand = c(0.2, 0)) +
    theme(axis.title.x = element_blank(), axis.title.y = element_blank())
  plottable
}

get_plot_enrolments_count_per_edlvl <- function(enrolments_df) {
  plot_df <- get_enrolments_count_per_edlvl(enrolments_df)
  plottable <- ggplot(data = plot_df, aes(x=fct_rev(factor(highest_education_level, level=plot_df$highest_education_level)), y=n)) + 
    geom_bar(stat="identity", fill="purple") + 
    geom_text(aes(label=n), hjust=-0.25, color="black", size=3) + 
    theme_minimal() + 
    coord_flip() + 
    scale_y_continuous(expand = c(0.2, 0)) +
    theme(axis.title.x = element_blank(), axis.title.y = element_blank())
  plottable
}

get_plot_enrolments_count_per_employment_status <- function(enrolments_df) {
  plot_df <- get_enrolments_count_per_employment_status(enrolments_df)
  plottable <- ggplot(data = plot_df, aes(x=fct_rev(factor(employment_status, level=plot_df$employment_status)), y=n)) + 
    geom_bar(stat="identity", fill="lightblue") + 
    geom_text(aes(label=n), hjust=-0.25, color="black", size=3) + 
    theme_minimal() + 
    coord_flip() + 
    scale_y_continuous(expand = c(0.2, 0)) +
    theme(axis.title.x = element_blank(), axis.title.y = element_blank())
  plottable
}

get_plot_enrolments_count_per_employment_area <- function(enrolments_df) {
  plot_df <- get_enrolments_count_per_employment_area(enrolments_df)
  plottable <- ggplot(data = plot_df, aes(x=fct_rev(factor(employment_area, level=plot_df$employment_area)), y=n)) + 
    geom_bar(stat="identity", fill="lightslateblue") + 
    geom_text(aes(label=n), hjust=-0.25, color="black", size=3) + 
    theme_minimal() + 
    coord_flip() + 
    scale_y_continuous(expand = c(0.2, 0)) +
    theme(axis.title.x = element_blank(), axis.title.y = element_blank())
  plottable
}

get_plot_archetypes_count_from_survey_responses <- function(archetype_survey_df){
  plot_df <- get_archetypes_count_from_survey_responses(archetype_survey_df)
  plottable <- ggplot(data = plot_df, aes(x=fct_rev(factor(archetype, level=archetype)), y=n)) + 
    geom_bar(stat="identity", fill="coral") + 
    geom_text(aes(label=n), hjust=-0.25, color="black", size=3) + 
    theme_minimal() + 
    coord_flip() + 
    scale_y_continuous(expand = c(0.2, 0)) +
    theme(axis.title.x = element_blank(), axis.title.y = element_blank())
  plottable
}

get_plot_leaving_reasons_count <- function(leaving_survey_df){
  plot_df <- get_leaving_reasons_count(leaving_survey_df)
  plottable <- ggplot(data = plot_df, aes(x=fct_rev(factor(leaving_reason, level=leaving_reason)), y=n)) + 
    geom_bar(stat="identity", fill="chocolate") + 
    geom_text(aes(label=n), hjust=-0.25, color="black", size=3) + 
    theme_minimal() + 
    coord_flip() + 
    scale_y_continuous(expand = c(0.2, 0)) +
    theme(axis.title.x = element_blank(), axis.title.y = element_blank())
  plottable
}
