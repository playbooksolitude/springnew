#24-0816 fri 22:35

#ggradar() #nord()


#
library(nord)
library(colorspace)
mtcars |> 
  rownames_to_column('cars') |> 
  mutate_at(vars(-cars),scales::rescale) |> 
  tail(2) |> 
  ggradar::ggradar() +
  #scale_color_nord(palette = 'frost') +
  scale_color_discrete_qualitative(palette = 'Dark 2')

nord_palettes

#
library(colorspace)
colorspace::hcl_palettes(plot = T)


#
mpg |> 
  group_by(drv) |> 
  reframe(cty = mean(cty),
          hwy = mean(hwy),
          displ = mean(displ),
          cyl = mean(cyl),
          year = mean(year)) |> 
  mutate_at(vars(-drv),scales::rescale) |> 
  ggradar::ggradar(group.point.size = 4) +
  scale_color_discrete_qualitative(palette = 'Dark 3')