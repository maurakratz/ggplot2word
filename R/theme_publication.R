#' Publication-ready ggplot2 theme
#'
#' An optimized ggplot2 theme that uses Times New Roman by default and
#' adjusts spacing and font sizes for document export to MS Word.
#'
#' @param base_family The font family to use. Default is "Times New Roman".
#' @param base_size The base font size in pt. Default is 10.
#'
#' @return A ggplot2 theme object.
#'
#' @importFrom ggplot2 theme_minimal theme element_text element_line element_blank rel
#' @export
theme_publication <- function(base_family = "Times New Roman", base_size = 10) {
  ggplot2::theme_minimal(base_family = base_family, base_size = base_size) +
    ggplot2::theme(
      plot.title      = ggplot2::element_text(size = ggplot2::rel(1.1), face = "bold", hjust = 0.5), # Relative to base_size
      plot.caption    = ggplot2::element_text(size = ggplot2::rel(0.8), face = "italic", hjust = 0.5),
      axis.title      = ggplot2::element_text(face = "bold"),                                        # Inherits size from base_size
      axis.text       = ggplot2::element_text(size = ggplot2::rel(0.8)),
      axis.text.x     = ggplot2::element_text(size = ggplot2::rel(0.9), angle = 45, hjust = 1, vjust = 1.1),
      legend.title    = ggplot2::element_text(size = ggplot2::rel(0.9), face = "bold"),
      legend.text     = ggplot2::element_text(size = ggplot2::rel(0.8)),
      panel.grid.major.y = ggplot2::element_line(color = "grey70", linewidth = 0.5),
      panel.grid.minor.y = ggplot2::element_line(color = "grey80", linewidth = 0.25),
      panel.grid.minor   = ggplot2::element_blank()
    )
}
