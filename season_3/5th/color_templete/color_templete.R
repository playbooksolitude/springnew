#24-0808 thus
# color templete

#
library(tidyverse)

#0 p ----
(mpg |> 
   ggplot(aes(displ, cty)) +
   geom_point() +
   labs(title = 'theme') -> p)

(mpg |> 
    ggplot(aes(x = manufacturer, y = after_stat(count))) +
    geom_bar() +
    coord_flip() +
    labs(title = 'theme') -> q)


#1 colorspace ----
library(colorspace)
colorspace::hcl_palettes(plot = T)

# 샘플 데이터
df <- data.frame(
  category = rep(letters[1:5], times = 2),
  value = c(3, 5, 2, 8, 7, 4, 6, 9, 10, 5),
  group = rep(c("Group 1", "Group 2"), each = 5)
)

#1 colorspace 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = rainbow_hcl(2)) +  # colorspace 팔레트 사용
  theme_minimal() +
  labs(title = "Colorspace Palette Example", subtitle = "Using colorspace::rainbow_hcl")

# 샘플 데이터
df <- data.frame(
  category = rep(letters[1:5], times = 2),
  value = c(3, 5, 2, 8, 7, 4, 6, 9, 10, 5),
  group = rep(c("Group 1", "Group 2"), each = 5))

#1-1 고급 템플릿 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = rainbow_hcl(2)) +  # colorspace 팔레트 사용
  theme_minimal() +
  labs(title = "Advanced Template Example",
       subtitle = "Combining Colorspace, RColorBrewer, and Viridis",
       caption = "Source: Sample Data") +
  theme(
    plot.title = element_text(size = 20, face = "bold"),
    plot.subtitle = element_text(size = 16),
    plot.caption = element_text(size = 12)
  )


 
#2 RColorBrewer 팔레트 사용 예제 ----
library(RColorBrewer)
02::display.brewer.all()


ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_brewer(palette = "Set1") +  # RColorBrewer 팔레트 사용
  theme_minimal() +
  labs(title = "RColorBrewer Palette Example", subtitle = "Using RColorBrewer::Set1")

# RColorBrewer 패키지 사용 예제 - Pastel1 팔레트
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_brewer(palette = "Pastel1") +  # RColorBrewer Pastel1 팔레트 사용
  theme_minimal() +
  labs(title = "RColorBrewer Palette Example", subtitle = "Using RColorBrewer::Pastel1")


library(viridis)
#3 viridis 팔레트 사용 예제 ----
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_viridis(discrete = TRUE) +  # viridis 팔레트 사용
  theme_minimal() +
  labs(title = "Viridis Palette Example", subtitle = "Using viridis::scale_fill_viridis")

# viridis 팔레트 사용 예제 - magma
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_viridis(discrete = TRUE, option = "magma") +
  theme_minimal() +
  labs(title = "Viridis Palette Example", subtitle = "Using viridis::magma")

#4 scakes ----
library(ggplot2)
library(scales)

# scales 패키지 사용 예제 - hue_pal
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = hue_pal()(2)) +
  theme_minimal() +
  labs(title = "Scales Package Example", subtitle = "Using scales::hue_pal")

#5 colorRamps ----
#install.packages('colorRamps')
library(colorRamps)

# 샘플 데이터
df <- data.frame(
  category = rep(letters[1:5], times = 2),
  value = c(3, 5, 2, 8, 7, 4, 6, 9, 10, 5),
  group = rep(c("Group 1", "Group 2"), each = 5))

# colorRamps 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = colorRamps::blue2red(2)) +  # colorRamps 팔레트 사용
  theme_minimal() +
  labs(title = "colorRamps Palette Example", subtitle = "Using colorRamps::blue2red")

#6 wesanderson ----
#install.packages('wesanderson')
library(wesanderson)

