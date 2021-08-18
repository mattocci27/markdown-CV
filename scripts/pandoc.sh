#!/usr/bin/env bash

set -e

STYLE=CV_template_docker
AUTHOR="Katabuchi, M."
LASTNAME=Katabuchi

# ref_citeproc_edit.md
pandoc sources/ref.md -F pandoc-crossref --citeproc \
	--bibliography=sources/ref.bib \
	--csl=templates/my_ref.csl \
	--pdf-engine=xelatex \
	-s -o outputs/ref.tex

pandoc outputs/ref.tex -o outputs/ref_citeproc.md
rm -f outputs.ref_citeproc_edit.md
python3 scripts/ref_edit.py $AUTHOR

# CV.tex
pandoc -s sources/CV1.md outputs/ref_citeproc_edit.md sources/CV2.md --citeproc \
	--template templates/${STYLE}.tex \
	--from markdown --to context \
	--pdf-engine=xelatex \
	-V papersize=letter \
	-o outputs/${LASTNAME}_CV.tex

# CV.html
pandoc --standalone sources/CV1.md outputs/ref_citeproc_edit.md sources/CV2.md \
  -H templates/CV_template.css \
  --from markdown --to html \
  -o outputs/${LASTNAME}_CV.html

# CV.docx
pandoc -s sources/CV1.md outputs/ref_citeproc_edit.md sources/CV2.md \
  --reference-doc=templates/reference.docx -o outputs/${LASTNAME}_CV.docx

# CV.rtf
pandoc -s sources/CV1.md outputs/ref_citeproc_edit.md sources/CV2.md -o outputs/${LASTNAME}_CV.rtf
