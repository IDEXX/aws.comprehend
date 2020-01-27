#' @title links entities to normalized concept identifiers
#' @description detects medical conditions as entities listed in a patient record and links those entities to normalized concept identifiers 
#' in the ICD-10-CM knowledge base from the Centers for Disease Control.
#' @param text A character string containing a text to entities analyze, or a character vector to perform analysis separately for each element.
#' @param \dots Additional arguments passed to \code{\link{comprehendHTTP}}.
#' @return A data frame
#' @examples
#' \dontrun{
#'   # simple example
#'   infer_icd10cm("Mrs. Smith has a history of diabetes mellitus.")
#'   
#'   txt <-c("Mrs. Smith has a history",
#'           "of diabetes mellitus")
#'   infer_icd10cm(txt)
#' }
#' @export
infer_icd10cm <- function(text, ...) {
  bod <- list(Text = text)
  out <- comprehendHTTP(action = "InferICD10CM", body = bod, service = "comprehendmedical", ...)
  return(cbind(Index = 1, out$Entities))
}
