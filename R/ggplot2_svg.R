#' Save a ggplot2-Object as SVG-File
#'
#' A wrapper around ggsave to export plots in SVG format with dimensions
#' specified in millimeters, optimized for scientific publications.
#' It automatically creates the results-directory if it does not exist.
#'
#' @param path Character string giving the path where the file should be saved.
#'   If NULL, saves to "results/plot.svg" in the working directory.
#' @param plot Plot object to save. Defaults to last plot displayed.
#' @param width Width of the plot in mm. Default is 100.
#' @param height Height of the plot in mm. Default is 64.
#'
#' @return A file in svg-format is exported to the results folder in the work directory.
#'
#' @importFrom ggplot2 ggsave last_plot
#' @importFrom grDevices svg
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' # 1. Create a test plot
#' p <- ggplot(mtcars, aes(mpg, wt)) + geom_point()
#'
#' # 2. Save to a temporary file
#' temp_path <- file.path(tempdir(), "test_plot.svg")
#' ggplot2_svg(path = temp_path, plot = p)
#'
#' # 3. Show the file exists and open it to see the result
#' if (file.exists(temp_path)) {
#'   message("SVG successfully saved to: ", temp_path)
#'   # This will open the SVG in your default browser or viewer:
#'   utils::browseURL(temp_path)
#' }
ggplot2_svg <- function(path = NULL, plot = ggplot2::last_plot(), width = 100, height = 64) {
  # Set default path if none is provided
  if (is.null(path)) {
    path <- file.path("results", "plot.svg")                   # Default to results/plot.svg
  }

  target_dir <- dirname(path)
  if (!dir.exists(target_dir)) {
    dir.create(target_dir, recursive = TRUE)
  }

  mm_to_in <- function(mm) mm / 25.4

  ggplot2::ggsave(
    filename = path,
    plot     = plot,
    device   = grDevices::svg,
    width    = mm_to_in(width),
    height   = mm_to_in(height),
    units    = "in"
  )
}
