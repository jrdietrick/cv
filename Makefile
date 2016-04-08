TEX = pdflatex
TEXOPTS = -interaction=nonstopmode
USAVERSIONOPTS = \def\USAVERSION{1}

.PHONY: cv.pdf all clean

all: cv.pdf

cv.pdf: cv.tex
	$(TEX) $(TEXOPTS) "\input{$<}"

usa: cv.tex
	$(TEX) $(TEXOPTS) "$(USAVERSIONOPTS) \input{$<}"
