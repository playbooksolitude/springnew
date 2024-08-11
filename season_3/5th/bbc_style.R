#24-0808 thus
# theme templete

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

#1 bbc_style ----
bbc_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "black"),
      plot.title = element_text(size = 20, face = "bold", margin = margin(b = 10)),
      plot.subtitle = element_text(size = 16, margin = margin(b = 15)),
      plot.caption = element_text(size = 12, margin = margin(t = 15)),
      axis.title = element_text(size = 14),
      axis.text = element_text(size = 12),
      axis.ticks = element_blank(),
      panel.grid.major = element_line(color = "grey80"),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      strip.background = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12),
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}

#2 dark_style ----
dark_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "white"),
      plot.background = element_rect(fill = "black", color = "black"),
      panel.background = element_rect(fill = "black", color = "black"),
      panel.grid.major = element_line(color = "grey30"),
      panel.grid.minor = element_blank(),
      plot.title = element_text(size = 20, face = "bold", color = "white", margin = margin(b = 10)),
      plot.subtitle = element_text(size = 16, color = "white", margin = margin(b = 15)),
      plot.caption = element_text(size = 12, color = "white", margin = margin(t = 15)),
      axis.title = element_text(size = 14, color = "white"),
      axis.text = element_text(size = 12, color = "white"),
      axis.ticks = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12, color = "white"),
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}
q + dark_style()

#3 minimal_style ----
minimal_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "black"),
      plot.title = element_text(size = 20, face = "bold", margin = margin(b = 10)),
      plot.subtitle = element_text(size = 16, margin = margin(b = 15)),
      plot.caption = element_text(size = 12, margin = margin(t = 15)),
      axis.title = element_text(size = 14),
      axis.text = element_text(size = 12),
      axis.ticks = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      strip.background = element_blank(),
      legend.position = "none",
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}
p + minimal_style()
q + minimal_style()

#4 cnn_style ----
cnn_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "black"),
      plot.title = element_text(size = 22, face = "bold", margin = margin(b = 10), color = "#CC0000"),
      plot.subtitle = element_text(size = 18, margin = margin(b = 15), color = "#555555"),
      plot.caption = element_text(size = 12, margin = margin(t = 15), color = "#999999"),
      axis.title = element_text(size = 14, face = "bold"),
      axis.text = element_text(size = 12),
      axis.ticks = element_blank(),
      panel.grid.major = element_line(color = "grey80"),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      strip.background = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12),
      plot.margin = unit(c(1, 1, 1, 1), "cm"),
      plot.background = element_rect(fill = "white", color = NA),
      panel.border = element_blank()
    )
}
q + cnn_style()

#5 nytimes_style ----
nytimes_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "black"),
      plot.title = element_text(size = 20, face = "bold", margin = margin(b = 10), color = "#333333"),
      plot.subtitle = element_text(size = 16, margin = margin(b = 15), color = "#555555"),
      plot.caption = element_text(size = 12, margin = margin(t = 15), color = "#777777"),
      axis.title = element_text(size = 14, face = "bold", color = "#333333"),
      axis.text = element_text(size = 12, color = "#333333"),
      axis.ticks = element_blank(),
      panel.grid.major = element_line(color = "grey80"),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      strip.background = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12, color = "#333333"),
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}
p + nytimes_style()
q + nytimes_style()

#6 guardian_style ----
guardian_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "black"),
      plot.title = element_text(size = 20, face = "bold", margin = margin(b = 10), color = "#005689"),
      plot.subtitle = element_text(size = 16, margin = margin(b = 15), color = "#555555"),
      plot.caption = element_text(size = 12, margin = margin(t = 15), color = "#777777"),
      axis.title = element_text(size = 14, face = "bold", color = "#005689"),
      axis.text = element_text(size = 12, color = "#005689"),
      axis.ticks = element_blank(),
      panel.grid.major = element_line(color = "grey80"),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      strip.background = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12, color = "#005689"),
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}
p + guardian_style()
q + guardian_style()

#7 washingtonpost_style ----
washingtonpost_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "black"),
      plot.title = element_text(size = 20, face = "bold", margin = margin(b = 10), color = "#2A2A2A"),
      plot.subtitle = element_text(size = 16, margin = margin(b = 15), color = "#5A5A5A"),
      plot.caption = element_text(size = 12, margin = margin(t = 15), color = "#7A7A7A"),
      axis.title = element_text(size = 14, face = "bold", color = "#2A2A2A"),
      axis.text = element_text(size = 12, color = "#2A2A2A"),
      axis.ticks = element_blank(),
      panel.grid.major = element_line(color = "grey80"),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      strip.background = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12, color = "#2A2A2A"),
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}
p + washingtonpost_style()
q + washingtonpost_style()

