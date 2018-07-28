dirTRAB <- c("C:/Users/Victor/R project/datasciencecoursera/r-programming/week2/specdata")

complete <- function(directory, id = 1:332){
    # set directory
    old_dir <- getwd()
    setwd(directory)
    
    #file filter to ".csv"
    dir_files <- as.character(dir())
    all_csv <- dir_files[grep(".csv",dir_files)]
    
    #nobs vector storage
    nobs_vec <- c()
    
    #file iteration
    for (i in id){
        
        #case filter
        file_round <- read.csv(all_csv[i])
        c_case <- complete.cases(file_round)
        
        #numeric coersion and sum
        nc_case <- (as.numeric(c_case))
        round_nobs <- (sum(nc_case))
        
        #append on vect
        nobs_vec <- c(nobs_vec, round_nobs)

    }
    #data frame creation and output
    data_result <- data.frame(id = id, nobs= nobs_vec)
    #print(data_result)
    
    setwd(old_dir)
    return(data_result)
    
}

#test - please change directory
