#'
#' 1.R Common Test Suite
#'
#' This file contains all the test cases for this project
#' TODO: Improve code coverage and implement test cases for the rest of the helper functions
#' 

context("Unit Testing")

expect_equal(dim(countries)[1], 249, info="Test: Check that the number of records from Countries Dataset is correct")
expect_equal(dim(countries)[2], 11, info="Test:  Check that the number of columns from Countries Dataset is correct")
expect_equal(length(get_all_dataset_names()), 42, info="Test: Check that the all 42 datasets names are retrieved from helper function")
