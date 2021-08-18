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
```


## Requirements

 * ConTeXt
 * pandoc
 * Optima font (Mac)

## Credits

- Original template: Mark Szepieniec (<https://github.com/mszep/pandoc_resume>)