#8 wsj_style ----
wsj_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "black"),
      plot.title = element_text(size = 20, face = "bold", margin = margin(b = 10), color = "#004B91"),
      plot.subtitle = element_text(size = 16, margin = margin(b = 15), color = "#4B4B4B"),
      plot.caption = element_text(size = 12, margin = margin(t = 15), color = "#7B7B7B"),
      axis.title = element_text(size = 14, face = "bold", color = "#004B91"),
      axis.text = element_text(size = 12, color = "#004B91"),
      axis.ticks = element_blank(),
      panel.grid.major = element_line(color = "grey80"),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      strip.background = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12, color = "#004B91"),
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}
p + wsj_style()
q + wsj_style()

#9 bloomberg_style ----
bloomberg_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "black"),
      plot.title = element_text(size = 20, face = "bold", margin = margin(b = 10), color = "#1F77B4"),
      plot.subtitle = element_text(size = 16, margin = margin(b = 15), color = "#555555"),
      plot.caption = element_text(size = 12, margin = margin(t = 15), color = "#777777"),
      axis.title = element_text(size = 14, face = "bold", color = "#1F77B4"),
      axis.text = element_text(size = 12, color = "#1F77B4"),
      axis.ticks = element_blank(),
      panel.grid.major = element_line(color = "grey80"),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      strip.background = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12, color = "#1F77B4"),
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}
p + bloomberg_style()
q + bloomberg_style()

#10 dark_time_style ----
dark_time_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "white"),
      plot.title = element_text(size = 22, face = "bold", margin = margin(b = 10), color = "#E2001A"),
      plot.subtitle = element_text(size = 18, margin = margin(b = 15), color = "#CCCCCC"),
      plot.caption = element_text(size = 12, margin = margin(t = 15), color = "#AAAAAA"),
      axis.title = element_text(size = 14, face = "bold", color = "#E2001A"),
      axis.text = element_text(size = 12, color = "#E2001A"),
      axis.ticks = element_blank(),
      panel.grid.major = element_line(color = "grey50"),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = "black", color = NA),
      plot.background = element_rect(fill = "black", color = NA),
      strip.background = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12, color = "#E2001A"),
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}
p + dark_time_style()
q + dark_time_style()

#11 chanel_style ----
chanel_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "white"),
      plot.title = element_text(size = 22, face = "bold", margin = margin(b = 10), color = "#FFD700"),  # 골드 색상
      plot.subtitle = element_text(size = 18, margin = margin(b = 15), color = "#CCCCCC"),
      plot.caption = element_text(size = 12, margin = margin(t = 15), color = "#999999"),
      axis.title = element_text(size = 14, face = "bold", color = "#FFD700"),  # 골드 색상
      axis.text = element_text(size = 12, color = "#FFD700"),  # 골드 색상
      axis.ticks = element_blank(),
      panel.grid.major = element_line(color = "grey50"),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = "black", color = NA),
      plot.background = element_rect(fill = "black", color = NA),
      strip.background = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12, color = "#FFD700"),  # 골드 색상
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}
p + chanel_style()
q + chanel_style()

#12 gucci_style----
gucci_style <- function() {
    theme_minimal(base_size = 15) +
      theme(
        text = element_text(color = "white"),
        plot.title = element_text(size = 22, face = "bold", margin = margin(b = 10), color = "#FF0000"),  # 빨강
        plot.subtitle = element_text(size = 18, margin = margin(b = 15), color = "#00A74A"),  # 녹색
        plot.caption = element_text(size = 12, margin = margin(t = 15), color = "#FFD700"),  # 금색
        axis.title = element_text(size = 14, face = "bold", color = "#FF0000"),  # 빨강
        axis.text = element_text(size = 12, color = "#FFD700"),  # 금색
        axis.ticks = element_blank(),
        panel.grid.major = element_line(color = "grey50"),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "black", color = NA),
        plot.background = element_rect(fill = "black", color = NA),
        strip.background = element_blank(),
        legend.position = "top",
        legend.title = element_blank(),
        legend.text = element_text(size = 12, color = "#FFD700"),  # 금색
        plot.margin = unit(c(1, 1, 1, 1), "cm")
      )
  }
p + gucci_style()
q + gucci_style()

#13 louisvuitton_style ----
louisvuitton_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "white"),
      plot.title = element_text(size = 22, face = "bold", margin = margin(b = 10), color = "#D4AF37"),  # 금색
      plot.subtitle = element_text(size = 18, margin = margin(b = 15), color = "#8B4513"),  # 갈색
      plot.caption = element_text(size = 12, margin = margin(t = 15), color = "#FFD700"),  # 금색
      axis.title = element_text(size = 14, face = "bold", color = "#D4AF37"),  # 금색
      axis.text = element_text(size = 12, color = "#D4AF37"),  # 금색
      axis.ticks = element_blank(),
      panel.grid.major = element_line(color = "grey50"),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = "black", color = NA),
      plot.background = element_rect(fill = "black", color = NA),
      strip.background = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12, color = "#D4AF37"),  # 금색
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}
p + louisvuitton_style()
q + louisvuitton_style()

