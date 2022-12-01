#### Advent of code 2022 day 1 ####

## Load packages
pacman::p_load(tidyverse, data.table)


## Load test data 
test <- fread("data/day1_test.csv") %>% 
  # Create grouping variable (same until NA)
  mutate(group = cumsum(is.na(V1)) + !is.na(V1)) %>% 
  group_by(group) %>% 
  # Total calories per group
  summarise(total_cals = sum(V1, na.rm = T)) %>% 
  ungroup( ) %>% 
  # Return the highest group total
  filter(total_cals == max(total_cals))


## Load data
calories <- fread("data/day1.csv") 

## Return total number of calories per group
total_calories <- calories %>% 
  mutate(group = cumsum(is.na(V1)) + !is.na(V1)) %>% 
  group_by(group) %>% 
  summarise(total_cals = sum(V1, na.rm = T)) %>% 
  ungroup( ) 

## Return group with the highest number of calories
filter(total_calories, total_cals == max(total_cals)) 

## Return the total of the top 3 groups
sum(head(sort(total_calories$total_cals, decreasing = T), 3))
