#' Save a LaTeX-formatted string as a .tex document to be included as a table footnote
#'
#' @param text LaTeX-formatted string.
#' @param filename File name of corresponding graph or table.
#' @param stars Indicates whether explanation for significance stars should be included or not. Default is FALSE.
#' @examples
#' library(stringr)
#'
#' # Define footnote
#' footnote <- paste0("This is a footnote. \n",
#'                    "It has two rows and includes significance stars.")
#'
#' # Save footnote with significance stars
#' format_save_footnote(footnote, "current_table.tex", TRUE)
#'
#' # In LaTeX document:
#' # \input{../results/tables/current_table.tex}
#' # \input{../results/notes/current_table.tex}
format_save_footnote <- function(text = "", filename, stars = FALSE) {
  sig <- ifelse(stars, " * $p < 0.1$, ** $p < 0.05$, *** $p < 0.01$.", "")
  footnote <- paste0("\\footnotesize \n",
                    "\\begin{justify} \n",
                    "\\emph{Note}: ", text, sig, "\n",
                    "\\end{justify} \n",
                    "\\normalsize \n")
  clean_filename <- stringr::str_split(filename, stringr::fixed("."))[[1]][1]
  write(footnote, here::here("results", "notes", paste0(clean_filename, ".tex")))
}
