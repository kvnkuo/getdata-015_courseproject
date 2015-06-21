# run_analysis
# load required library
library(plyr)

# prepare column classes for reading raw data
num = rep("numeric", 561)

# Read test data
test_raw = read.table("test/X_test.txt", header = FALSE, colClasses = num)

# Read subject for test data
test_subject = read.table("test/subject_test.txt")
names(test_subject) <- "subject"

# Read activity label for test data
test_act_label = read.table("test/y_test.txt")
names(test_act_label) <- "act_label"

# Read train data
train_raw = read.table("train/X_train.txt", header = FALSE, colClasses = num)

# Read subject for train data
train_subject = read.table("train/subject_train.txt")
names(train_subject) <- "subject"

# Read activity label for train data
train_act_label = read.table("train/y_train.txt")
names(train_act_label) <- "act_label"

# Merge test data and train data(including their corresponding subjects and activity labels)
all_raw = rbind(
    cbind(test_raw, test_subject, test_act_label),
    cbind(train_raw, train_subject, train_act_label)
)

# read activity_labels.txt
act_labels = read.table("activity_labels.txt", stringsAsFactors=FALSE)

# read features.txt
features = read.table("features.txt", stringsAsFactors=FALSE)

# prepare featrures to be extracted(contains mean() or std())
features_to_extract = features[grep("mean\\(\\)|std\\(\\)", features$V2),]
features_to_extract$V1 = paste0("V",features_to_extract$V1)
features_to_extract2 = rbind(
    features_to_extract, 
    c("subject", "subject"),
    c("act_label","act_label")
)

# trim the original data to only what we want
all_trim = all_raw[,features_to_extract2$V1]

# Give the trimmed data column names
colnames(all_trim) <- features_to_extract2$V2

flag = FALSE

# initialize the target dataset
target_ds = features_to_extract2;

# loop each variable to summarize data
for(idx in features_to_extract$V2) {
    # sum each variables by subject and activity label
    t = ddply(all_trim, .(subject, act_label), summarize, avg = mean(get(idx)))
    
    # assign column name to result
    colnames(t)[3] <- idx
    
    if(!flag)
    {
        # for the first ddply result, assign it to target_set 
        target_ds = t;
    }
    else
    {
        # append(by join) the folloing ddply result to first one
        target_ds = join(target_ds, t, by=c('subject','act_label'))
    }
    
    flag = TRUE
}

#write the target dataset
write.table(target_ds, "myTidyData.txt", row.name=FALSE)

