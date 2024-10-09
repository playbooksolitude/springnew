# 24-0824 sat 09:46 

# dataset 조회
data()
mtcars

# table
table(mtcars$cyl) -> mtcars_cyl
mtcars_cyl

#
barplot(mtcars_cyl)

# barplot blue color
barplot(mtcars_cyl, main = "cyl of mtcars", 
        xlab = "Number of Cyl",
        ylab = "Frequency",
        col = "blue")
  
#
barplot(mtcars_cyl, 
        main = "cyl of mtcars", 
        xlab = "Number of Cyl",
        ylab = "Frequency",
        col = "skyblue")


