ceosalary

#Inspect Data
head(ceosalary)
tail(ceosalary)
sum(is.na(ceosalary))
ceosalary[!complete.cases(ceosalary),]
colSums(is.na(ceosalary))

#replace null values
ceosalary2 <- ceosalary
ceosalary2$Five.Year.Comp[is.na(ceosalary2$Five.Year.Comp)] <- mean(ceosalary2$Five.Year.Comp, na.rm = TRUE)
ceosalary2$Efficiency[is.na(ceosalary2$Efficiency)] <- mean(ceosalary2$Efficiency, na.rm = TRUE)

colSums(is.na(ceosalary2))
ceosalary2

x <- ceosalary2 < 0
x
colSums(isTRUE(x))

#Histogram
hist(ceosalary2$Age,
     xlab = "Age",
     main = "Age Distribution of CEO",
     breaks = sqrt(nrow(ceosalary2))
)

boxplot(ceosalary2$Compensation,
        ylab = "Salary",
        main = "Salary Range of CEO in the Ranking"
)
mtext(paste("Outliers: ", paste(out, collapse = ", ")))

#bar plot
ceosalary2 %>% arrange(desc(Compensation)) %>% slice(1:10) %>% 
  ggplot(.,mapping = aes(x=reorder(Company,-Compensation),y=Compensation,fill=Compensation))+
  geom_bar(stat="identity") + labs(x="Company")

#pie chart
ceosalary2 %>% arrange(desc(Compensation)) %>% slice(1:10) %>% 
  ggplot(data, mapping= aes(x="", y=Efficiency, fill=Company)) +
  geom_bar(stat="identity", width=1, color="white") +
  geom_text(aes(label=Compensation),
              position = position_stack(vjust = 0.5))+
  coord_polar("y", start=0)

#stem
stem(ceosalary2$Compensation, scale=1)

#chisquare
test2 <- table(ceosalary2$Compensation, ceosalary2$Efficiency)
test2
chisq.test(test2, correct=FALSE)

#create table
table1 <- data.frame(Data_Type = c("Nominal","Ordinal","Ratio"), Variable = c("Name, Company","Rank","Compensation, Five.Year.Comp, Shares.Owned.mil, Age, Efficiency"))
table1
