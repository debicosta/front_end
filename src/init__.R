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
source("./config.R")
source("./run_shiny.R")
# install necessary packages --- it would be better to create a function
library(shiny)
library(httr)
library(dplyr)
library(jsonlite)


# running the front-end ---
attach(get_api_parameters())
run_shiny_front(external_ip, port)
