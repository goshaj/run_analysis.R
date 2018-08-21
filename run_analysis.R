train.x <- read.table("./data/train_x.txt")
test.x <- read.table("./data/test_x.txt")
train.y <- read.table("./data/train_y.txt")
test.y <- read.table("./data/test_y.txt")
subject_train <- read.table("./data/subject_train.txt")
subject_test <- read.table("./datasubject_test.txt")
activity_lables <- read.table("./data/activity_labels.txt")
features <- read.table("./data/features.txt")

# Step 1 - Merge

data.x<-rbind(train.x,test.x)

# Step 2 - Extract means and st.dev.
colnames(data.x) <- c(as.character(features[,2]))

Mean<-grep("mean()",colnames(data.x),fixed=TRUE)

SD<-grep("std()",colnames(data.x),fixed=TRUE)

MeanSD<-data.x[,c(Mean,SD)]

# Step 3 - Names

data.y<-rbind(train.y,test.y)

data.activity<-cbind(data.y,MeanSD)

colnames(data.activity)[1] <- "Activity"

# Step 4 - Labels
activity_lables[,2]<-as.character(activity_lables[,2])

for(i in 1:length(data.activity[,1])){
  data.activity[i,1]<-activity_lables[data.activity[i,1],2]
}

# Step 5 - Tidy Dataset

subject_data<-rbind(subject_train,subject_test)

data<-cbind(subject_data,data.activity)

colnames(data)[1] <- "Subject"

Tidy <- aggregate( data[,3] ~ Subject+Activity, data = data, FUN= "mean" )

for(i in 4:ncol(data)){
  Tidy[,i] <- aggregate( data[,i] ~ Subject+Activity, data = data, FUN= "mean" )[,3]
}

colnames(Tidy)[3:ncol(Tidy)] <- colnames(MeanSD)

write.table(Tidy, file = "data_final.txt")
