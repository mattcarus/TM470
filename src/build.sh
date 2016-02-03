#!/bin/bash
cd src
pdflatex -output-directory ../tmp report.tex
bibtex ../tmp/report.aux
pdflatex -output-directory ../tmp report.tex
pdflatex -output-directory ../tmp report.tex
latex2rtf -o ../build/report.rtf -T ../tmp -b ../tmp/report.bbl report.tex
mv ../tmp/report.pdf ../build/
rm -f ../tmp/*
cd ..

# To build SVG images (e.g. Gantt Chart)
#
#  inkscape -D -z --file=gantt.svg --export-pdf=gantt.pdf --export-latex
#
# Then, in tex file, use 
#
#  \def\svgwidth{350px}		% Only if image needs to be scaled
#  \input{gantt.pdf_tex}