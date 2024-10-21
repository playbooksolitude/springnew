#24-1006

#패키지 불러오기
source("~/Documents/springnew/season_4/done/p_load.R", echo = TRUE)

# library(tidyverse)
# library(patchwork)
# library(showtext)
# showtext_auto()

#
chickwts |> head()
chickwts

chickwts |> 
  count(feed) |> 
  ggplot(aes(x = feed, y = n)) +
  geom_bar(stat = 'identity')

# 설명 ----
# weight: 병아리의 체중(그램 단위).
# feed: 병아리가 섭취한 사료의 종류
  # horsebean: 말콩
  # linseed: 아마씨
  # soybean: 대두
  # sunflower: 해바라기씨
  # meatmeal: 고기 부산물
  # casein: 카세인(우유 단백질)

# plot point ---- 
chickwts |> 
  ggplot(aes(x = feed, y = weight)) +
  geom_point()

## t1 ----
(chickwts |> 
  group_by(feed) |> 
  reframe(avg = mean(weight)) -> t1)

# plot mean ----
chickwts |> 
  ggplot(aes(x = feed, y = weight)) +
  geom_point() +
  geom_point(data = t1, aes(x = feed, y = avg), 
             size = 5, color = 'tomato2', shape = 4, stroke = 2)

# plot boxplot ----
chickwts |> 
  ggplot(aes(x = feed, y = weight)) +
  geom_boxplot() +
  geom_point(data = t1, aes(x = feed, y = avg), 
             size = 5, color = 'tomato2', shape = 4, stroke = 2) +
  geom_point()


## group_by ----
chickwts |> 
  group_by(feed) |> 
  reframe(mean_feed = mean(weight), 
          n = n())

# geom_bar ----
chickwts |> 
   group_by(feed) |> 
   reframe(mean_feed = mean(weight), 
           n = n()) |> 
   ggplot(aes(x = feed, 
              y = mean_feed)) +
   geom_bar(stat = 'identity') +
   labs(title = '', subtitle = '평균', x = 'feed') +
   geom_label(aes(label = round(mean_feed,1)))

# patchwork1 ----
(chickwts |> 
  group_by(feed) |> 
  reframe(mean_feed = mean(weight), 
    n = n()) |> 
  ggplot(aes(x = feed,
  #ggplot(aes(x = feed |> fct_reorder(mean_feed), 
    y = mean_feed)) +
  geom_bar(stat = 'identity') +
  labs(title = '', subtitle = '평균', x = 'feed') +
  geom_label(aes(label = round(mean_feed,1))) -> plot_2barplot)

# patchwork2 ----
(chickwts |> 
   ggplot(aes(x = feed, y = weight)) +
   geom_boxplot() +
   geom_point(data = t1, aes(x = feed, y = avg), 
              size = 5, color = 'tomato2', shape = 4, stroke = 2) +
   labs(title = "", subtitle = 'IQR') +
   geom_point(position = position_jitter(.1)) -> plot_1boxplot)


# patchwork all ----
plot_1boxplot  / plot_2barplot

# order



# test ----
mpg |> 
  group_by(class) |> 
  reframe(avg = mean(cty)) -> t2

mpg |> 
  ggplot(aes(x = class, y = cty)) +
  geom_boxplot(outliers = F) +
  geom_point(position = position_jitter(.1), alpha = .5) +
  geom_point(data = t2, aes(x = class, y = avg), 
             size = 5, color = 'tomato2', shape = 4, stroke = 2)
  
# mpg |> 
#   filter(class == "subcompact") |> 
#   with(cty) |> sort() |> IQR()

# t.test ----
chickwts |> 
  filter(feed %in% c("casein", "sunflower")) -> t3_ttest

# 
t.test(weight ~ feed, data = t3_ttest)

# 
chickwts |> 
  filter(feed %in% c("meatmeal", "sunflower")) -> t4_ttest

t.test(weight ~ feed, data = t4_ttest)

chickwts |> 
  filter(feed %in% c("horsebean", "sunflower")) -> t5_ttest

t.test(weight ~ feed, data = t5_ttest)

