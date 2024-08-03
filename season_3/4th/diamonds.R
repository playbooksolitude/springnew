#24-0731 wedn 14:50

#
library(tidyverse)
diamonds |> 
  ggplot(aes(x = x, y = y)) +
  geom_path()


#
mpg |> 
  ggplot(aes(x = class, fill = drv)) +
  geom_bar(colour = "white", position = "dodge") +
  facet_grid(drv~year, scales = "free_y") +
  coord_flip()

#
diamonds |> 
  ggplot(aes(x = x, y = y)) +
  geom_point(aes(color = cut)) +
  facet_grid(color~cut) 

# git remote set-url origin https://<playbooksolitude>:<ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINLbJka8My817vLoPGuLHDH0CJsScxsNcCle5+4BZ0MH yohanchoi@YOHANui-MacBookPro.local>@github.com/playbooksolitude/springnew.git


# git config --global user.name "playbooksolitude"
# git config --global user.email "slatopr@gmail.com"



# playbooksolitude for https://github.com
# Password for https://github.com/hyun98


