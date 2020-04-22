@Swenson2020
@Sreekar2018
@Johnson2018
@Osnas2018
@Li2017
@Katabuchi2017
@Siefert2015
@Katabuchi2015
@Ashton2016
@Nakamura2016
@Nakamura2015
@Deng2015
@Hikosaka2014
@Kamiyama2014
@Sasaki2014
@Cdiz2013
@Asanok2013
@Sasaki2013
@Aiba2013
@Sasaki2012b
@Sasaki2012
@Katabuchi2012
@Katabuchi2008b
@Katabuchi2008


# Ue seperate md files

```
pandoc ref.md -F pandoc-crossref -F pandoc-citeproc \
--bibliography=ref.bib \
--csl=my_ref.csl \
--template=eisvogel2.tex \
--default-image-extension=pdf \
--pdf-engine=xelatex \
-s -o ref.pdf

pandoc ref.md -F pandoc-crossref -F pandoc-citeproc \
--bibliography=ref.bib \
--csl=my_ref.csl \
--default-image-extension=pdf \
--template=eisvogel2.tex \
--pdf-engine=xelatex \
-s -o ref.tex

pandoc ref.tex -o ref_citeproc.md

#Rscript ref.r 
rm -f ref_citeproc_edit.md
python ref.py 

pandoc -s CV1.md ref_citeproc_edit.md CV2.md -F pandoc-citeproc \
--template CV_template.tex \
--from markdown --to context \
--pdf-engine=xelatex \
--bibliography=ref.bib \
--csl=my_ref.csl \
-V papersize=letter \
-o Katabuchi_CV.tex; \
context Katabuchi_CV.tex

```


# Use a single md file

- not working 

```

pandoc CV.md --standalone -F pandoc-citeproc \
--template CV_template.tex \
--from markdown --to context \
--bibliography=ref.bib \
--csl=my_ref.csl \
--pdf-engine=xelatex \
-V papersize=letter \
-o Katabuchi_CV.tex

```

# Refs
