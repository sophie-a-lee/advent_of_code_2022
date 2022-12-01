#### Advent of code day 1 ####

pacman::p_load(tidyverse, data.table)

## Load data 
test <- fread("data/day1_test.csv") %>% 
  mutate(group = cumsum(is.na(V1)) + !is.na(V1)) %>% 
  group_by(group) %>% 
  summarise(total_cals = sum(V1, na.rm = T)) %>% 
  ungroup( ) %>% 
  filter(total_cals == max(total_cals))


calories <- fread("data/day1.csv") 

total_calories <- calories %>% 
  mutate(group = cumsum(is.na(V1)) + !is.na(V1)) %>% 
  group_by(group) %>% 
  summarise(total_cals = sum(V1, na.rm = T)) %>% 
  ungroup( ) 

filter(total_calories, total_cals == max(total_cals)) 


sum(head(sort(total_calories$total_cals, decreasing = T), 3))
