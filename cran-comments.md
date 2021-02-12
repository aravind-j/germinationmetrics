# Version 0.1.5 - Fourth submission

* Fixed issue with vignette in Solaris build.

### Test environments
* local Windows 10 Home v1803, R-release (R 4.0.3) & R-devel (R 4.1.0 Pre-release).
* local Ubuntu 16.04, R-release (R 4.0.3) & R-devel (R 4.1.0 Pre-release).
* win-builder, R-release (R 4.0.3) & R-devel (R 4.1.0 Pre-release).
* rhub:solaris-x86-patched - i386-pc-solaris2.10 (32-bit), R-release (R 4.0.3).
* rhub:solaris-x86-patched-ods - i386-pc-solaris2.10 (32-bit), R-release (R 4.0.3).
* rhub:macos-highsierra-release-cran - x86_64-apple-darwin17.0 (64-bit), R-release (R 4.0.3).

# Version 0.1.5 - Third submission

* Added prebuilt PDF due to use of `\Sexpr{}` expressions in Rd Files.
> Is there some reference about the method you can add in the Description field in the form Authors (year) <doi:.....>?
* As the references are too many, I have added all the citations in the package vignette with the doi or isbn. This was pointed out in the first submission too (0.1.0) accordingly where I have added a sentence pointing to references of methods implemented in package documented in the vignette.

### Test environments
* local Windows 10 Home v1803, R-release (R 4.0.3) & R-devel (R 4.1.0 Pre-release).
* local Ubuntu 16.04, R-release (R 4.0.3) & R-devel (R 4.1.0 Pre-release).
* win-builder, R-release (R 4.0.3) & R-devel (R 4.1.0 Pre-release).


# Version 0.1.5 - Second submission

* Fixed `cairo_pdf` unconditional use.
* Compressed vignetted using both `gs` and `qpdf`.

### Test environments
* local Windows 10 Home v1803, R-release (R 4.0.3) & R-devel (R 4.1.0 Pre-release).
* local Ubuntu 16.04, R-release (R 4.0.3) & R-devel (R 4.1.0 Pre-release).
* win-builder, R-release (R 4.0.3) & R-devel (R 4.1.0 Pre-release).

# Version 0.1.5 - First submission

* Fixed `cairo_pdf` unconditional use.

### Test environments
* local Windows 10 Home v1803, R-release (R 4.0.3) & R-devel (R 4.1.0 Pre-release).
* local Ubuntu 16.04, R-release (R 4.0.3) & R-devel (R 4.1.0 Pre-release).
* win-builder, R-release (R 4.0.3) & R-devel (R 4.1.0 Pre-release).

# Version 0.1.4 - First submission

* Reverted to using system certificates instead of RCurl ones for fetching and displaying version history as suggested by Prof. Brian Ripley (ripley@stats.ox.ac.uk).

### Test environments
* local Windows 10 Home v1803, R-release (R 4.0.1) & R-devel (R 4.1.0 Pre-release).
* local Ubuntu 16.04, R-release (R 4.0.1) & R-devel (R 4.1.0 Pre-release).
* win-builder, R-release (R 4.0.0) & R-devel (R 4.1.0 Pre-release).

### R CMD check results
* There were no ERRORs, NOTES or WARNINGs.

# Version 0.1.3 - Third submission

* Fixed LATEX xcolor options clash issue in vignette.
* Fixed issue with missing pandoc in case of r-release-osx-x86_64.
* The error in case of r-oldrel-osx-x86_64 (R v 3.4.*) is because the R package dependency is >= 3.5.0.

### Test environments
* local Windows 10 Home v1803, R-release (R 3.5.1) & R-devel (R 3.6.0 Pre-release).
* local Ubuntu 16.04, R-release (R 3.5.1) & R-devel (R 3.6.0 Pre-release).
* win-builder, R-release (R 3.5.1) & R-devel (R 3.6.0 Pre-release).

# Version 0.1.3 - Second submission

* Fixed LATEX xcolor options clash issue in vignette.
* Fixed issue with size of vignette pdf file. (Compressed with gs and qpdf).

