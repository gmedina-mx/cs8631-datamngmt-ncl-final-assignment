#' Data understanding
#' This source file includes functions that print-output needed for the
#' data description report

display_count_all_datasets <- function(){
  all_datasets_names <- get_all_dataset_names()
  for(name in all_datasets_names) {
    cur_df <- get(name,globalenv())
    
    print(paste("Dataset dimensions: ", name))
    print(dim(cur_df))
  }
}

display_glimpse_last_run <- function(){
  all_run_7_datasets_names <- get_run_dataset_names(7)
  for(name in all_run_7_datasets_names) {
    cur_df <- get(name,globalenv())
    
    print(paste("Dataset: ", name))
    print(glimpse(cur_df, width=80), n=3)
  }
}

display_description_report <- function (){
  
  print("Counting the rows and colums of all datasets:")
  display_count_all_datasets()
  
  print("Showing some rows and data description of the 7th run:")
  display_glimpse_last_run()
  
}


