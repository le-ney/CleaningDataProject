#please enter the directory path using forward slash (/), 
#as it is on Linux and Mac systems
run_Analysis <- function(directory_path){
        #************merage and lable training data************
        fname <- paste(directory_path,"features.txt",sep="/")
        features <- read.table(fname,header=FALSE)
        fname <- paste(directory_path, "train/X_train.txt" ,sep="/")
        data_set <- read.table(fname, header=FALSE) # load dataset
        colnames(data_set)<-features[,2]
        col_sel <- grepl(pattern = "mean|std",features[,2])
        data_set <- data_set [,col_sel]
        fname <- paste(directory_path, "train/y_train.txt" ,sep="/")
        temp <- read.table(fname,header=FALSE) #load lable
        colnames(temp)<-c("Activity")
        data_set <- cbind(data_set,temp)
        fname <- paste(directory_path, "train/subject_train.txt" ,sep="/")
        temp <- read.table(fname,header=FALSE) # load subject
        colnames(temp)<-c("Subject")
        data_set <- cbind(data_set,temp)
        #************merage and lable test data************
        fname <- paste(directory_path, "test/X_test.txt" ,sep="/")
        test_data <- read.table(fname, header=FALSE)
        colnames(test_data)<-features[,2]
        test_data <- test_data [,col_sel]
        fname <- paste(directory_path, "test/y_test.txt" ,sep="/")
        temp <- read.table(fname,header=FALSE) #load lable
        colnames(temp)<-c("Activity")
        test_data <- cbind(test_data,temp)
        fname <- paste(directory_path, "test/subject_test.txt" ,sep="/")
        temp <- read.table(fname,header=FALSE) # load subject
        colnames(temp)<-c("Subject")
        test_data <- cbind(test_data,temp)
        #**********merage all datasets*******************
        data_set <- rbind(data_set,test_data) # the result is the complete dataset
        #**********
        fname <- paste(directory_path,"activity_labels.txt",sep="/")
        temp <- read.table(fname,header=FALSE)
        data_set$Activity <- factor(data_set$Activity,levels=temp[,1],labels=temp[,2])
        #calculating the average of each variable for each activity and each subject
        temp <- data.table(data_set)
        tidy_set<-temp[,lapply(.SD,mean),by="Activity,Subject"]
        fname <- paste(directory_path, "tidy_set.txt" ,sep="/")
        write.table(tidy_set, file=fname)
}



