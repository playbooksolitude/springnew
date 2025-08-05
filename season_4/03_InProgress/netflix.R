#24-1103 sun 08:15

#
source("./p_load.R", echo = T)
#install.packages("readxl")
library(readxl)

#netflix 
#https://www.netflix.com/tudum/top10/tv-non-english


read_excel("./season_4/03_InProgress/all-weeks-countries.xlsx") -> nflx_1excel
read_excel("./season_4/03_InProgress/all-weeks-countries.xlsx") -> nflx_1excel

read_excel("./season_4/03_InProgress/all-weeks-countries.xlsx") -> nflx_1excel
#read_excel("./backlog/dataset/netflix/all-weeks-global.xlsx")
#read_excel("./backlog/dataset/netflix/most-popular.xlsx")
nflx_1excel

# excel 읽어오는 함수가 궁금하다면
?read_excel()

nflx_1excel |> 
  filter(country_name == 'South Korea') -> 

# 유사 검색 기능 (강력) ----
nflx_1excel |> 
  filter(
    agrepl('korea', country_name, 
      ignore.case = T))



  ## n_max ----
  # 불러올 데이터가 많을 때 n줄만 불러오기 
read_excel("./season_4/03_InProgress/all-weeks-countries.xlsx", 
           n_max = 1000)

  ## colnames ----
  ## 첫번째 줄을 변수명으로 볼것인지, 값으로 볼것인지
read_excel("./season_4/03_InProgress/all-weeks-countries.xlsx",
           n_max = 1000, 
           col_names = T) # 변수명 

    ## colnames = F
read_excel("./season_4/03_InProgress/all-weeks-countries.xlsx",
           n_max = 1000,
           col_names = F) # 변수명

  ## view 함수로 데이터 확인하는 습관 들이기
read_excel("./season_4/03_InProgress/all-weeks-countries.xlsx",
           n_max = 1000, 
           col_names = TRUE) |> view()

  ## view 함수로 데이터 확인하는 습관 들이기
read_excel("./season_4/03_InProgress/all-weeks-countries.xlsx",
           n_max = 1000, 
           col_names = FALSE) |> view()

# 여기서 잠깐 
## error T or t
### 대문자 T는 TRUE의 약자 (글자 파란색), 소문자는 검정색 (의미없음)
read_excel("./season_4/03_InProgress/all-weeks-countries.xlsx",
           n_max = 1000,
           col_names = t)

# excel ----
read_excel("./season_4/03_InProgress/all-weeks-countries.xlsx",
           col_names = T) -> nflx_1excel


# 한국 
nflx_1excel |> 
  filter(country_name == 'South Korea') -> 
  
  # 유사 검색 기능 (강력) ----
nflx_1excel |> 
  filter(
    agrepl('korea', country_name, 
      ignore.case = T))


  ## str ----
nflx_1excel |> 
  str()

nflx_1excel |> 
  count(category)

nflx_1excel |> 
  print(n = 200)

# 맨 마지막
nflx_1excel |> 
  tail()

#첫번째 날짜, 마지막 날짜
nflx_1excel |> 
  slice(1,n())

# 2024-10-27 날짜만 조회
nflx_1excel |> 
  filter(week == "2024-10-27", 
    country_name == "South Korea") 

nflx_1excel |> 
  filter(week == '2024-10-27')


nflx_1excel |> 
  filter(week == '2024-10-27', 
         country_name == 'South Korea') -> nflx_2kor

# 유사 검색 기능 (강력) ----
nflx_1excel |> 
  filter(
    agrepl('korea', country_name, 
      ignore.case = T)) |> 
  print(n = 50)


#
nflx_1excel |> 
  filter(
    agrepl('united', country_name, 
      ignore.case = T)) |> 
  count(country_name)

#
nflx_1excel |> 
  filter(
    agrepl('united', country_name, 
      ignore.case = T)
  )

nflx_1excel |> 
  filter(
    agrepl('united', country_name, 
      ignore.case = T)
  ) |> 
  count(country_iso2)

nflx_1excel |> 
  filter(country_iso2 == 'GB')




# 복사하기 filter ----
## 윈도우 파일 복사하기와 동일
nflx_1excel -> nflx_2copy

# ----
nflx_1excel |> 
  filter(country_name == 'South Korea', 
    week == '2024-10-27')

# 검색어 ----
nflx_1excel |> 
  filter(
    agrepl('united', country_name, 
      ignore.case = T)
  )

# 일본, 한국
nflx_1excel |> 
  filter(country_name %in% c("South Korea", "Japan"), 
    category == 'Films') |> 
  slice(1, n())


# weekly_rank == '1'
# week == '2024-10-27'
# category == 'Films'
# country_name %in% c("일본", "미국", "영국", "한국")



#geom_point() ----
nflx_3kor |> 
  filter(category == "Films") |> 
  ggplot(aes(x = show_title, y = weekly_rank)) +
  geom_point()

# geom_segment  
nflx_3kor |> 
  filter(category == "Films") |> 
  ggplot(aes(x = show_title, y = weekly_rank)) +
  geom_point() +
  geom_segment(aes(xend = show_title, yend = 0))

nflx_3kor |> 
  filter(category == "Films") |> 
  ggplot(aes(x = show_title, 
             y = weekly_rank)) +
  geom_point(size = 8) +                             # 사이즈
  geom_segment(aes(xend = show_title, yend = 0)) 

