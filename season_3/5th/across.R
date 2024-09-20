#24-0807 wedn 09:50
# across

# 
library(tidyverse)

# character 자료형을 factor()로 변경
mpg |> 
  mutate(across(c(drv, fl), factor))

#
#
starwars |> 
  mutate(across(c(hair_color, skin_color, eye_color, sex, gender), 
                factor))

# 데이터 프레임 예시
(df <- tibble(
  var1 = c("a", "b", "c", "a"),
  var2 = c("x", "y", "z", "x"),
  var3 = c(1, 2, 3, 1)))

str(df)

# across()를 사용하여 여러 열을 factor로 변환
df %>%
  mutate(across(c(var1, var2), factor)) |> 
  str()

#
df |> 
  mutate(across(c(var1, var2), factor))

#
mtcars |> 
  rownames_to_column('cars') |> 
  mutate_at(vars(-cars), scales::rescale) |> 
  tail(2) |> 
  ggradar()

#
(df_1 <- tibble(
  group = c("A", "A", "B", "B"),
  var1 = c(1, 2, 3, 4),
  var2 = c(5, 6, 7, 8)))

# across()를 사용하여 여러 열의 합계를 계산
(summary_df <- df_1 %>%
  group_by(group) %>%
  reframe(across(c(var1, var2), sum, na.rm = TRUE)))

#
df_1 |> 
  reframe(across(c(var1, var2), sum))

#
df_1 |> 
  group_by(group) |> 
  reframe(across(c(var1, var2),sum))
  


