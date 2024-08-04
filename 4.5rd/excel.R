#24-0804 sun 10:54

# excel

#install.packages('readxl')
library(readxl)
#install.packages('writexl')
#library(writexl)

smiths |> write_xlsx('./season_3/4.5th/smiths.xlsx')
band_members
band_instruments