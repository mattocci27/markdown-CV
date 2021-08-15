STYLE = CV_template
AUTHOR = "Katabuchi, M."
LASTNAME = Katabuchi
all: ref_citeproc_edit.md $(LASTNAME)_CV.html $(LASTNAME)_CV.pdf $(LASTNAME)_CV.docx $(LASTNAME)_CV.rtf

ref_citeproc_edit.md: ref.md ref.bib
	pandoc ref.md -F pandoc-crossref --citeproc \
	--bibliography=ref.bib \
	--csl=my_ref.csl \
	--pdf-engine=xelatex \
	-s -o ref.tex; \
	pandoc ref.tex -o ref_citeproc.md; \
	rm -f ref_citeproc_edit.md
	python ref.py $(AUTHOR)

$(LASTNAME)_CV.pdf: CV1.md CV2.md $(STYLE).tex ref_citeproc_edit.md
	pandoc -s CV1.md ref_citeproc_edit.md CV2.md --citeproc \
	--template $(STYLE).tex \
	--from markdown --to context \
	--pdf-engine=xelatex \
	-V papersize=letter \
	-o $(LASTNAME)_CV.tex; \
	context $(LASTNAME)_CV.tex

$(LASTNAME)_CV.html: CV_template.css CV1.md CV2.md
	pandoc --standalone CV1.md ref_citeproc_edit.md CV2.md \
	    	-H CV_template.css \
        --from markdown --to html \
        -o $(LASTNAME)_CV.html

$(LASTNAME)_CV.docx: CV1.md CV2.md reference.docx
	pandoc -s CV1.md ref_citeproc_edit.md CV2.md \
		--reference-doc=reference.docx -o $(LASTNAME)_CV.docx

$(LASTNAME)_CV.rtf: CV1.md CV2.md
	pandoc -s CV1.md ref_citeproc_edit.md CV2.md -o $(LASTNAME)_CV.rtf

.PHONY: clean
clean:
	rm -f $(LASTANAME)_CV.tuc \
	$(LASTNAME)_CV.log \
	cont-en.* 
