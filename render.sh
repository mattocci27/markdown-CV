#!/usr/bin/env bash

set -e

#AUTHOR="Katabuchi, M."
LASTNAME=Katabuchi

pandoc ref.md \
  --citeproc \
  --csl=my_ref.csl \
	--bibliography=ref.bib \
	--pdf-engine=xelatex \
	-s -o ref.tex; \
	pandoc ref.tex -o ref_citeproc.md

if [ -f ref_citeproc_edit.md ]; then
  rm -f ref_citeproc_edit.md
fi

#python ref.py ${AUTHOR}
python ref.py "Katabuchi, M."

pandoc -s CV1.md ref_citeproc_edit.md CV2.md \
  --citeproc \
  --template CV_template.tex \
  --from markdown --to context \
  --pdf-engine=xelatex \
  --bibliography=ref.bib \
  --csl=my_ref.csl \
  -V papersize=letter \
  -o ${LASTNAME}_CV_raw.tex; \
  sed -e "s/enumerate/itemize/g" ${LASTNAME}_CV_raw.tex > ${LASTNAME}_CV.tex 
context ${LASTNAME}_CV.tex