### Test environments
* local Windows 10 Home v1803, R-release (R 3.5.1) & R-devel (R 3.6.0 Pre-release).
* local Ubuntu 16.04, R-release (R 3.5.1) & R-devel (R 3.6.0 Pre-release).
* win-builder, R-release (R 3.5.1) & R-devel (R 3.6.0 Pre-release).

### ERROR
* win-builder shows an error in re-building vignette `! Missing $ inserted`. Unable to replicate in local test environments with latest TeXLive (https://gist.githubusercontent.com/aravind-j/76292b834b84c83d29e8b0dbbd564799/raw/9092ac37e3efdad0df94cc58c49095939acc75fc/tex%2520version.txt). Kindly advise.

# Version 0.1.3 - First submission

* Fixed LATEX xcolor options clash issue in vignette.

### Test environments
* local Windows 10 Home v1803, R-release (R 3.5.1) & R-devel (R 3.6.0 Pre-release).
* local Ubuntu 16.04, R-release (R 3.5.1) & R-devel (R 3.6.0 Pre-release).
* win-builder, R-release (R 3.5.1) & R-devel (R 3.6.0 Pre-release).

### ERROR
* win-builder shows an error in re-building vignette `! Missing $ inserted`. Unable to replicate in local test environments with latest TeXLive (https://gist.githubusercontent.com/aravind-j/76292b834b84c83d29e8b0dbbd564799/raw/9092ac37e3efdad0df94cc58c49095939acc75fc/tex%2520version.txt). Kindly advise.

# Version 0.1.2 - First submission

* Fixed encoding in inst/REFERENCES.bib to UTF-8.

### Test environments
* local Windows 10 Home v1803, R-release (R 3.5.1) & R-devel (R 3.6.0 Pre-release).
* local Ubuntu 16.04, R-release (R 3.5.1) & R-devel (R 3.6.0 Pre-release).
* win-builder, R-release (R 3.5.1) & R-devel (R 3.6.0 Pre-release).

# Version 0.1.1 - First submission

* Fixed code to accomodate changes in the new release of `broom` package. 

### Test environments
* local Windows 10 Home v1803, R-release (R 3.5.1) & R-devel (R 3.6.0 Pre-release).
* local Ubuntu 16.04, R-release (R 3.5.1) & R-devel (R 3.6.0 Pre-release).
* win-builder, R-release (R 3.5.1) & R-devel (R 3.6.0 Pre-release).

# Version 0.1.0 - Third submission

* Fixed spelling mistake in description (uncertainity).
* Added sentence pointing to references of methods implemented in package documented in the vignette. This is instead of the method suggested by package reviewer to incorporate references in the description itself as doi, isbn or arXiv with angle brackets for auto-linking because the number of references is too many.

### Test environments
* local Windows 7 Ultimate install, R-release (R 3.4.4) & R-devel (R 3.5.0 Pre-release).
* local Ubuntu 16.04, R-release (R 3.4.4) & R-devel (R 3.5.0 Pre-release).
* win-builder, R-release (R 3.4.4) & R-devel (R 3.5.0 Pre-release).

### R CMD check results
* There were no ERRORs, NOTES or WARNINGs.

# Version 0.1.0 - Second submission

* Fixed pdf vignette compression issue leading to WARNING in first submission.

### Test environments
* local Windows 7 Ultimate install, R-release (R 3.4.4) & R-devel (R 3.5.0 Pre-release).
* local Ubuntu 16.04, R-release (R 3.4.4) & R-devel (R 3.5.0 Pre-release).
* win-builder, R-release (R 3.4.4) & R-devel (R 3.5.0 Pre-release).

### R CMD check results
* There were no ERRORs, NOTES or WARNINGs.

# Version 0.1.0 - First submission

### Test environments
* local Windows 7 Ultimate install, R-release (R 3.4.4) & R-devel (R 3.5.0 Pre-release).
* local Ubuntu 16.04, R-release (R 3.4.4) & R-devel (R 3.5.0 Pre-release).
* win-builder, R-release (R 3.4.4) & R-devel (R 3.5.0 Pre-release).

### R CMD check results
* There were no ERRORs, NOTES or WARNINGs.

