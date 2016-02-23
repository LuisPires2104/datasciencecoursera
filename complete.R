complete <- function(directory, id = 1:332) {
        files_full <- list.files("~/Desktop/datascience/specdata", full.names = TRUE)
        dat <- data.frame()
        
        for (i in id) {
                monitor_i <- read.csv(files_full[i])
                nobs <- sum(complete.cases(monitor_i))
                data_frame <- data.frame(i, nobs)
                dat <- rbind(dat, data_frame)
        }
        
        colnames(dat) <- c("id", "nobs")
        dat
}