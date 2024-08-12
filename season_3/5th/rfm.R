#24-0812 mon 22:48

#
library(rfm)
library(tidyverse)
library(bbplot)

rfm_data_orders |> str()
rfm_data_customer |> str()

#
rfm_data_orders |> head()
rfm_data_customer |> head()

#
rfm_data_customer$email -> temp1
rfm_data_orders$email -> temp2
intersect(temp1, temp2)

#
rfm_data_customer |>
  summary()

rfm_data_customer |> 
  mutate(orders = case_when(number_of_orders < ))


#
?case_when()

rfm_data_customer |> 
  mutate(
    level_number = case_when(
      number_of_orders <= 8 ~ 'level_A',
      number_of_orders <= 16 ~ 'level_B', 
      number_of_orders <= 24 ~ 'level_C',
      .default = '0'),
    level_recency = case_when(
      recency_days <= 300 ~ 'level_daysA', 
      recency_days <= 600 ~ 'level_daysB',
      recency_days <= 900 ~ 'level-daysC', 
      .default = '0')) |> 
  count(level_number, level_recency) |> 
  ggplot(aes(x = level_number, y = level_recency, fill = n)) +
  geom_tile() +
  geom_text(aes(label = scales::comma(n)), 
            color = 'white', size = 12) +
  theme_minimal()
  
#
