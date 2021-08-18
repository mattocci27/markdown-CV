The Markdown Resume
===================

## Instruction

```bash
git clone https://github.com/mattocci27/markdown-CV
cd markdown-CV
vim CV1.md   # insert your own resume info
vim CV2.md   # insert your own resume info
vim ref.md   # insert your own resume info
vim ref.bib  # insert your own resume info
```

### Local

Make everything.

```bash
make
```

### Running Dockerized

Make everything.

```bash
bash docker-env.sh
docker-compose up

docker run -it --rm minidocks/context:current-with-fonts /bin/sh

apk add tree fontconfig
mkdir /usr/share/fonts/truetype/cousine/
wget https://github.com/google/fonts/blob/main/apache/cousine/Cousine-Regular.ttf -O /usr/share/fonts/truetype/cousine/Cousine.ttf
fc-cache -fv


mkdir /usr/share/tex/texmf/fonts/truetype/public/cousine/

wget https://github.com/google/fonts/bolb/main/apache/cousine

tree /usr/share/tex/texmf/fonts/truetype
ls -lh /usr/share/tex/texmf/fonts/truetype/public/Cousine
ls -lh /usr/share/tex/texmf/fonts/truetype/public/dejavu
ls -lh /usr/share/fonts

fc-cache -fv


```


## Requirements

 * ConTeXt
 * pandoc
 * Optima font (Mac)

## Credits

- Original template: Mark Szepieniec (<https://github.com/mszep/pandoc_resume>)