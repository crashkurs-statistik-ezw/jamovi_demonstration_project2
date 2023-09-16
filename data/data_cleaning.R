library(tidyverse)
library(janitor)

raw_data <- read_csv("data/raw/spacing_piano_data.csv")

raw_data_cleaned <- raw_data |> 
  rename(
    id = subject_id
  ) |> 
  clean_names() |> 
  dplyr::filter(is.na(music_training)) |> 
  select(
    id, age, gender, music_training, anxiety,
    sheet_music, lag_task1, pc_final_task1, pc_baseline_task1
  ) |> 
  mutate(
    pc_difference = pc_final_task1 - pc_baseline_task1
  ) |> 
  dplyr::filter(row_number() != 46)

write_csv(raw_data_cleaned, "data/clean/data_cleaned_r.csv")

# Schreibe die Spalte subject_id in id um ✅
# 
# Ändere alle Variablennamen in snake_case ✅
# 
# Filtere alle Reihen aus dem Datensatz, bei denen die 
# Spalte music_training nicht 1 oder 2 ist ✅
# 
# Selektiere die Spalten subject_id, age, gender, 
# music_training, anxiety, sheet_music, lag_task1, 
# pc_final_task1, pc_baseline_task1 ✅
# 
# Berechne eine neue Variable pc_difference, die anzeigt,
# wie sich der. Anteil der richtigen Aufgaben vom ersten bis zum
# letzten Test verändert pc_final_task1 - pc_baseline_task1 ✅
# 
# Exportiere den Datensatz als CSV uns SAV-Datei in den Ordner “data/clean” ✅