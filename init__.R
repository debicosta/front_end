###################################################################################################
# Author: xx
# Project: xx
# File: init__.R
# Description: project initialisation
###################################################################################################
# Input: config.R
# Output: front end running logic
###################################################################################################

# sourcing necessary files ----
source("src/config.R")
source("src/run_shiny.R")
# install necessary packages --- it would be better to create a function
library(shiny)
library(httr)
library(dplyr)
library(jsonlite)

# running the front-end ---
run_shiny_front(external_ip, port)
