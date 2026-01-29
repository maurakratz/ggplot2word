# Load necessary libraries
library(ggplot2)

# Load your current package state without installing
devtools::load_all()

# Example plot to test your publication theme
test_plot <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  labs(
    title = "Testing theme_publication",
    caption = "Data: mtcars"
  ) +
  theme_publication()

# View the result
print(test_plot)
