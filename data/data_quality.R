library(assertr)



# Gereinigter Datensatz laden ---------------------------------------------
dframe <- read_csv("data/bestand/ags_liste_bw.csv") |> pull(ags)



# Data Quality Checks ausführen -------------------------------------------
dframe # |> 


