TEX = pdflatex
TEXOPTS = -interaction=nonstopmode
USAVERSIONOPTS = \def\USAVERSION{1}

.PHONY: cv.pdf all clean

all: cv.pdf

cv.pdf: cv.tex vc.aux
	$(TEX) $(TEXOPTS) "\input{$<}"

usa: cv.tex vc.aux
	$(TEX) $(TEXOPTS) "$(USAVERSIONOPTS) \input{$<}"

vc.aux: .git/logs/HEAD
	echo "\\gdef\\GITHASH{`git describe --always --dirty="+"`}" >> vc.aux

clean:
	rm -f *.aux *.log
