corr <- function(directory, threshold = 0) {
        files_full <- list.files("~/Desktop/datascience/specdata/", full.names = TRUE)
        dat <- vector(mode = "numeric", length = 0)
        
        for (i in 1:length(files_full)) {
                monitor_i <- read.csv(files_full[i])
                csum <- sum((!is.na(monitor_i$sulfate)) & (!is.na(monitor_i$nitrate)))
                if (csum > threshold) {
                        data_frame <- monitor_i[which(!is.na(monitor_i$sulfate)), ]
                        submonitor_i <- data_frame[which(!is.na(data_frame$nitrate)), ]
                        dat <- c(dat, cor(submonitor_i$sulfate, submonitor_i$nitrate))
                }
        }
        
        dat
}
