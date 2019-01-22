# IST 707
# author: Nicholas Brown
# September 25, 2018
# 


setwd("~/Desktop/IST707/hw4")
myData <- read.csv("fedPapers85.csv")

View(myData)
ncol(myData)
myData_unlabel <- myData[,c(3:72)]

# k means model
model_r <- kmeans(myData_unlabel,4)
model_r
model_r$centers

cluster_assignment <- data.frame(myData,model_r$cluster)
View(cluster_assignment)

# View kmeans cluster
library(cluster)
clusplot(myData_unlabel,model_r$cluster, color=TRUE,shade=TRUE,label=2,lines=0,main="Federalist Papers K-means")

# HAC algo
d = dist(as.matrix(myData_unlabel))
hc=hclust(d)
plot(hc)
