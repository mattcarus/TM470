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
