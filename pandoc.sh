#!/usr/bin/env bash

set -e

STYLE=CV_template_docker
AUTHOR="Katabuchi, M."
LASTNAME=Katabuchi

# ref_citeproc_edit.md
pandoc ref.md --citeproc \
	--bibliography=ref.bib \
	--csl=my_ref.csl \
	--pdf-engine=xelatex \
	-s -o ref.tex

pandoc ref.tex -o ref_citeproc.md
rm -f ref_citeproc_edit.md
python3 ref_edit.py $AUTHOR

# CV.tex
pandoc -s CV1.md ref_citeproc_edit.md CV2.md --citeproc \
	--template ${STYLE}.tex \
	--from markdown --to context \
	--pdf-engine=xelatex \
	-V papersize=letter \
	-o ${LASTNAME}_CV.tex

# CV.html
pandoc --standalone CV1.md ref_citeproc_edit.md CV2.md \
	    	-H CV_template.css \
        --from markdown --to html \
        -o ${LASTNAME}_CV.html

# CV.docx
pandoc -s CV1.md ref_citeproc_edit.md CV2.md \
		--reference-doc=reference.docx -o ${LASTNAME}_CV.docx

# CV.rtf
pandoc -s CV1.md ref_citeproc_edit.md CV2.md -o ${LASTNAME}_CV.rtf