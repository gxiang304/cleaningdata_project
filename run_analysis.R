setwd("/Users/xianggao/GaoX/Edx/cleaning_data/exercise/UCI_HAR_Dataset/")
feature<-read.table("features.txt",stringsAsFactor=FALSE, head=FALSE, sep=" ")
feature$V2<-gsub("\\(\\)","",feature$V2)
feature$V2<-gsub(",","-",feature$V2)
varname<-feature$V2
ytrain<-read.table("train/y_train.txt",head=FALSE)
ytest<-read.table("test/y_test.txt",head=FALSE)
subtrain<-read.table("train/subject_train.txt",head=FALSE)
subtest<-read.table("test/subject_test.txt",head=FALSE)
trainraw<-read.table("train/X_train.txt")
testraw<-read.table("test/X_test.txt")
raw<-rbind(trainraw,testraw)
y<-rbind(ytrain,ytest)
subject<-rbind(subtrain,subtest)
rawdata<-cbind(y,subject,raw)
names(rawdata)<-c("activity","subject",feature[,2])
rawdata$activity<-as.factor(rawdata$activity)
levels(rawdata$activity)<-c("walk","walkup","walkdown","sit","stand","lay")
s2out<-rawdata[,grep("(-mean|-std)",names(rawdata))]
tbl1<-cbind(rawdata$activity,rawdata$subject,s2out)
names(tbl1)[1]<-"activity"
names(tbl1)[2]<-"subject"
tbl1order<-tbl1[order(tbl1$activity,tbl1$subject),]
library(plyr)
tbl2<-ddply(tbl1order,.(activity,subject),colwise(mean))
names(tbl2)<-gsub("mean","Mean",names(tbl2))
names(tbl2)<-gsub("std","Std",names(tbl2))
write.table(tbl2,file="s5out.txt",sep=" ",row.names=FALSE)
