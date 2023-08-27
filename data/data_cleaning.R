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


data_cleaned <- data #|> 
  # Reinige alle Spaltennamen mit clean_names des Pakets janitor
  
  # Schreibe die Spalte `subject_id` in `id` um
  
  # Filtere alle Reihen aus dem Datensatz, bei denen die Spalte 
  #  `music_training` nicht 1 oder 2 ist
  
  # Selektiere die Spalten subject_id, age, gender, music_training,
  #     anxiety, sheet_music, lag_task1, pc_final_task1, pc_baseline_task1
  
  # Entferne Reihe 46 aus dem Datensatz
  # Zu vielen fehlende Werte
  
  # Kodiere die Variablen music_training und sheet_music mit 'case_when' um:
  #   music_training: 1 -> piano, 2 -> other_instrument
  #   sheet_music: 1 -> can_read, 2 -> cannot_read

  # Berechne eine neue Variable pc_difference, die anzeigt, wie sich der 
  #   Anteil der richtigen Aufgaben vom ersten bis zum letzten Test verändert 



# Datenexport -------------------------------------------------------------
