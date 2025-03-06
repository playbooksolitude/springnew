#25-0216 sun 

#
library(tidyverse)
library(readxl)

#
read_excel("./season_5/rawdata/kbo_team_slash_untidy.xlsx") -> kbo_untidy
file.choose() |> read_excel()

#
kbo_untidy |> #colnames()
  fill(팀, .direction = 'down') |> 
  pivot_longer(cols = `1982`:`2020`, names_to = '연도', 
    values_to = '기록'), 
    values_drop_na = T) |>
  pivot_wider(names_from = '구분', values_from = '기록') |> 
  mutate(연도 = factor(연도)) -> kbo_tidy
  #sample_n(10)

#
kbo_untidy |> 
  filter(구분 == '타율') |> 
  ggplot(aes(x = 팀, y = `1982`)) +
  geom_bar(stat = 'identity')

kbo_tidy |> 
  filter(연도 %in% c(1982, 1983,1984)) |> 
  ggplot(aes(x = 팀, y = 타율)) +
  geom_bar(aes(fill = 연도), stat = 'identity', 
    position = 'dodge') +
  geom_label(aes(label = 타율, group = 연도), 
    position = position_dodge(.9)) +
  ggtitle(label = '1982년~1984년 팀 타율') +
  bbc_style()
  
#
mpg |> 
  ggplot(aes(x = manufacturer)) +
  geom_bar(stat = 'count')


#
file.choose() |> read_excel()
read_excel("./season_5/4th/kobis.xlsx", skip = 5) -> kobis

kobis |> 
#  colnames()
  rename(날짜 = 1) |> 
  mutate(as.Date(날짜))

read_excel("./season_5/4th/KOBIS_Y2023.xlsx", skip = 4) -> kobis

library(scales)
kobis |> 
  filter(대표국적 == '한국') |> 
  slice(1:10) |> 
  ggplot(aes(x =영화명 |> fct_reorder(관객수), 
    y = 관객수)) +
  geom_bar(stat = 'identity') +
  scale_y_continuous(labels = comma) +
  geom_label(aes(label = 관객수)) +
  coord_flip()

kobis |> 
  mutate(월 = month(개봉일), .before = 3) |> 
  count(월)


band_instruments
band_instruments2
band_members

#
band_instruments |> 
  left_join(band_members, unmatched = 'drop')

band_instruments |> 
  left_join(band_instruments2, by = c('name' = 'artist'))