# wesanderson 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = wes_palette("GrandBudapest1", 2, type = "discrete")) +
  # wesanderson 팔레트 사용
  theme_minimal() +
  labs(title = "Wes Anderson Palette Example", subtitle = "Using wesanderson::GrandBudapest1")

#7 unikn ----
#install.packages('unikn')
library(unikn)

# unikn 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = unikn::seecol(pal_unikn_pair)) +  # unikn 팔레트 사용
  theme_minimal() +
  labs(title = "Uni Konstanz Palette Example", subtitle = "Using unikn::pal_unikn_pair")

#8 ggsci ----
#install.packages('ggsci')
library(ggsci)

# ggsci 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_jco() +  # ggsci 팔레트 사용
  theme_minimal() +
  labs(title = "ggsci Palette Example", subtitle = "Using ggsci::scale_fill_jco")

# 샘플 데이터
df <- data.frame(
  category = rep(letters[1:5], times = 2),
  value = c(3, 5, 2, 8, 7, 4, 6, 9, 10, 5),
  group = rep(c("Group 1", "Group 2"), each = 5))

# ggsci 패키지 사용 예제 - uchicago 팔레트
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_uchicago() +  # ggsci uchicago 팔레트 사용
  theme_minimal() +
  labs(title = "ggsci Palette Example", subtitle = "Using ggsci::scale_fill_uchicago")

#9 rcartocolor ----
#install.packages('rcartocolor')
library(rcartocolor)

# 샘플 데이터
df <- data.frame(
  category = rep(letters[1:5], times = 2),
  value = c(3, 5, 2, 8, 7, 4, 6, 9, 10, 5),
  group = rep(c("Group 1", "Group 2"), each = 5))

# rcartocolor 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_carto_d(palette = "Safe") +  # rcartocolor 팔레트 사용
  theme_minimal() +
  labs(title = "rcartocolor Palette Example", subtitle = "Using rcartocolor::Safe")

#10 paletteer ----
#install.packages('paletteer')
library(paletteer)
??paletteer

# paletteer 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_paletteer_d("nord::afk") +  # paletteer 팔레트 사용
  theme_minimal() +
  labs(title = "Paletteer Example", subtitle = "Using paletteer::nord::afk")

pal <- paletteer_d("ggthemes::Tableau_20")
print(pal)

#11 ggthemes ----
#install.packages('ggthemes')
library(ggthemes)

# ggthemes 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_tableau("Tableau 20") +  # ggthemes 팔레트 사용
  theme_fivethirtyeight() +  # ggthemes 테마 사용
  labs(title = "ggthemes Palette Example", subtitle = "Using ggthemes::Tableau 20")

#12 scico ----
install.packages('scico')
library(scico)

# scico 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_scico_d(palette = "tokyo") +  # scico 팔레트 사용
  theme_minimal() +
  labs(title = "scico Palette Example", subtitle = "Using scico::tokyo")

#13 ochRe ----
install.packages('ochRe')
library(ochRe)

# 샘플 데이터
df <- data.frame(
  category = rep(letters[1:5], times = 2),
  value = c(3, 5, 2, 8, 7, 4, 6, 9, 10, 5),
  group = rep(c("Group 1", "Group 2"), each = 5)
)

# ochRe 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = ochre_palettes$namadgi) +  # ochRe 팔레트 사용
  theme_minimal() +
  labs(title = "ochRe Palette Example", subtitle = "Using ochRe::namadgi")

#13 nord ----

library(nord)

# nord 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_nord(palette = "frost") +  # nord 팔레트 사용
  theme_minimal() +
  labs(title = "nord Palette Example", subtitle = "Using nord::frost")

#14 grDevices ----
#install.packages('grDevices')
library(grDevices)

# grDevices 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = rainbow(2)) +  # grDevices 팔레트 사용
  theme_minimal() +
  labs(title = "grDevices Palette Example", subtitle = "Using grDevices::rainbow")

#15 PNWColors ----
install.packages('PNWColors')
library(PNWColors)

