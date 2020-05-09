# Extracts all the Saturdays for the URLs on Billboard's webpage and file names 
# extract_tracks.Rmd, extract_lyrocs.Rmd, track_analysis.Rmd, and lyrics_analysis.Rmd source this file

# Start date
start <- as.Date("2019-01-05")

# End date
end <- as.Date(Sys.Date())

# Index for every 7 days 
every <- 6

# Function to output every Saturday in 2019 and 2020
pick.wkday <- function(every,start,end) {
  add.7 <- start + 0:6
  first.day <- add.7[as.numeric(format(add.7,"%w"))==every]
  seq.Date(first.day,end,by="week")
}

# Every Saturday in 2019 and 2020
weekly<- pick.wkday(every, start, end)
number_weeks <- length(weekly)

last_update <- tail(weekly, n=1)