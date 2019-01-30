# Data wrangling for fish condition analysis

library(tidyverse)
library(hakaiApi)
library(devtools)

# This is how download data from the Hakai Data Portal

client <- hakaiApi::Client$new() # Follow stdout prompts to get an API token
# Make a data request for chlorophyll data

endpoint <- sprintf("%s/%s", client$api_root, "eims/views/output/chlorophyll?limit=-1")

chla <- client$get(endpoint)

write_csv(chla, here("read_data", "chla.csv"))


fish_endpoint <- sprintf("%s/%s", client$api_root,
                         'eims/views/output/jsp_fish?work_area%26%26{"QUADRA"}&limit=-1')

fish <- client$get(fish_endpoint)

write_csv(fish, here::here("read_data", "fish.csv"))
