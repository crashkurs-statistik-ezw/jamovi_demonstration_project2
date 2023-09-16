library(assertr)
library(tidyverse)


# Gereinigter Datensatz laden ---------------------------------------------
data_cleaned <- read_csv("data/clean/data_cleaned_r.csv")


# Daten einsehen ----------------------------------------------------------
glimpse(data_cleaned)
view(data_cleaned)


# Data Quality Checks ausführen -------------------------------------------
data_cleaned |> 
  verify(has_only_names("id", "age", "gender", "music_training",
                        "anxiety", "sheet_music", "lag_task1",
                        "pc_final_task1", "pc_baseline_task1",
                        "pc_difference")) |> 
  assert(within_bounds(0, 90), age) |> 
  assert(within_bounds(0, 100), pc_final_task1) |> 
  assert(in_set(c(1, 2), inverse = FALSE), music_training) |> 
  assert(in_set(c(0, 1, 5, 10, 15)), lag_task1) |> 
  assert(is_uniq, id) |> 
  assert_rows(num_row_NAs, within_bounds(0, 4), everything())



# Eine bestimmte Reihe ansehen --------------------------------------------
data_cleaned[46, ]