# PNWColors 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = pnw_palette("Bay")) +  # PNWColors 팔레트 사용
  theme_minimal() +
  labs(title = "PNWColors Palette Example", subtitle = "Using PNWColors::Bay")

#16 jcolors ----
#install.packages('jcolors')
library(jcolors)

# jcolors 패키지 사용 예제 - pal2 팔레트
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_jcolors(palette = "pal2") +  # jcolors pal2 팔레트 사용
  theme_minimal() +
  labs(title = "jcolors Palette Example", subtitle = "Using jcolors::pal2")

# 17 ghibli ----
#install.packages('ghibli')
library(ghibli)

# 샘플 데이터
df <- data.frame(
  category = rep(letters[1:5], times = 2),
  value = c(3, 5, 2, 8, 7, 4, 6, 9, 10, 5),
  group = rep(c("Group 1", "Group 2"), each = 5))

# ghibli 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_ghibli_d("MarnieLight1") +  # ghibli 팔레트 사용
  theme_minimal() +
  labs(title = "ghibli Palette Example", subtitle = "Using ghibli::MarnieLight1")

(ghibli_palette("PonyoLight") -> ghibli1)
(ghibli_palette("LaputaMedium") -> ghibl2)
(ghibli_palette("SpiritedDark") -> ghibl3)
(ghibli_palette("MarnieMedium2", 7) -> ghibli4)
library(patchwork)

ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_ghibli_d("MarnieLight2") +  # ghibli 팔레트 사용
  theme_minimal() +
  labs(title = "Ghibli Palette Example", subtitle = "Using ghibli::MarnieLight2")



# 18 nationalparkcolors ----
# devtools 패키지 설치 (필요한 경우)
#install.packages("devtools")
# nationalparkcolors 패키지 설치
devtools::install_github("katiejolly/nationalparkcolors")

#install.packages('nationalparkcolors')
library(nationalparkcolors)
park_palettes
print(a)


# nationalparkcolors 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = park_palette("Yosemite")) +  # nationalparkcolors 팔레트 사용
  theme_minimal() +
  labs(title = "nationalparkcolors Palette Example", subtitle = "Using nationalparkcolors::Yosemite")

# 팔레트를 데이터 프레임으로 변환
get_palette_df <- function(palette_list) {
  palette_df <- do.call(rbind, lapply(names(palette_list), 
                                      function(palette_name) {
    colors <- palette_list[[palette_name]]
    data.frame(
      palette = palette_name,
      color = colors,
      color_id = seq_along(colors)
    )
  }))
  return(palette_df)}

# 데이터 프레임 생성
palette_df <- get_palette_df(park_palettes)

# 팔레트 시각화
ggplot(palette_df, aes(x = color_id, y = palette, fill = color)) +
  geom_tile() +
  scale_fill_identity() +
  theme_minimal() +
  labs(title = "National Park Colors Palettes", 
       x = "Color ID", y = "Palette Name") +
  theme(axis.text.y = element_text(size = 8))

#19 tvthemes ----
#install.packages('tvthemes')
library(tvthemes)

# tvthemes 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_simpsons() +  # tvthemes 팔레트 사용
  theme_minimal() +
  labs(title = "tvthemes Palette Example", subtitle = "Using tvthemes::simpsons")

#20 MetBrewer ----
#install.packages('MetBrewer')
library(MetBrewer)
names(MetPalettes)
print(MetPalettes)

# 샘플 데이터
df <- data.frame(
  category = rep(letters[1:5], times = 2),
  value = c(3, 5, 2, 8, 7, 4, 6, 9, 10, 5),
  group = rep(c("Group 1", "Group 2"), each = 5))

# MetBrewer 팔레트 사용 예제
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_met_d("VanGogh1") +  # MetBrewer 팔레트 사용
  theme_minimal() +
  labs(title = "MetBrewer Palette Example", 
       subtitle = "Using MetBrewer::VanGogh1")

