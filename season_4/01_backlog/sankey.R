#24-1107 thus

#
source("./season_4/p_load.R", echo = T)

#
diamonds |> 
  group_by(cut, color) |> 
  reframe(n = n()) |> 
  ggplot(aes(x = cut, y = color, fill = n)) +
  geom_tile(color = 'snow') +
  geom_text(aes(label = paste(comma(n), "개")), color = 'grey20', size = 6) +
  colorspace::scale_fill_continuous_sequential("peach")
  
# sankey ----
if (!require(networkD3)) install.packages("networkD3")
library(networkD3)

# 데이터셋 ----
(data <- data.frame(
  출발공항명 = c("EIELSON AFB", "ZLDH", "가고시마", "가목사", 
            "가오슝", "간사이", "고마쓰", "과달라하라", "괌", "광저우", 
            "광저우", "괌"),
  도착공항명 = c("인천", "인천", "인천", "인천", "인천", "인천", "인천", 
            "인천", "인천", "인천", 
            "김포", "김포"),
  n = c(1, 1, 21, 8, 75, 892, 13, 13, 212, 171, 
        120, 64)))
data |> 
  group_by(도착공항명) |> 
  reframe(sum = sum(n))
  
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
t1 -> t2

# exam ----
read_csv("./season_2/1st/airport_2402 - Sheet.csv") -> flight

# 노드 ----
unique(c(mpg$model)) |> tibble()
n_distinct(c(mpg$model))
table(mpg$model) |> as.data.frame() |> tibble()
unique(c(mpg$class, mpg$drv)) |> tibble()


# 노드 ----
data
data.frame(
  names = unique(c(data$출발공항명, data$도착공항명))
          ) -> nodes

# 링크 ----




# 링크 ----도착공항명



data |> 
  mutate(match(출발공항명, nodes$))
match(data$출발공항명, nodes)

nodes
match(data$출발공항명, nodes$name)
match(data$도착공항명, nodes$name)
data

data |> 
  mutate(source = match(출발공항명, nodes$name)-1,
         target = match(도착공항명, nodes$name)-1) |> gt()

data |> 
  mutate(source = match(출발공항명, nodes$name)-1,
         target = match(도착공항명, nodes$name)-1) |> 
  select(source, target, value = n) -> links_edit

sankeyNetwork(Links = )

#
flight |> 
  mutate(`출/도착구분` = factor(`출/도착구분`),
         항공사 = factor(항공사),
         편명 = factor(편명)) -> flight_2

#
flight_2 |> 
  filter(도착공항명 == '인천') |> 
  group_by(출발공항명,도착공항명) |> 
  reframe(n = n()) -> flight_3

# sankey ----
flight_3 %>% 
  mutate(source = match(출발공항명, nodes$name) - 1,
         target = match(도착공항명, nodes$name) - 1) %>%
  select(source, target, value = n) -> links_3

sankeyNetwork(Links = links_3, 
              Nodes = nodes, Source = "source", Target = "target",
              Value = "value", NodeID = "name", fontSize = 12, nodeWidth = 30)

# 응용 ----

# 데이터셋 ----
(data <- data.frame(
  출발공항명 = c("EIELSON AFB", "ZLDH", "가고시마", "가목사", 
            "가오슝", "간사이", "고마쓰", "과달라하라", "괌", "광저우", 
            "광저우", "괌", "김포"),
  도착공항명 = c("인천", "인천", "인천", "인천", "인천", "인천", "인천", 
            "인천", "인천", "인천", 
            "김포", "김포", "인천"),
  n = c(1, 1, 21, 8, 75, 892, 13, 13, 212, 171, 
        120, 64, 150)))

# 노 드 데이터셋 ---
(nodes <- tibble(name = unique(c(data$출발공항명, data$도착공항명))))

# 링크 데이터셋 ----
(links <- data %>%
   mutate(source = match(출발공항명, nodes$name) - 1,
          target = match(도착공항명, nodes$name) - 1) %>%
   select(source, target, value = n))

# Create Sankey chart
sankeyNetwork(Links = links, 
              Nodes = nodes, 
              Source = "source", 
              Target = "target",
              Value = "value", 
              NodeID = "name", 
              fontSize = 12, 
              nodeWidth = 30) 


# 다른 함수들 ----
library(networkD3)

# 예제 데이터
nodes <- data.frame(name = c("A", "B", "C", "D"))
links <- data.frame(source = c(0, 0, 1, 2, 2, 3), 
                    target = c(1, 2, 3, 3, 0, 1), 
                    value = c(10, 20, 15, 5, 10, 15))

# Sankey 다이어그램 생성
sankeyNetwork(Links = links, Nodes = nodes, 
              Source = "source", Target = "target", 
              Value = "value", NodeID = "name", 
              units = "TWh", fontSize = 12, nodeWidth = 30)


forceNetwork(Links = links, Nodes = nodes, 
             Source = "source", Target = "target",
             Value = "value", NodeID = "name")
