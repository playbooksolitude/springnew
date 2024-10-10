#24-1006

#
library(tidyverse)
library(patchwork)
library(showtext)
showtext_auto()

# weight: 병아리의 체중(그램 단위).
# feed: 병아리가 섭취한 사료의 종류
  # horsebean: 말콩
  # linseed: 아마씨
  # soybean: 대두
  # sunflower: 해바라기씨
  # meatmeal: 고기 부산물
  # casein: 카세인(우유 단백질)

#
chickwts |> head()
chickwts |> str()
(chickwts |> 
  ggplot(aes(x = feed, y = weight)) +
  geom_boxplot() +
    labs(title = "", subtitle = 'IQR') +
  geom_point(position = position_jitter(.1)) -> plot_1boxplot)

chickwts |> count(feed)

#
(chickwts |> 
  group_by(feed) |> 
  reframe(mean_feed = mean(weight), 
    n = n()) |> 
  ggplot(aes(x = feed |> fct_reorder(mean_feed), 
    y = mean_feed)) +
  geom_bar(stat = 'identity') +
  labs(title = '', subtitle = '평균', x = 'feed') +
  geom_label(aes(label = round(mean_feed,1))) -> plot_2barplot)

#
plot_1boxplot  / plot_2barplot
