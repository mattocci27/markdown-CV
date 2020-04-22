STYLE=CV_template
all: md html pdf docx rtf

md: ref.md ref.tex ref_citeproc.md
	pandoc ref.md -F pandoc-crossref -F pandoc-citeproc \
	--bibliography=ref.bib \
	--csl=my_ref.csl \
	--pdf-engine=xelatex \
	-s -o ref.tex; \
	pandoc ref.tex -o ref_citeproc.md; \
	rm -f ref_citeproc_edit.md
	python ref.py 

pdf: CV1.md CV2.md
	pandoc -s CV1.md ref_citeproc_edit.md CV2.md -F pandoc-citeproc \
	--template $(STYLE).tex \
	--from markdown --to context \
	--pdf-engine=xelatex \
	-V papersize=letter \
	-o Katabuchi_CV.tex; \
	context Katabuchi_CV.tex

html: CV_template.css CV.md
	pandoc --standalone CV1.md ref_citeproc_edit.md CV2.md \
	    	-H CV_template.css \
        --from markdown --to html \
        -o CV.html

docx: CV.md reference.docx
	pandoc -s CV1.md ref_citeproc_edit.md CV2.md \
		--reference-doc=reference.docx -o Katabuchi_CV.docx

rtf: CV.md
	pandoc -s CV1.md ref_citeproc_edit.md CV2.md -o CV.rtf

clean:
	rm -f Katabuchi_CV.tuc \
	Katabuchi_CV.log \
	cont-en.* 
