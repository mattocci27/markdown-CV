The Markdown Resume
===================

### Instructions 

```bash
git clone https://github.com/mattocci27/markdown_CV
cd markdown_CV
vim CV1.md   # insert your own resume info
vim CV2.md   # insert your own resume info
vim ref.md   # insert your own resume info
bash render.sh # insert your name
```

### Running Dockerized (not working)

```bash
git clone https://github.com/mattocci27/markdown_CV
cd markdown_CV
vim CV.md   # insert your own resume info
sudo docker-compose up -d

sudo docker-compose up --build
```

### Requirements

 * ConTeXt
 * pandoc
 * Optima font (Mac)
