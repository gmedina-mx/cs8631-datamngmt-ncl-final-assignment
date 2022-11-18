# CS8631 Data Management and Exploratory Data Analysis, Final Assignment

## cs8631-datamngmt-ncl-final-assignment

## About The Project

This is a personal repository for cs8631 module assignment.

This project uses ProjectTemplate as an opinionated tool for organizing R source code and to generate a final report.

To load your this project, you'll first need to `setwd()` into the directory
where this README file is located. Then you need to run the following two
lines of R code:

	library('ProjectTemplate')
	load.project()

After you enter the second line of code, you'll see a series of automated
messages as ProjectTemplate goes about doing its work. This process involves:
* Reading in the global configuration file contained in `config`.
* Loading any R packages you listed in the configuration file.
* Reading in any datasets stored in `data` or `cache`.
* Preprocessing your data using the files in the `munge` directory.

Once that's done, you can execute any code you'd like. For every analysis
you create, we'd recommend putting a separate file in the `src` directory.
If the files start with the two lines mentioned above:

	library('ProjectTemplate')
	load.project()

You'll have access to all of your data, already fully preprocessed, and
all of the libraries you want to use.

## Considerations

In case project is not building:
-    Make sure ProjectTemplate and the following libraries: bookdown, reshape2, plyr, tidyverse, stringr, lubridate, snakecase.
-    A LaTex distribution is installed.
-    R distribution is installed.

## Git Log

You can find a git log of this project in the following URL: https://github.com/gmedina-mx/cs8631-datamngmt-ncl-final-assignment/commits/master