#14 prada_style ----
prada_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "white"),
      plot.title = element_text(size = 22, face = "bold", margin = margin(b = 10), color = "white"),  # 흰색
      plot.subtitle = element_text(size = 18, margin = margin(b = 15), color = "#CCCCCC"),  # 연한 회색
      plot.caption = element_text(size = 12, margin = margin(t = 15), color = "#999999"),  # 중간 회색
      axis.title = element_text(size = 14, face = "bold", color = "white"),  # 흰색
      axis.text = element_text(size = 12, color = "#CCCCCC"),  # 연한 회색
      axis.ticks = element_blank(),
      panel.grid.major = element_line(color = "grey50"),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = "black", color = NA),
      plot.background = element_rect(fill = "black", color = NA),
      strip.background = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12, color = "white"),  # 흰색
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}
p + prada_style()
q + prada_style()

#15 dior_style ----
dior_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "black"),
      plot.title = element_text(size = 22, face = "bold", margin = margin(b = 10), color = "black"),
      plot.subtitle = element_text(size = 18, margin = margin(b = 15), color = "#777777"),  # 회색
      plot.caption = element_text(size = 12, margin = margin(t = 15), color = "#555555"),  # 다크 회색
      axis.title = element_text(size = 14, face = "bold", color = "black"),
      axis.text = element_text(size = 12, color = "#777777"),  # 회색
      axis.ticks = element_blank(),
      panel.grid.major = element_line(color = "grey70"),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA),
      strip.background = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12, color = "black"),
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}

p + dior_style()
q + dior_style()

#16 nike_style ----
nike_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "white"),
      plot.title = element_text(size = 22, face = "bold", margin = margin(b = 10), color = "#FF3B30"),  # 오렌지
      plot.subtitle = element_text(size = 18, margin = margin(b = 15), color = "#CCCCCC"),  # 연한 회색
      plot.caption = element_text(size = 12, margin = margin(t = 15), color = "#999999"),  # 중간 회색
      axis.title = element_text(size = 14, face = "bold", color = "#FF3B30"),  # 오렌지
      axis.text = element_text(size = 12, color = "#FF3B30"),  # 오렌지
      axis.ticks = element_blank(),
      panel.grid.major = element_line(color = "grey50"),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = "black", color = NA),
      plot.background = element_rect(fill = "black", color = NA),
      strip.background = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12, color = "#FF3B30"),  # 오렌지
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}
p + nike_style()
q + nike_style()

#17 hermes_style ----
hermes_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "black"),
      plot.title = element_text(size = 22, face = "bold", margin = margin(b = 10), color = "#E65E00"),  # 주황색
      plot.subtitle = element_text(size = 18, margin = margin(b = 15), color = "#555555"),  # 다크 회색
      plot.caption = element_text(size = 12, margin = margin(t = 15), color = "#777777"),  # 중간 회색
      axis.title = element_text(size = 14, face = "bold", color = "#E65E00"),  # 주황색
      axis.text = element_text(size = 12, color = "#E65E00"),  # 주황색
      axis.ticks = element_blank(),
      panel.grid.major = element_line(color = "grey80"),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = "white", color = NA),
      plot.background = element_rect(fill = "white", color = NA),
      strip.background = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12, color = "#E65E00"),  # 주황색
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}
p + hermes_style()
q + hermes_style()

#18 iron_man_style ----
iron_man_style <- function() {
  theme_minimal(base_size = 15) +
    theme(
      text = element_text(color = "white"),
      plot.title = element_text(size = 22, face = "bold", margin = margin(b = 10), color = "#FF0000"),  # 빨강
      plot.subtitle = element_text(size = 18, margin = margin(b = 15), color = "#FFD700"),  # 금색
      plot.caption = element_text(size = 12, margin = margin(t = 15), color = "#FFD700"),  # 금색
      axis.title = element_text(size = 14, face = "bold", color = "#FFD700"),  # 금색
      axis.text = element_text(size = 12, color = "#FFD700"),  # 금색
      axis.ticks = element_blank(),
      panel.grid.major = element_line(color = "grey50"),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = "black", color = NA),
      plot.background = element_rect(fill = "black", color = NA),
      strip.background = element_blank(),
      legend.position = "top",
      legend.title = element_blank(),
      legend.text = element_text(size = 12, color = "#FFD700"),  # 금색
      plot.margin = unit(c(1, 1, 1, 1), "cm")
    )
}
p + iron_man_style()
q + iron_man_style()

