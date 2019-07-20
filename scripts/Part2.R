install.packages("tidyverse")
library(tidyverse)
df_2 <- read.csv("data/processed/dataframe2.csv")

# Percentage of individuals employed more than 6 months is 0.067
table(df_2$loe_morethan6months)

# Unsupervised ML
install.packages("cluster")
library(cluster)
options(scipen=999)

df_cluster_n <- df_2 %>%
  filter(!is.na(age_at_survey) & !is.na(fin_situ_change) & !is.na(grit_score))

df_unid <- df_cluster_n %>%
  select(unid)

df_cluster <- df_cluster_n %>%
  select(age_at_survey, fin_situ_change, grit_score, opt_score) %>%
  scale()

set.seed(1234)

# Hierarchical Clustering
d <- dist(df_cluster, method = "euclidean")
hc1 <- hclust(d, method = "complete")
plot(hc1, cex=0.6, hang=-1)
clusterCut <- cutree(hc1,5)
table(clusterCut)
df_cluster_h5 <- bind_cols(as.data.frame(df_cluster), as.data.frame(clusterCut))

df_cluster_h5_sum <- df_cluster_h5 %>%
  group_by(clusterCut) %>%
  summarise(age_at_survey = mean(age_at_survey),
            fin_situ_change = mean(fin_situ_change),
            grit_score = mean(grit_score),
            opt_score = mean(opt_score))

h5 <- df_cluster_h5 %>%
  select(clusterCut) %>%
  rename(h5 = clusterCut)

df_clusters_unid <- bind_cols(df_unid, h5)

df_cluster_n <- left_join(df_cluster_n, df_clusters_unid, by="unid")

# Regressions
reg1 <- lm(loe_morethan6months ~ gender, data=df_cluster_n)
summary(reg1)
reg2 <- lm(loe_morethan6months ~ anyhhincome, data=df_cluster_n)
summary(reg2)
reg3 <- lm(loe_morethan6months ~ gender*as.factor(h5), data=df_cluster_n)
summary(reg3)

# Supervised ML
install.packages("caret")
install.packages("skimr")
install.packages("RANN")

library(caret)
library(skimr)
library(RANN)

df_3 <- select(df_2, -c(X.1, X, unid, survey_date_month, survey_num, working, job_start_date, job_leave_date, financial_situation_now, financial_situation_5years, age, fin_situ_now, fin_situ_future, com_score, num_score, company_size, monthly_pay, length_of_employment, peoplelive_15plus, province, dob))
df_3 <- df_3 %>% filter(!is.na(volunteer), !is.na(leadershiprole), !is.na(peoplelive), !is.na(anygrant), !is.na(anyhhincome), !is.na(givemoney_yes))
df_3 <- mutate(df_3,
               loe_morethan6months = factor(loe_morethan6months),
               anygrant = factor(anygrant),
               anyhhincome = factor(anygrant),
               givemoney_yes = factor(anygrant),
               numchildren = as.numeric(numchildren),
               numearnincome = as.numeric(numearnincome))

preProcess_missingdata_model <- preProcess(df_3, method="knnImpute")
df_3 <- predict(preProcess_missingdata_model, newdata = df_3)

# Data Pre-processing
dummies_model <- dummyVars(loe_morethan6months ~., data=df_3)
df_3_loe_morethan6months <- df_3$loe_morethan6months
df_3_mat <- predict(dummies_model, newdata=df_3)
df_3 <- data.frame(df_3_mat)

df_3$loe_morethan6months <- df_3_loe_morethan6months

# Splitting Data
set.seed(100)
trainRowNumbers <- createDataPartition(df_3$loe_morethan6months, p=0.8, list=FALSE)
trainData <- df_3[trainRowNumbers,]
testData <- df_3[-trainRowNumbers,]

# Model and Cross Validation
install.packages("e1071")
trControl <- trainControl(method = "cv", number=10, verboseIter = TRUE)
model_rpart <- train(loe_morethan6months ~., data=trainData, method="rpart", trControl=trControl, tuneGrid=expand.grid(cp=seq(0.000,0.02,0.0025)))
predicted <- predict(model_rpart, testData[,-length(testData)])
model_rpart$results

