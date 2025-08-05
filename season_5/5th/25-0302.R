#25-0302 sun 11:36



#0 library ----
library(tidyverse)
library(showtext)
showtext_auto()


#1 read ----


(read_csv("./season_5/airport_2402_arr.csv") -> ap_1arr_csv)
(read_csv("./season_5/airpot_2402_dep.csv") -> ap_1dep_csv)


# str ---
ap_1arr_csv |> str()
ap_1dep_csv |> str()
ap_1arr_csv |> dim()
ap_1dep_csv |> dim()

# glimse()
ap_1arr_csv
ap_1dep_csv

#
ap_1arr_csv
ap_1dep_csv


# 
ap_1arr_csv |> colnames()
ap_1dep_csv |> colnames()

#
ap_1arr_csv |> 
  full_join(ap_1dep_csv) |> #slice(1,n()) |> 
  sample_n(20) |> view()

(ap_1arr_csv |> 
  full_join(ap_1dep_csv)  -> temp1)


temp1 |> count(구분)
temp1 |> 


# `출/도착구분`

ap_1arr_csv |> 
  mutate(출도착구분 = `출/도착구분`, .keep = 'unused') -> ap_2arr_rename

#
ap_1dep_csv |> 
  mutate(출도착구분 = `출/도착구분`, .keep = 'unused') -> ap_2dep_rename

ap_2arr_rename |> colnames()
ap_2dep_rename |> colnames()

#
ap_2arr_rename |> colnames() |> as_tibble() |> as_vector()
ap_2dep_rename |> colnames() |> as_tibble() |> as_vector()

# tibble() ----
tibble(
arr = ap_2arr_rename |> colnames() |> as_tibble() |> as_vector(),
dep = ap_2dep_rename |> colnames() |> as_tibble() |> as_vector())

#
(ap_2arr_rename |> colnames() |> as_tibble() -> ap_2arr_1vector)
(ap_2dep_rename |> colnames() |> as_tibble() -> ap_2dep_1vector)


# 교집합, 차집합 ----
intersect(ap_2arr_1vector$value, ap_2dep_1vector$value)
setdiff(ap_2arr_1vector$value, ap_2dep_1vector$value)

#
ap_2arr_rename |> glimpse()
(ap_2arr_rename |> 
    rename(실제시간 = 도착시간) -> ap_3arr_rename)

(ap_2dep_rename |> 
    rename(실제시간 = 출발시간) -> ap_3dep_rename)

#
(ap_3arr_rename |> colnames() |> as_tibble() -> ap_3arr_rename_q)
(ap_3dep_rename |> colnames() |> as_tibble() -> ap_3dep_rename_q)

#
setdiff(ap_3arr_rename_q, ap_3dep_rename_q)
intersect(ap_3arr_rename_q, ap_3dep_rename_q)


# join ----
ap_3arr_rename |> 
  full_join(ap_3dep_rename) |> slice(1,n()) |> select(1:5, 13)

ap_3arr_rename |> 
  full_join(ap_3dep_rename) -> ap_4join_tidy |> view()

ap_4join_tidy |> view()


#
ap_4join_tidy |> 
  count(출도착구분, 현황) |> 
  mutate(출도착구분 = factor(출도착구분), 
         현황 = factor(현황)) |> 
  ggplot(aes(x = 현황 |> 
      fct_relevel('출발', '도착', '지연', '취소', '회항'), 
             y = n)) +
  geom_bar(stat = 'identity')  +
  facet_wrap(.~출도착구분) +
  geom_text(aes(label = scales::comma(n)), size = 6, vjust = -.5) +
  labs(x = '현황') +
  scale_y_continuous(labels = scales::comma, 
    breaks = c(5000,10000), limits = c(0,13000))
  

#
bbplot::bbc_style()  

#
ap_4join_tidy |> #print(n = 30)
  count(출도착구분, 현황) |> 
  mutate(출도착구분 = factor(출도착구분), 
         현황 = factor(현황)) |> 
  ggplot(aes(x = 현황 |> fct_relevel('출발', '도착', '지연', '취소', '회항'), 
             y = n)) +
  geom_bar(stat = 'identity')  +
  facet_wrap(.~출도착구분) +
  #geom_label(aes(label = n), size = 6)  +
  geom_text(aes(label = n), size = 6, vjust = -.5) +
  labs(x = '현황') +
  bbplot::bbc_style() +
  scale_y_continuous(labels = comma, breaks = c(5000,10000)) 
  

#
ap_4join_tidy |> str()

#
(ap_4join_tidy |> 
  select(날짜, 항공사, 편명, 출발공항명, 도착공항명, 
    계획시간, 실제시간, 구분, 현황, 출도착구분) |> 
  separate(col = 계획시간, into = c('계획시', '계획분'), 
    sep = ":", remove = F) |> #print(n = 50)
  mutate(계획시 = as.integer(계획시), 
         계획분 = as.integer(계획분), 
         계획 = 계획시 * 60 + 계획분) -> ap_4join_tidy2)  

