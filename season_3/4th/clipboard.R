#24-0731 wedn

#
install.packages("clipr")
library(clipr)
library(tidyverse)
?msleep

msleep |> 
  colnames() |> 
  tibble()

# #
# 1 name              
# 2 genus             
# 3 vore              
# 4 order             
# 5 conservation      
# 6 sleep_total       
# 7 sleep_rem         
# 8 sleep_cycle       
# 9 awake             
# 10 brainwt           
# 11 bodywt 
# 
# #
# 1 이름              
# 2 속             
# 3 보어              
# 4 순서             
# 5 보존      
# 6 sleep_total       
# 7 sleep_rem         
# 8 sleep_cycle       
# 9 깨어 있음             
# 10 brainwt           
# 11 bodywt 

(read_table(pipe("pbpaste"), col_names = F) -> temp_1clip)
(read_table(pipe("pbpaste"), col_names = F) -> temp_2clip)
temp_1clip |> 
  rename(num = 1, colname = 2) |> 
  select(-3)


temp_2clip |> 
  left_join(temp_1clip, by = "X1") |> 
  select(1,2,4)

