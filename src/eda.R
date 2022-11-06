library('ProjectTemplate')
library("dplyr")
load.project()

# Exploring total runs
#~Enrollments in total
enrolments_count_df <- enrolments_df %>% summarise(n=n())
#demographics (total of runs)
#~from what countries (detected) have we have received enrollments (apart from the UK)? detected_country 
enrolments_count_per_country_df <- enrolments_df %>% group_by(detected_country) %>% summarise(n=n()) %>% arrange(desc(n))
print(enrolments_count_per_country_df, n=100)



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