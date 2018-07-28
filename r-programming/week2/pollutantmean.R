
pollutantmean <- function(directory, pollutant, id=1:332){
    # set directory
    old_dir <- getwd()
    setwd(directory)

    
    #vec to storage pollutant data
    mean_vec <- c()
    
    #file filter
    dir_files <- as.character(dir())
    all_csv <- dir_files[grep(".csv",dir_files)]

    #file iteration
    for (i in id){

        file_round <- read.csv(all_csv[i])
        
        #removing na cases
        bad <- is.na(file_round[,pollutant])
        no_na_case <- file_round [!bad, pollutant]
        
        #acumulation vector
        mean_vec <- c(mean_vec, no_na_case)
        
        
    }
    
    #mean calculation and return
    final <- mean(mean_vec)
    return(final)
    
    #settin old dir
    setwd(old_dir)
    
}


##test - please change directory

dirTRAB <- c("C:/Users/.../datasciencecoursera/r-programming/week2/specdata")
print (pollutantmean(dirTRAB, pollutant = "sulfate" , id = 1:10))
print (pollutantmean(dirTRAB, pollutant = "nitrate" , id = 70:72))
print (pollutantmean(dirTRAB, pollutant = "nitrate" , id = 23))
