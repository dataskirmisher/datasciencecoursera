dirTRAB <- c("C:/Users/.../datasciencecoursera/r-programming/week2/specdata")

corr <-function(directory, treshold = 0){
    # set directory
    old_dir <- getwd()
    setwd(directory)
    #file filter to ".csv"
    dir_files <- as.character(dir())
    all_csv <- dir_files[grep(".csv",dir_files)]
    
    #using the "complete.R" function to filter nobs by the treshold
    complete_table <- complete(directory,1:332)
    complete_nobs <- c(complete_table[[2]])
    
    # id file vector of interest (>= treshold)
    id_treshold <- c(complete_table$id[complete_nobs >= treshold])

    #set output function 
    corr_result <- c()
    
    #file iteration
    for (i in id_treshold){
        
        #case filter
        file_round <- read.csv(all_csv[i])
        comp_case <- complete.cases(file_round)
        
        #removing non-complete-cases
        complete_file <- file_round[comp_case,]
        
        #Correlation 
        corr_file <- cor(complete_file$sulfate, complete_file$nitrate)
        
        #append to output vector
        corr_result <- c(corr_result, corr_file)
    }
    
    return(corr_result)
    #settin old dir
    setwd(old_dir)
}

#test - please change directory

cr <- corr(dirTRAB, treshold = 150)
print(head(cr))
print(summary(cr))

cr <- corr(dirTRAB, treshold = 400)
print(head(cr))
print(summary(cr))
