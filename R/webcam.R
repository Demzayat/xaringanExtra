#' Webcam
#'
#' Add a live video of your webcam into your slides (in your own browser only).
#' Useful when you are presenting via video conference to include your video,
#' or when you are recording a class or lecture.
#'
#' @includeRmd man/fragments/webcam-details.Rmd details
#'
#' @references The webcam extension is based on the original
#'   [webcam implementation](https://yihui.org/en/2017/12/html5-camera/) by
#'   Yihui Xie, author of \pkg{xaringan}.
#' @name webcam
NULL

#' @describeIn webcam Add the webcam extension to your slides
#' @param width,height Width and height of the video pane in CSS units.
#' @param margin Margin around the video pane in CSS units.
#' @export
use_webcam <- function(width = 200, height = 200, margin = "1em") {
	htmltools::tagList(
		html_dependency_webcam(width, height)
	)
}

#' @describeIn webcam Returns an [htmltools::htmlDependency()] with the webcam
#'   dependencies. Most users will want to use `use_webcam()`.
#' @export
html_dependency_webcam <- function(width = 200, height = 200, margin = "1em") {
	width  <- htmltools::validateCssUnit(width)
	height <- htmltools::validateCssUnit(height)
	margin <- htmltools::validateCssUnit(margin)
	opts <- sprintf('{"width":"%s","height":"%s","margin":"%s"}', width, height, margin)
	opts <- sprintf(
		'<script id="xaringanExtra-webcam-options" type="application/json">%s</script>',
		opts
	)
	htmltools::htmlDependency(
	  name = "xaringanExtra-webcam",
	  version = "0.0.1",
	  package = "xaringanExtra",
	  src = "webcam",
	  script = "webcam.js",
	  head = opts,
	  all_files = FALSE
	)
}
