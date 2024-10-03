# makefile pro preklad LaTeX verze sablony IEL
# (c) 2022 Petr Veigend
# E-mail: veigend AT fit vut cz
# Upraveno na zaklade Makefile ze sablony pro zaverecne prace FIT.
#===========================================
CO=00-projekt

all: $(CO).pdf

pdf: $(CO).pdf

$(CO).pdf: clean
	pdflatex $(CO)
	-bibtex $(CO)
	pdflatex $(CO)
	pdflatex $(CO)

clean:
	rm -f *.dvi *.log $(CO).blg $(CO).bbl $(CO).toc *.aux $(CO).out $(CO).lof $(CO).ptc
	rm -f $(CO).pdf
	rm -f *~