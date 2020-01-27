#' @title identify medications that are listed in a patient record as entities
#' @description identify medications that are listed in a patient record as entities
#' @param text A character string containing a text to entities analyze, or a character vector to perform analysis separately for each element.
#' @param \dots Additional arguments passed to \code{\link{comprehendHTTP}}.
#' @return A data frame
#' @examples
#' \dontrun{
#'   # simple example
#'   infer_rxnrom("Mrs. Smith is currently taking ibuprofen daily.")
#'   
#'   txt <-c("Mrs. Smith is currently taking",
#'           "ibuprofen daily")
#'   infer_rxnorm(txt)
#' }
#' @export
infer_rxnorm <- function(text, ...) {
  bod <- list(Text = text)
  out <- comprehendHTTP(action = "InferRxNorm", body = bod, service = "comprehendmedical", ...)
  return(cbind(Index = 1, out$Entities))
}
