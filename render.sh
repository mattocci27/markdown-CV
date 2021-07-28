#!/usr/bin/env bash

pandoc ref.md \
  --citeproc \
  --csl=my_ref.csl \
	--bibliography=ref.bib \
	--pdf-engine=xelatex \
	-s -o ref.tex; \
	pandoc ref.tex -o ref_citeproc.md; \
	rm -f ref_citeproc_edit.md
	python ref.py "Katabuchi, M."

pandoc -s CV1.md ref_citeproc_edit.md CV2.md \
  --citeproc \
  --template CV_template.tex \
  --from markdown --to context \
  --pdf-engine=xelatex \
  --bibliography=ref.bib \
  --csl=my_ref.csl \
  -V papersize=letter \
  -o Katabuchi_CV_raw.tex; \
sed -e "s/enumerate/itemize/g" Katabuchi_CV_raw.tex > Katabuchi_CV.tex 
context Katabuchi_CV.tex
