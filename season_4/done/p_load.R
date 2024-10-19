#24-1018

if(!require(pacman))install.packages("pacman")
pacman::p_load(
  "tidyverse", 
  "googlesheets4", 
  "scales",
  "gt", 
  "showtext", 
  "nord", 
  "wesanderson",
  "patchwork",
  "ggrepel", 
  "GGally",
  "devtools",
  "googlesheets4", 
  "plotly"
)
showtext_auto()

# if(!require('devtools'))install.packages("devtools")
# devtools::install_github('bbc/bbplot')
