install.packages("tidyverse")
library(tidyverse)

# Relationship between Job Grade and Racial Group

Jobgrade_Race <- select(General_Workforce_Data_v1, "Job Grade", "Racial Group")
Jobgrade_Race <- na.omit(Jobgrade_Race)

ggplot(data=Jobgrade_Race) + 
  geom_bar(mapping=aes(x = Jobgrade_Race$"Job Grade",fill= Jobgrade_Race$"Racial Group"), width=0.5) +
  labs(x= "Job Grade", y = "Number of Employees", fill = "Race") +
  ggtitle("Distribution of Job Grades across Racial Groups")

# Relationship between Job Grade and Gender
  
Gender_Jobgrade <- select(General_Workforce_Data_v1, "Gender", "Job Grade")
Gender_Jobgrade <- na.omit(Gender_Jobgrade)

ggplot(data=Gender_Jobgrade) + 
  geom_bar(mapping=aes(x = Gender_Jobgrade$"Job Grade",fill= Gender_Jobgrade$"Gender"), width=0.5) +
  labs(x= "Job Grade", y = "Number of Employees", fill = "Gender") +
  ggtitle("Distribution of Job Grades across Gender")
