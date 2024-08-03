#24-0801 wedn 11:53

#
library(dplyr)
data()

# join ----
band_members
band_instruments
band_instruments2

# left_join
band_members |> 
  left_join(band_instruments, by = 'name')

# left_join * by 값이 다른 경우
band_members |> 
  left_join(band_instruments2, by = c('name' = 'artist'))

# left_join 2번
band_members |> 
  left_join(band_instruments, by = 'name') |> 
  left_join(band_instruments2, by = c('name' = 'artist'))

# full_join ----  
band_members |> 
  full_join(band_instruments)

# drop_na()
band_members |> 
  full_join(band_instruments) |> 
  drop_na(band, plays)

# replace_na()
band_members |> 
  full_join(band_instruments) |> 
  replace_na(replace = list(band = 'b', band = 'p'))

band_members |> 
  full_join(band_instruments) |> 
  replace_na(replace = list(band = 'b', plays = 'p'))

band_members |> 
  full_join(band_instruments) |> 
  replace_na(list(band = "Unknown", plays = "Unknown"))


# starwars ----
# replace_na () ----
smiths |> 
  replace_na(list(age = 44, weight = 87))


# replace_na
starwars |> 
  filter(is.na(mass))

starwars |> 
  #filter(is.na(mass))
  replace_na(list(mass = mean(starwars$mass, na.rm = T))) #|> 
filter(is.na(mass))

#
starwars |> 
  #filter(is.na(mass))
  replace_na(list(mass = mean(starwars$mass, na.rm = T))) #|> 
mean(starwars$mass, na.rm = T)