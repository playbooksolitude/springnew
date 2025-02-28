#25-0226 


#0 library ----
library(tidyverse)
library(readxl)
library(showtext)
showtext_auto()



#1 read ----
(read_csv("./season_3/3rd/airport_2402_arr.csv") -> ap_1arr_csv)
(read_excel("./season_3/3rd/airpot_24_02_dep.xlsx") -> ap_1dep_xls)

#
ap_1arr_csv
ap_1dep_xls

#
ap_1arr_csv |> 
  #rename(출도착구분 = 1)
  mutate(출도착구분 = `출/도착구분`, .keep = 'unused') -> ap_2arr_rename

#
ap_1dep_xls |> 
  #rename(출도착구분 = 1)
  mutate(출도착구분 = `출/도착구분`, .keep = 'unused') -> ap_2dep_rename

#
ap_2arr_rename |> colnames() |> as_tibble() |> as_vector()
ap_2dep_rename |> colnames() |> as_tibble() |> as_vector()

#
(ap_2arr_rename |> colnames() |> as_tibble() -> ap_2arr_1vector)
(ap_2dep_rename |> colnames() |> as_tibble() -> ap_2dep_1vector)

#
intersect(ap_2arr_1vector$value, ap_2dep_1vector$value)
setdiff(ap_2arr_1vector$value, ap_2dep_1vector$value)

#
ap_2arr_rename |> 
  rename(실제시간 = 10) -> ap_3arr_rename

ap_2dep_rename |> 
  rename(실제시간 = 10) -> ap_3dep_rename

#
ap_3arr_rename |> colnames() |> as_tibble() -> ap_3arr_rename_q
ap_3dep_rename |> colnames() |> as_tibble() -> ap_3dep_rename_q

#
setdiff(ap_3arr_rename_q, ap_3dep_rename_q)
intersect(ap_3arr_rename_q, ap_3dep_rename_q)

#
(ap_3dep_rename |> 
  mutate(날짜 = ymd(날짜)) -> ap_4dep)

ap_4dep |> slice(1,n())


(ap_3arr_rename |> 
  mutate(날짜 = ymd(날짜)) -> ap_4arr)

ap_4arr |> slice(1,n())

# ap_4dep |> 
#   full_join(ap_4arr) -> ap_tidy1

#
ap_tidy1 |> slice(1,n())
ap_tidy1 |> glimpse()
ap_tidy1 |> str()

#
ap_3arr_rename |> 
  separate(col = '계획시간', into = c('계획', '시간'), sep = ":") -> temp1

temp1 |> 
  mutate(시간분 = as.numeric(계획) * 60 + as.numeric(시간), .keep = 'used') |> 
  print(n = 200)








