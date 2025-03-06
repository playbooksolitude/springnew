#25-0226 


#0 library ----
library(tidyverse)
library(readxl)
library(showtext)
showtext_auto()



#1 read ----
(read_csv("./season_5/airport_2402_arr.csv") -> ap_1arr_csv)
(read_csv("./season_5/airpot_24_02_dep2.csv") -> ap_1dep_csv)


# str ---
ap_1arr_csv |> str()
ap_1dep_csv |> str()

#
ap_1arr_csv
ap_1dep_csv


#
#(read_excel("./season_3/3rd/airpot_24_02_dep.xlsx") -> ap_1dep_xls)
# ap_1dep_xls |> str()
# ap_1dep_xls |> 
#   write_csv("./season_5/airpot_24_02_dep2.csv")
# read_csv("./season_5/airpot_24_02_dep2.csv")

#
ap_1arr_csv |> str()
ap_1arr_csv
ap_1dep_xls |> glimpse()

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

# 교집합, 차집합
intersect(ap_2arr_1vector$value, ap_2dep_1vector$value)
setdiff(ap_2arr_1vector$value, ap_2dep_1vector$value)

#
ap_2arr_rename |> glimpse()
(ap_2arr_rename |> 
  rename(실제시간 = 10) -> ap_3arr_rename)

(ap_2dep_rename |> 
  rename(실제시간 = 10) -> ap_3dep_rename)

#
(ap_3arr_rename |> colnames() |> as_tibble() -> ap_3arr_rename_q)
(ap_3dep_rename |> colnames() |> as_tibble() -> ap_3dep_rename_q)

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
ap_4arr |> glimpse()

# 계획시간 변형 ----
(ap_4arr |> 
  select(날짜, 항공사, 편명, 출발공항명, 도착공항명, 계획시간, 실제시간, 구분) |> 
  mutate(실제시간edit = paste0(실제시간, ":00")) |> 
  separate(col = 실제시간edit, into = c('시', '분', '초'), sep = ":") |> 
  mutate(시 = as.integer(시), 
         #분2 = as.integer(분), .keep = 'used') |> #sample_n(50) |> print(n =50)
          분 = as.integer(분), .keep = 'all', 
         실제시간 = 시* 60 + 분) -> ap_5arr)
          
ap_5arr$실제시간 <- as.POSIXct(ap_5arr$실제시간 * 60, origin = '2024-02-01', tz = 'UTC')

#library(hms)
# (ap_5arr |>
#   mutate(실제시간 = as_hms(실제시간 - trunc(실제시간, "days"))) -> ap_6arr)

(ap_5arr |> 
    mutate(실제시간 = hms(as.numeric(실제시간 - trunc(실제시간, "days")))) -> ap_6arr)


(ap_6arr |> 
  select(-c(초, 시, 분)) |> 
  mutate(차이 = 실제시간 - 계획시간, 
         비고 = ifelse(차이 > 0, '지연출발', '조기출발')) -> ap_7tidy)
  
ap_7tidy


ap_7tidy |> 
  count(비고, 구분) |> 
  drop_na() |> 
  ggplot(aes(x = 비고, y = 구분, fill = n)) +
  geom_tile(color = 'snow', size = 2) +
  geom_text(aes(label = n)) +
  colorspace::scale_fill_binned_sequential('Peach')



#
ap_3arr_rename |> 
  separate(col = '계획시간', into = c('계획', '시간'), sep = ":") -> temp1



temp1 |> 
  mutate(시간분 = as.numeric(계획) * 60 + as.numeric(시간), .keep = 'used') |> 
  print(n = 200)


