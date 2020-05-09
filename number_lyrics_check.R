# Load last update date
source("extract_saturdays.R")

# Load most-updated lyrics data files
available_lyrics <- read_csv(paste0("data/BH100lyrics(", last_update,").csv"))
missing_lyrics <- read_csv(paste0("data/BH100missing(", last_update,").csv"))
total_tracks <- read_csv(paste0("data/BH100songs(", last_update,").csv"))

available_lyrics <- available_lyrics %>% 
  group_by(artist_track) %>% 
  summarise()

number_available_lyrics <- length(unique(available_lyrics$artist_track))

missing_lyrics <- missing_lyrics %>% 
  group_by(artist_track) %>% 
  summarise()

number_missing_lyrics <- length(unique(missing_lyrics$artist_track))

total_tracks <- total_tracks %>% 
  group_by(artist_track) %>% 
  summarise()

number_total_tracks <- length(unique(total_tracks$artist_track))


# Final check if sum of available tracks and missing ones equals initial number of tracks
if (all.equal(number_available_lyrics + number_missing_lyrics, number_total_tracks) == TRUE) {
  print("No missing tracks")
}