ap_4join_tidy2 |> view()

(ap_4join_tidy2 |> 
  separate(col = 실제시간, into = c('실제시', '실제분'), sep = ":", remove = F) |> #view()
  mutate(실제시 = as.integer(실제시), 
         실제분 = as.integer(실제분),
         실제 = 실제시 * 60 + 실제분) |> 
  select(날짜, 항공사, 편명, 출발공항명, 도착공항명, 
         계획시간, 실제시간, 계획, 실제, 구분, 
    현황, 출도착구분) -> ap_4join_tidy3)


(ap_4join_tidy3 |> 
  mutate(차이 = 실제 - 계획) -> ap_4join_tidy4)

ap_4join_tidy4 |> select(1,항공사,계획시간, 실제시간,13)

(ap_4join_tidy4 |> 
  mutate(품질 = ifelse(차이 > 0, '지연', '조기')) -> ap_4join_tidy5)

ap_4join_tidy5 |> select(1,14)

#
(ap_4join_tidy5 |> 
  filter(구분 == '여객') |> 
  arrange(desc(차이)) |> 
  slice(1:10) -> ap_4join_tidy6)


# 지연 top 10 ----
ap_4join_tidy6 |> 
  ggplot(aes(x = 편명, y = 차이)) +
  geom_bar(stat = 'identity', aes(fill = 출도착구분)) +
  facet_grid(날짜~출도착구분, scale = 'free_x')  +
  geom_label(aes(label = 항공사)) +
  theme(legend.position = 'top')


#sankey ----
library(networkD3)

ap_4join_tidy5 |> 
  group_by(항공사, 출발공항명, 도착공항명) |> 
  reframe(n = n()) |> 
  arrange(desc(n)) |> 
  top_n(20) |> print(n = Inf)
           
ap_4join_tidy5 |> 
  filter(출도착구분 == '도착') |> 
  group_by(구분, 출발공항명, 도착공항명) |> 
  reframe(n = n()) |> 
  arrange(desc(n)) |> 
  top_n(10) -> ap_4join_tidy7


ap_4join_tidy7

  
#
(nodes <- tibble(name = unique(c(ap_4join_tidy7$출발공항명, ap_4join_tidy7$도착공항명))))

# 링크 데이터셋 
(links <- ap_4join_tidy7 %>%
    mutate(source = match(출발공항명, nodes$name) - 1,
           target = match(도착공항명, nodes$name) - 1) %>%
    select(source, target, value = n))

# Create Sankey chart
sankeyNetwork(Nodes = nodes, 
              Links = links, 
              Source = "source", 
              Target = "target",
              Value = "value", 
              NodeID = "name", 
              fontSize = 14, 
              nodeWidth = 50) 

#
(mpg |> 
    group_by(drv, class) |> 
    reframe(n = n()) -> mpg_groupby)

## node
(tibble(name = unique(c(mpg_groupby$drv, mpg_groupby$class))) -> mpg_node)

## link
(mpg_groupby |> 
    mutate(
      source = match(class, mpg_node$name) -1,
      target = match(drv, mpg_node$name) -1) |> 
    select(source, target, n) -> mpg_links)

# sankey
sankeyNetwork(Links = mpg_links, 
              Nodes = mpg_node, 
              Source = 'source', 
              Target = 'target',
              Value = 'n',
              NodeID = 'name', 
              fontSize = '20')


#
(data <- data.frame(
  출발공항명 = c("EIELSON AFB", "ZLDH", "가고시마", "가목사", 
    "가오슝", "간사이", "고마쓰", "과달라하라", "괌", "광저우", 
    "광저우", "괌"),
  도착공항명 = c("인천", "인천", "인천", "인천", "인천", "인천", "인천", 
    "인천", "인천", "인천", 
    "김포", "김포"),
  n = c(1, 1, 21, 8, 75, 892, 13, 13, 212, 171, 
    120, 64)))


# 노 드 데이터셋 ---
(nodes <- tibble(name = unique(c(data$출발공항명, data$도착공항명))))

# 링크 데이터셋 ----
(links <- data %>%
    mutate(source = match(출발공항명, nodes$name) - 1,
      target = match(도착공항명, nodes$name) - 1) %>%
    select(source, target, value = n))

# Create Sankey chart
sankeyNetwork(Nodes = nodes, 
  Links = links, 
  Source = "source", 
  Target = "target",
  Value = "value", 
  NodeID = "name", 
  fontSize = 12, 
  nodeWidth = 50) 



#
diamonds |> 
  count(cut, color, clarity, sort = T) |> 
  ggplot(aes(x = cut, y = n)) +
  geom_violin(color = 'grey50', alpha = .5) +
  geom_point(position = position_jitter(.1), alpha = .7, 
    aes(color = color), show.legend = F)  +
  bbplot::bbc_style() +
  ggtitle(label = 'daimonds cut & color') +
  colorspace::scale_color_discrete_qualitative('Dark 2')


colorspace::hcl_palettes(plot = T)


#



#



#



#