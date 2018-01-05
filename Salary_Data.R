# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)
regresor = lm(formula = Salary ~ YearsExperience , data = training_set)
testregressor = lm(formula = Salary ~ YearsExperience , data = test_set)
summary(testregressor)
y_pred = predict(regresor , newdata = test_set)
# install.packages('ggplot2')
library(ggplot2)
ggplot()+
  geom_point(aes(x = training_set$YearsExperience , y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience , y= predict(regresor , newdata = training_set)),
            color = 'blue')+
  ggtitle('wow')+
  xlab('YearsExoerience')+
  ylab('Salary')