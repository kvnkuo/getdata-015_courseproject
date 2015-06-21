Data Dictionary

- subject: identifier of the subject who carried out the experiment
    - INTEGER
    - 1..30 (a group of 30 volunteers)

- act_label: activity label
    - INTEGER
    - 1 => WALKING
    - 2 => WALKING_UPSTAIRS
    - 3 => WALKING_DOWNSTAIRS
    - 4 => SITTING
    - 5 => STANDING
    - 6 => LAYING

- variables: The average value of each variable for each activity and each subject.
    - FLOAT
    - The followings are the variable names for each column. Please refer to file 'features_info.txt' in the original data set for their detailed explanation.    
      '-[mean()|std()]' is used to denote mean() or std() estimations.   
      '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.   
      tBodyAcc-[mean()|std()]-XYZ     
      tGravityAcc-[mean()|std()]-XYZ   
      tBodyAccJerk-[mean()|std()]-XYZ  
      tBodyGyro-[mean()|std()]-XYZ    
      tBodyGyroJerk-[mean()|std()]-XYZ   
      tBodyAccMag-[mean()|std()]      
      tGravityAccMag-[mean()|std()]    
      tBodyAccJerkMag-[mean()|std()]   
      tBodyGyroMag-[mean()|std()]     
      tBodyGyroJerkMag-[mean()|std()]   
      fBodyAcc-[mean()|std()]-XYZ     
      fBodyAccJerk-[mean()|std()]-XYZ   
      fBodyGyro-[mean()|std()]-XYZ    
      fBodyAccMag-[mean()|std()]      
      fBodyAccJerkMag-[mean()|std()]    
      fBodyGyroMag-[mean()|std()]     
      fBodyGyroJerkMag-[mean()|std()] 

 
