all: html pdf docx rtf

pdf: Katabuchi_CV.pdf
Katabuchi_CV.pdf: CV.md
	pandoc --standalone --template CV_template.tex \
	--from markdown --to context \
	--pdf-engine=xelatex \
	-V papersize=letter \
	-o Katabuchi_CV.tex CV.md; \
	context Katabuchi_CV.tex

#pdf: CV_XTBG.pdf
#CV_XTBG.pdf: CV_XTBG.md
#	pandoc --standalone --template CV_template_ch2.tex \
#	--from markdown --to context \
#	--pdf-engine=xelatex \
#	-V papersize=letter \
#	-o CV_XTBG.tex CV_XTBG.md; \
#	context CV_XTBG.tex

html: CV.html
CV.html: CV_template.css CV.md
	pandoc --standalone -H CV_template.css \
        --from markdown --to html \
        -o CV.html CV.md

docx: Katabuchi_CV.docx
CV.docx: CV.md
	pandoc -s CV.md --reference-doc=reference.docx -o Katabuchi_CV.docx

#docx: CV_XTBG.docx
#CV.docx: CV_XTBG.md
#	pandoc -s CV_XTBG.md --reference-doc=reference.docx -o CV_XTBG.docx

rtf: CV.rtf
CV.rtf: CV.md
	pandoc -s CV.md -o CV.rtf

clean:
	rm -f CV.html
	rm -f Katabuchi_CV.tex
	rm -f Katabuchi_CV.tuc
	rm -f Katabuchi_CV.log
	rm -f Katabuchi_CV.pdf
	rm -f Katabuchi_CV.docx
	rm -f CV.rtf
