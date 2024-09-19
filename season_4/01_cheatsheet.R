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
