# 1. Paket-Umgebung laden
devtools::load_all()

# 2. Benötigte Bibliotheken für den Test-Plot
library(ggplot2)

# 3. Test-Daten erstellen (Beispiel aus der Wissenschaft)
test_plot <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "steelblue") +
  labs(
    title = "Test SVG Export",
    caption = "Saved via ggplot2_svg()"
  ) +
  theme_publication()

# 4. Funktion testen (Variante A: Standardpfad nutzen)
# Erstellt automatisch den Ordner 'results' und die Datei 'plot.svg'
ggplot2_svg(plot = test_plot)

# 5 testweise speichern
# Teste die Funktion in einem Verzeichnis, das nicht synchronisiert wird
temp_target <- file.path(tempdir(), "test_plot.svg")
ggplot2_svg(path = temp_target, plot = test_plot)

# Prüfen, ob die Datei da ist
file.exists(temp_target)
# utils::browseURL(temp_target) # see in browser
# rstudioapi::viewer(temp_target) # see in r viewer


# 6 Löschen
# kein Problem, da OneDrive nicht zugreift
unlink(dirname(temp_target), recursive = TRUE)
# Ende des Tests

library(ggplot2)

# 1. Create a test plot
p <- ggplot(mtcars, aes(mpg, wt)) + geom_point()

# 2. Save to a temporary file
temp_path <- file.path(tempdir(), "test_plot.svg")
ggplot2_svg(path = temp_path, plot = p)

# 3. Show the file exists and open it to see the result
if (file.exists(temp_path)) {
  message("SVG successfully saved to: ", temp_path)
  # This will open the SVG in your default browser or viewer:
  utils::browseURL(temp_path)
}
