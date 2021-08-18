STYLE = CV_template
AUTHOR = "Katabuchi, M."
LASTNAME = Katabuchi
all: outputs/ref_citeproc_edit.md outputs/$(LASTNAME)_CV.html outputs/$(LASTNAME)_CV.pdf outputs/$(LASTNAME)_CV.docx outputs/$(LASTNAME)_CV.rtf

outputs/ref_citeproc_edit.md: sources/ref.md sources/ref.bib
	pandoc sources/ref.md -F pandoc-crossref --citeproc \
	--bibliography=sources/ref.bib \
	--csl=templates/my_ref.csl \
	--pdf-engine=xelatex \
	-s -o outputs/ref.tex; \
	pandoc outputs/ref.tex -o outputs/ref_citeproc.md; \
	rm -f outputs/ref_citeproc_edit.md
	python scripts/ref_edit.py $(AUTHOR)

outputs/$(LASTNAME)_CV.pdf: sources/CV1.md sources/CV2.md templates/$(STYLE).tex outputs/ref_citeproc_edit.md
	pandoc -s sources/CV1.md outputs/ref_citeproc_edit.md sources/CV2.md --citeproc \
	--template templates/$(STYLE).tex \
	--from markdown --to context \
	--pdf-engine=xelatex \
	-V papersize=letter \
	-o outputs/$(LASTNAME)_CV.tex; \
	cd outputs; context $(LASTNAME)_CV.tex

outputs/$(LASTNAME)_CV.html: templates/CV_template.css sources/CV1.md sources/CV2.md outputs/ref_citeproc_edit.md
	pandoc --standalone sources/CV1.md outputs/ref_citeproc_edit.md sources/CV2.md \
	    	-H templates/CV_template.css \
        --from markdown --to html \
        -o outputs/$(LASTNAME)_CV.html

outputs/$(LASTNAME)_CV.docx: sources/CV1.md sources/CV2.md outputs/ref_citeproc_edit.md
	pandoc -s sources/CV1.md outputs/ref_citeproc_edit.md sources/CV2.md \
		--reference-doc=templates/reference.docx -o outputs/$(LASTNAME)_CV.docx

outputs/$(LASTNAME)_CV.rtf: sources/CV1.md sources/CV2.md outputs/ref_citeproc_edit.md
	pandoc -s sources/CV1.md outputs/ref_citeproc_edit.md sources/CV2.md -o outputs/$(LASTNAME)_CV.rtf

.PHONY: clean
clean:
	rm -f outputs/*.tuc \
	outputs/*.log \
	cont-en.*