#
nflx_1excel |> 
  filter(country_iso2 %in% c("USA"))



## colorspace ----
colorspace::hcl_palettes(plot = T)
colorspace::hcl_palettes(plot = T)

## color ----
nflx_3kor |> 
  filter(category == "Films") |> 
  ggplot(aes(x = show_title |> fct_reorder(weekly_rank), 
             y = factor(-weekly_rank), 
    color = weekly_rank)) + # color
  geom_point(size = 12) +
  geom_segment(aes(xend = show_title, yend = 0)) +
  geom_text(aes(label = show_title, y = factor(-weekly_rank + 1)),
    color = 'red', size = 5) +
  theme_minimal() +
  theme(axis.text = element_blank()) +
  geom_text(aes(label = weekly_rank), 
    color = 'snow', size = 4)
  
  # colorspace::scale_color_continuous_sequential(palette = "Magenta")
  # colorspace::scale_color_continuous_sequential(palette = "Mako")
  #scale_color_gradient(low = 'black', high = 'red')

nflx_3kor |> 
  filter(category == "Films") |> 
  ggplot(aes(x = show_title |> fct_reorder(weekly_rank),
             y = factor(-weekly_rank))) +
  geom_point(size = 8) +
  geom_segment(aes(xend = show_title, 
                   yend = 0), size = 2) +
  theme_minimal() +
  #geom_text(aes(label = factor(weekly_rank)), color = 'snow') 
  geom_text(aes(label = show_title, 
                y = factor(-weekly_rank + 1)), 
            color = 'red', 
            size = 5)  +
  #scale_color_gradient(low = 'black', high = 'red') +
  geom_text(aes(label = weekly_rank), 
            color = 'snow', size = 4) +
  #xlab('title')
  labs(x = 'showtitle', y = 'rank') +
  theme(axis.text = element_blank(), 
        legend.position = 'none') +
  scale_x_discrete(expand = expansion(mult = .1)) +
  labs(title = "NETFLIX 영화 한국 top 10",
       subtitle = "2024.10.27")
  
2024-10-27


# 트렌드  ----
nflx_2kor |> 
  ggplot(aes(x = week, y = show_title |> fct_reorder(week))) +
  geom_point()

## mutate(ymd)
nflx_2kor |> 
  mutate(week2 = ymd(week)) -> nflx_4kor

nflx_4kor |> 
  filter(week2 > "2023-01-01", week2 < "2024-01-01") 

nflx_4kor |> 
  filter(week2 > "2023-01-01", week2 < "2024-01-01") -> nflx_5kor_2023

nflx_5kor_2023 |> 
  filter(weekly_rank == '1') -> nflx_6kor_rank


nflx_6kor_rank |> 
  filter(category == 'TV') |> 
  ggplot(aes(x = week2, y = show_title |> fct_reorder(week2))) +
  geom_point(size = 2) +
  geom_line() +
  bbplot::bbc_style() +
  labs(title = "NETFLIX TV 시리즈 한국 1위",
       subtitle = "2023.01.01 ~ 2023.12.31")



## 5회차 스터디때 계속 ----
#한국 영화 만들어보기

# 면분할로 같이 보기

facet_wrap(.~category, scales = 'free_y')
  


## NA ----
  # Hellbound: season 2

# 
netflix4_TV_name |> 
  ggplot(aes(week, 
             y = kor_name |> fct_reorder(week))) + #날짜가 x축일 때 y 축 정렬
  geom_point(stat = "identity") +
  labs(title = "NETFLIX 한국 1위 TV 부문",
       subtitle = "2021.07.04 ~ 2023.04.02",
       y = "show_title") + bbc_style() +
  geom_line()  

#colSums ----
colSums(is.na(nflx_2kor))


## mutate() ----
nflx_2kor |> 
  mutate(season_title = ifelse(nflx_2kor$season_title == "N/A", 
                               nflx_2kor$show_title, 
                               nflx_2kor$season_title)) -> nflx_3kor

nflx_3kor |> 


  #year, month, day
nflx_temp3 |> 
  mutate(week2 = ymd(week))


# excel ----
read_excel("./backlog/dataset/netflix/all-weeks-countries.xlsx",
           col_names = T, 
           na = "N/A") -> nflx_1excel
  #col_types
  # ("skip", "guess", "logical", "numeric", "date", "text" or "list")

  ## head ----
nflx_1excel |> head()
nflx_1excel |> tail()
nflx_1excel |> str()
nflx_1excel |> glimpse()
colSums(is.na(nflx_1excel))
nflx_1excel


# facotr() ----
nflx_1excel |> 
  count(category)

nflx_1excel |> 
  count(season_title)

# ----
library(readxl)
read_excel("./season_4/01_backlog/most-popular (2).xlsx") -> nflx_1excel
install.packages('gt')
library(gt)

#
nflx_1excel |> view()
nflx_1excel |> gt()
nflx_1excel |> 
  filter(rank %in% c(1,10))

nflx_1excel |> 
  filter(rank %in% c(1,2,3), category == 'TV (English)') |> 
  ggplot(aes(x = rank, y = hours_viewed_first_91_days)) +
  geom_bar(stat = 'identity') +
  geom_label(aes(label = hours_viewed_first_91_days/1000000))

nflx_1excel[,1:3]


  
  

  



































