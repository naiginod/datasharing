traintest <- function(){
        library(dplyr)
        
        train <- read.table("./train/X_train.txt")
        test <- read.table("./test/X_test.txt")
        features <- read.table("./features.txt")
        ytest <- read.table("./test/y_test.txt")
        ytrain <- read.table("./train/y_train.txt")
        subtest <- read.table("./test/subject_test.txt")
        subtrain <- read.table("./train/subject_train.txt")
        
        ytest$V1[ytest$V1==1] <- "WALKING"
        ytest$V1[ytest$V1==2] <- "WALKING_UPSTAIRS"
        ytest$V1[ytest$V1==3] <- "WALKING_DOWNSTAIRS"
        ytest$V1[ytest$V1==4] <- "SITTING"
        ytest$V1[ytest$V1==5] <- "STANDING"
        ytest$V1[ytest$V1==6] <- "LAYING"
        ytrain$V1[ytrain$V1==1] <- "WALKING"
        ytrain$V1[ytrain$V1==2] <- "WALKING_UPSTAIRS"
        ytrain$V1[ytrain$V1==3] <- "WALKING_DOWNSTAIRS"
        ytrain$V1[ytrain$V1==4] <- "SITTING"
        ytrain$V1[ytrain$V1==5] <- "STANDING"
        ytrain$V1[ytrain$V1==6] <- "LAYING"
        activity <- rbind_list(ytrain,ytest)
        names(activity) <- "Activity"
        sub_combo <- rbind_list(subtrain,subtest)
        names(sub_combo) <- "Subject"
        
        act_combo <- rbind_list(train,test)
        names(act_combo) <- features[,2]
        
        combo1 <- cbind(sub_combo,activity,act_combo)
        
        mydf <- combo1[ , !grepl( "meanFreq()", names(combo1) ) ]
        mydf <- mydf[, grepl("mean()|std()|Activity|Subject", names(mydf))]
        
        by_subject <- group_by(mydf, Subject, Activity) 
        final_df <-  summarise_each(by_subject, funs(mean))
        final <- as.data.frame(final_df)
        
        print(final)
}