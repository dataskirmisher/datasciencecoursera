directory <- "make sure to set the path"

# set directory
old_dir <- getwd()
setwd(directory)

###step1

# TRAIN

x_train <- read.table("X_train.txt")
dim(x_train)

y_train <- read.table("y_train.txt")
dim(y_train)
table(y_train)

sub_train <- read.table("subject_train.txt")
dim(sub_train)
table(sub_train)

# TEST

x_test <- read.table("X_test.txt")
dim(x_test)

y_test <- read.table("y_test.txt")
dim(y_test)
table(y_test)

sub_test <- read.table("subject_test.txt")
dim(sub_test)
table(sub_test)

# Binding 

x_bind <- rbind(x_train,x_test)
dim(x_bind)

y_bind <- rbind(y_train,y_test)
dim(y_bind)

sub_bind <- rbind(sub_train,sub_test)
dim(sub_bind)

full_table <- cbind(sub_bind, y_bind, x_filter)
dim(full_table)

###step 2
##
features_x <- read.table("features.txt")
dim(features_x)

## aiming  mean and standard deviation
target_feature_index <- grep("mean\\(\\)|std\\(\\)", features_x[, 2])
length(target_feature_index)

x_filter <- x_bind[,target_feature_index]

#this is our table
full_table <- cbind(sub_bind, y_bind, x_filter)
dim(full_table)
names(full_table)

### Step 3 and 4

#setting names on the table:
x_names <- features_x[,2][target_feature_index]
x_names <- as.character(x_names)


names(full_table) <- c("subject","activity",x_names)

## cleaning names:
names(full_table)
# remove "()"
names(full_table) <- gsub("\\(\\)","",names(full_table))
#capitalize M
names(full_table) <- gsub("mean","Mean",names(full_table))
# capitalize S
names(full_table) <- gsub("std","Std",names(full_table))
# remove "-" in column names 
names(full_table) <- gsub("-","",names(full_table))
# good names:
names(full_table)

##  Label
act <- read.table("activity_labels.txt")
act[,2] <- tolower(act[,2])
act[,2] <- gsub("_","", (act[,2]))

# using gsub+regex to paste the label 
for(i in 1:6){
    full_table[,2] <- i %>%  gsub(act[i,2], full_table[,2])
}

#write out the tidy full_table
write.table(full_table,"tidy_data.txt")


## ---
means_table <- group_by(full_table,Subject,Activity)
means_table <- means_table %>%  summarise_at(-(1:2),"mean")

#write out the data set with the average of each variable
write.table(means_table,"means_data.txt")


#settin old dir
setwd(old_dir)
