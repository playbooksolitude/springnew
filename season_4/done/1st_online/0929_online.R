#24-0929 sun 20:14

# 도움말
?paste()

typeof(1:12)
paste(1:12)  #숫자형 integer
typeof(paste(1:12)) #무조건 문자형으로 바꿈  
paste("1", "월")
paste("1", "월"," & ", "2", "월")
(nth <- paste0(1:12, c("st", "nd", "rd", rep("th", 9))))

#