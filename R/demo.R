
#' a set of URLS for broad institute portal on GIANT consortium
#' @examples
#' head(whrurls(),2)
#' ww = whurls()
#' ss = strsplit(ww, "\\.")
#' table(sapply(ss, "[", 6))
#' @export
whrurls = function() c("https://portals.broadinstitute.org/collaboration/giant/images/0/09/PublicRelease.WHRadjBMI.C.All.Add.txt.gz", 
"https://portals.broadinstitute.org/collaboration/giant/images/e/e6/PublicRelease.WHRadjBMI.C.All.Rec.txt.gz",
"https://portals.broadinstitute.org/collaboration/giant/images/f/fc/PublicRelease.WHRadjBMI.C.Eur.Add.txt.gz",
"https://portals.broadinstitute.org/collaboration/giant/images/c/cd/PublicRelease.WHRadjBMI.C.Eur.Rec.txt.gz",
"https://portals.broadinstitute.org/collaboration/giant/images/0/00/PublicRelease.WHRadjBMI.M.All.Add.txt.gz",
"https://portals.broadinstitute.org/collaboration/giant/images/9/98/PublicRelease.WHRadjBMI.M.All.Rec.txt.gz",
"https://portals.broadinstitute.org/collaboration/giant/images/7/74/PublicRelease.WHRadjBMI.M.Eur.Add.txt.gz",
"https://portals.broadinstitute.org/collaboration/giant/images/3/3f/PublicRelease.WHRadjBMI.M.Eur.Rec.txt.gz",
"https://portals.broadinstitute.org/collaboration/giant/images/c/c9/PublicRelease.WHRadjBMI.W.All.Add.txt.gz",
"https://portals.broadinstitute.org/collaboration/giant/images/7/77/PublicRelease.WHRadjBMI.W.All.Rec.txt.gz",
"https://portals.broadinstitute.org/collaboration/giant/images/a/a9/PublicRelease.WHRadjBMI.W.Eur.Add.txt.gz",
"https://portals.broadinstitute.org/collaboration/giant/images/4/4e/PublicRelease.WHRadjBMI.W.Eur.Rec.txt.gz")


#' @export
setClass("indexedGF", contains="GenomicFiles", representation(vrlist="list"))

#' constructor for indexedGF
#' @param gfi instance of GenomicFiles
#' @examples
#' indexedGF(indexedGF::WHRadjBMI_gf)
#' @export
indexedGF = function(gfi, ...) {
 new("indexedGF", gfi, ...)
}

#' @export
setGeneric("saveIGF", function(x, file) standardGeneric("saveIGF"))
setMethod("saveIGF", c("indexedGF", "character"), function(x, file) {
  x@vrlist = list()
  base::save(list=x, file=file)
})

#' populate an indexedGF by running vroom over the files() component
#' @importFrom BiocParallel bplapply
#' @param igf an indexedGF instance
#' @param itmeth a function, defaults to lapply
#' @note For applications over HTTP parallelized ingestion can generate certification errors
#' @examples
#' nigf = indexedGF::WHRadjBMI_gf
#' nigf
#' tst = vroomIn(nigf)
#' tst
#' @export
vroomIn = function(igf, itmeth=lapply) {
 indrefs = itmeth(files(igf), vroom)
 igf@vrlist = indrefs
 igf
}

setMethod("show", "indexedGF", function(object) {
 cat(sprintf("indexedGF for %s files.\n", length(files(object))))
 if (length(object@vrlist)==0) cat("vrlist is empty.\n") else cat("vrlist is populated.\n")
 cat("Use vroomIn() to populate if needed, saveIGF() to serialize.\n")
})
