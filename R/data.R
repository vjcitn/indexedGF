#' a GenomicFiles instance representing a piece of the GIANT consortium portal at Broad
#' @docType data
#' @importFrom utils data
#' @format GenomicFiles instance
#' @source \url{https://portals.broadinstitute.org/collaboration/giant/index.php/GIANT_consortium_data_files}
"WHRadjBMI_gf"

#' an indexedGF instance for 150 files in GIANT consortium portal
#' @docType data
#' @format indexedGF instance
"igf_giant150"

#' an indexedGF instance for 149 files in GIANT consortium portal
#' @docType data
#' @format indexedGF instance
#' @note A small 'enrichment' dataset was dropped from the full
#' set of 150 files.  Metadata components include 'field_names'
#' and 'nsnps' which are coordinated with the 149 files but
#' have no element names.  The filenames used here assume the
#' data are locally available in the current folder.  See aws_igf_GIANT149
#' for access to globally accessible images in AWS S3.
"igf_GIANT149"

#' an indexedGF instance for 149 files in GIANT consortium portal, resident in AWS S3
#' @docType data
#' @format indexedGF instance
#' @note A small 'enrichment' dataset was dropped from the full
#' set of 150 files.  Metadata components include 'field_names'
#' and 'nsnps' which are coordinated with the 149 files but
#' have no element names.  Note that there has been light curation
#' relative to material at the GIANT portal, where some of the files
#' have Pax headers indicative of compression in tar archive
#' context, and some files are not compressed despite their suffix.
"aws_igf_GIANT149"
