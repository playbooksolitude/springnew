sample(1:6, 6, replace = T)
round(mean(sample(1:6, 6, replace = T)),1)
round(mean(sample(1:10, 10, replace = T)),1)
round(mean(sample(1:100, 100, replace = T)),1)
round(mean(sample(1:1000, 1000, replace = T)),1)
replicate(20,round(mean(sample(1:6, 6, replace = T)),1))

replicate(20,round(mean(sample(1:6, 6, replace = T)),1)) |> 
  barplot()

replicate(40,round(mean(sample(1:6, 6, replace = T)),1)) |> 
  barplot()

replicate(100,round(mean(sample(1:6, 6, replace = T)),1)) |> hist()
replicate(200,round(mean(sample(1:6, 6, replace = T)),1)) |> 
  hist()

replicate(500,round(mean(sample(1:6, 6, replace = T)),1)) |> 
  hist()

replicate(1000,round(mean(sample(1:6, 6, replace = T)),1)) |> 
  hist()

replicate(10000,round(mean(sample(1:6, 6, replace = T)),1)) |> 
  hist()

replicate(10000,round(mean(sample(1:6, 6, replace = T)),1)) |> 
  as.data.frame() -> temp_a

temp_a |> as.tibble() |> mutate(
  num = row_number(), .before = 1
) |> rename(mean = 2) -> temp_2

ggplot(temp_2, aes(x =mean)) +
  stat_density(adjust = 2)

?geom_density

ggplot(temp_2, aes(x =mean)) +
  geom_histogram(bins = 10)
