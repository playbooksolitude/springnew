#24-0917 thues 22:48

#
if(!require(pacman))install.packages("pacman")
pacman::p_load('dplyr', 'ggplot2')

#
ggplot(data = mpg) +
  geom_point(mapping = aes(x = model, 
                           y = hwy, 
                           color = drv)) +
  coord_flip() +
  facet_wrap(.~drv) +
  scale_color_brewer(palette = "Dark2") +
  theme_minimal() +                           # 미니멀 테마를 적용
  theme(axis.text = element_text(size = 14),  # 텍스트 크기는 14,
        axis.title = element_text(color = "blue"),  # 제목의 색상은 파랑
        axis.line = element_line(color = "black"),  # 테두리 색상은 검정
        strip.text = element_text(size = 16),       # 분할 제목의 크기는 16
        strip.background = element_rect(fill = 'lightpink'), # 분할 배경은 분홍
        legend.position = 'none')                   # 범례는 지우기

#
library(ggplot2)
library(showtext)

# Google 폰트를 사용하여 뉴욕타임즈 스타일 폰트 적용
font_add_google("Playfair Display", "nyt")
showtext_auto()

# 데이터 생성
data <- data.frame(
  year = c(2018, 2019, 2020, 2021),
  value = c(100, 120, 150, 180)
)

# 뉴욕타임즈 스타일 차트 생성
ggplot(data, aes(x = year, y = value)) +
  geom_line(size = 1, color = "#004F9F") + # 뉴욕타임즈 스타일의 파란색 라인
  geom_point(size = 3, color = "#004F9F") +
  theme_minimal(base_family = "nyt") + # 뉴욕타임즈 스타일 폰트 적용
  theme(
    plot.title = element_text(size = 20, face = "bold"),
    plot.subtitle = element_text(size = 14, margin = margin(b = 10)),
    plot.caption = element_text(size = 10, margin = margin(t = 10)),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 11)
  ) +
  labs(
    title = "New York Times Style Line Chart",
    subtitle = "This is a custom ggplot2 chart styled like a NYT graphic",
    caption = "Source: Example Data"
  )