?met.brewer
met.brewer("VanGogh1")
met.brewer("Greek", direction=-1)
met.brewer("Cassatt2", 4, override.order=TRUE)

# 팔레트 이름 추출
palette_names <- names(MetPalettes)

# 데이터 프레임 생성
palette_df <- data.frame(
  palette_name = palette_names,
  id = seq_along(palette_names)
)

# 팔레트 시각화용 데이터 프레임 생성 함수
get_palette_data <- function(palette_names) {
  do.call(rbind, lapply(palette_names, function(palette_name) {
    colors <- met.brewer(palette_name)
    data.frame(
      palette_name = palette_name,
      color = colors,
      color_id = seq_along(colors)
    )
  }))
}

# 팔레트 시각화 데이터 생성
palette_data <- get_palette_data(palette_names)

# ggplot2로 팔레트 시각화
ggplot(palette_data, aes(x = color_id, y = palette_name, fill = color)) +
  geom_tile() +
  scale_fill_identity() +
  theme_minimal() +
  labs(title = "MetBrewer Palettes", x = "Color ID", y = "Palette Name") +
  theme(axis.text.y = element_text(size = 8))


#21  teamcolors ----
#install.packages('teamcolors')
library(teamcolors)

# Green Bay Packers 팀 색상 추출
packers_colors <- teamcolors[teamcolors$name == "Green Bay Packers", ]

# 색상 정보 확인
print(packers_colors)
library(ggplot2)

# 데이터 생성
data <- data.frame(
  category = c("A", "B", "C", "D"),
  value = c(3, 7, 9, 5))

# ggplot2와 teamcolors를 사용한 시각화
ggplot(data, aes(x = category, y = value, fill = category)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c(packers_colors$primary, 
                               packers_colors$secondary, 
                               packers_colors$tertiary, 
                               packers_colors$quaternary)) +
  theme_minimal() +
  labs(title = "Bar Plot with Green Bay Packers Colors", x = "Category", y = "Value")


#22 cartography ----
#install.packages('cartography')
library(ggplot2)
library(cartography)

# 예제 데이터 생성
df <- data.frame(
  category = rep(c("A", "B", "C"), each = 2),
  value = c(3, 5, 2, 8, 6, 4),
  group = rep(c("G1", "G2"), 3))

# ggplot2와 cartography 팔레트를 사용한 시각화
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = carto.pal(pal1 = "sand.pal", n1 = 2)) +  # cartography 팔레트 사용
  theme_minimal() +
  labs(title = "Cartography Palette Example", 
       subtitle = "Using cartography::sand.pal")

#23 khroma ----
#install.packages('khroma')
library(khroma)

(df <- data.frame(
  category = rep(c("A", "B", "C"), each = 2),
  value = c(3, 5, 2, 8, 6, 4),
  group = rep(c("G1", "G2"), 3)))

# ggplot2와 khroma 팔레트를 사용한 시각화
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  khroma::scale_fill_muted() +  # khroma 팔레트 사용
  theme_minimal() +
  labs(title = "Khroma Palette Example", subtitle = "Using khroma::scale_fill_muted")

#
install.packages('tvthemes')
library(tvthemes)

# tvthemes 팔레트 사용 예제 - Steven Universe 팔레트
df <- data.frame(
  category = rep(c("A", "B", "C"), each = 2),
  value = c(3, 5, 2, 8, 6, 4),
  group = rep(c("G1", "G2"), 3)
)

# ggplot2와 tvthemes 팔레트를 사용한 시각화
ggplot(df, aes(x = category, y = value, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_stevenuniverse() +  # tvthemes Steven Universe 팔레트 사용
  theme_minimal() +
  labs(title = "TVThemes Palette Example", subtitle = "Using tvthemes::stevenuniverse")

#24 nord ----
library(nord)
nord::nord_palettes
nord::nord_show_palette('afternoon_prarie')








  



