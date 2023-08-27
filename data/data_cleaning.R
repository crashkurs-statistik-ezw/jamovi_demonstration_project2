library(tidyverse)
library(haven) # install.packages("haven")
library(janitor)


# Daten einlesen  ---------------------------------------------------------
# Ersetze den Namen des Datensatzes `spacing_piano_data.csv` 
# mit dem Datensatz, welchen du einlesen möchtest
data <- read_csv("data/raw/spacing_piano_data.csv")


# Daten einsehen ----------------------------------------------------------
glimpse(data)
view(data)


# Reproduzierbare Datenanalyse -------------------------------------------
# Prompt: Ich möchte, dass du mein Tidyverse Translator bist. Ich werde dir 
# eine kommentierte Liste an Datenbereinigungsschritten geben und möchte, 
# dass du diese Schritte in R-Code und Funktionen des Pakets Tidyverse 
# übersetzt. Alle Analyseschritte sollen dem Pipe-Operator |> übergeben werden. 
# Verwende nicht den Pipe-Operator %>%. Sag mir, ob du die Anleitung 
# verstanden hast, indem du mit "Ja" antwortest.


data_cleaned <- data |> 
  # Reinige alle Spaltennamen mit clean_names des Pakets janitor
  clean_names() |>
  
  # Schreibe die Spalte `subject_id` in `id` um
  rename(id = subject_id) |> 
  
  # Filtere alle Reihen aus dem Datensatz, bei denen die Spalte 
  #  `music_training` nicht 1 oder 2 ist
  dplyr::filter(!(music_training %in% c(1, 2))) |>
  
  # Selektiere die Spalten subject_id, age, gender, music_training,
  #     anxiety, sheet_music, lag_task1, pc_final_task1, pc_baseline_task1
  select(id, age, gender, music_training, anxiety, sheet_music, 
         lag_task1, pc_final_task1, pc_baseline_task1) |>
  
  # Entferne Reihe 46 aus dem Datensatz
  # Zu vielen fehlende Werte
  dplyr::filter(!(row_number() %in% c(46, 47))) |> 
  
  # Kodiere die Variablen music_training und sheet_music mit 'case_when' um:
  #   music_training: 1 -> piano, 2 -> other_instrument
  #   sheet_music: 1 -> can_read, 2 -> cannot_read
  mutate(
    music_training = case_when(
      music_training == "piano" ~ "1",
      music_training == "other_instrument" ~ "2",
      TRUE ~ as.character(music_training)  # Behalte andere Werte unverändert
    ),
    sheet_music = case_when(
      sheet_music == "can_read" ~ "1",
      sheet_music == "cannot_read" ~ "2",
      TRUE ~ as.character(sheet_music)  # Behalte andere Werte unverändert
    )
  ) |>
  
  # Berechne eine neue Variable pc_difference, die anzeigt, wie sich der 
  #   Anteil der richtigen Aufgaben vom ersten bis zum letzten Test verändert 
  mutate(pc_difference = pc_final_task1 - pc_baseline_task1)



# Datenexport -------------------------------------------------------------

write_csv(data_cleaned, "data/clean/data_cleaned.csv")
write_sav(data_cleaned, "data/clean/data_cleaned.sav")
