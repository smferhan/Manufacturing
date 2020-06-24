library(tidyverse)
product_train <- read.csv("product_train.csv")
product_test <- read.csv("product_test.csv")
str(product_train)
str(product_test)
table(product_train$went_on_backorder)
library(ranger)
product_train %>%
  is.na() %>%
  colSums()
product_test %>%
  is.na() %>%
  colSums()
model1 <- ranger(went_on_backorder ~ ., data = product_train, num.trees = 500,
                 respect.unordered.factors = "order")
model1
prediction <- predict(model1, product_test)$predictions
table(prediction)
