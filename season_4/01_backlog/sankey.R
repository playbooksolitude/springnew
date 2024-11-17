#24-1107 thus

#
source("./season_4/p_load.R", echo = T)

#
mpg
chickwts
ChickWeight
diamonds |> 
  group_by(cut, color) |> 
  reframe(n = n()) |> 
  ggplot(aes(x = cut, y = color, fill = n)) +
  geom_tile() +
  geom_text(aes(label = paste(comma(n), "개")), color = 'snow', size = 10)

data

read_csv("./season_2/1st/airport_2402 - Sheet.csv") -> flight

flight |> 
  str()

flight |> 
  glimpse()

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

  
# sankey ----
if (!require(networkD3)) install.packages("networkD3")
library(networkD3)

  # Sample data frame
  data <- data.frame(
    출발공항명 = c("EIELSON AFB", "ZLDH", "가고시마", "가목사", 
              "가오슝", "간사이", "고마쓰", "과달라하라", "괌", "광저우", 
              "광저우", "괌"),
    도착공항명 = c("인천", "인천", "인천", "인천", "인천", "인천", "인천", 
              "인천", "인천", "인천", "김포", "김포"),
    n = c(1, 1, 21, 8, 75, 892, 13, 13, 212, 171, 120, 64))
  
  # Create nodes dataframe
  nodes <- tibble(name = unique(c(data$출발공항명, data$도착공항명)))
  
  # Create links dataframe
  links <- data %>%
    mutate(source = match(출발공항명, nodes$name) - 1,
           target = match(도착공항명, nodes$name) - 1) %>%
    select(source, target, value = n)
  
  # Create Sankey chart
  sankeyNetwork(Links = links, 
                Nodes = nodes, 
                Source = "source", 
                Target = "target",
                Value = "value", 
                NodeID = "name", 
                fontSize = 12, 
                nodeWidth = 30) 
    
t1 -> t2

#  
example("sankeyNetwork")
