all: html pdf docx rtf

pdf: Katabuchi_CV.pdf
Katabuchi_CV.pdf: CV.md
	pandoc --standalone --template CV_template.tex \
	--from markdown --to context \
	--pdf-engine=xelatex \
	-V papersize=letter \
	-o Katabuchi_CV.tex CV.md; \
	context Katabuchi_CV.tex

html: CV.html
CV.html: CV_template.css CV.md
	pandoc --standalone -H CV_template.css \
        --from markdown --to html \
        -o CV.html CV.md

docx: CV.docx
CV.docx: CV.md
	pandoc -s -S CV.md -o CV.docx

rtf: CV.rtf
CV.rtf: CV.md
	pandoc -s -S CV.md -o CV.rtf

clean:
	rm -f CV.html
	rm -f Katabuchi_CV.tex
	rm -f Katabuchi_CV.tuc
	rm -f Katabuchi_CV.log
	rm -f Katabuchi_CV.pdf
	rm -f CV.docx
	rm -f CV.rtf
