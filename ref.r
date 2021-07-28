library(tidyverse)

txt <- readLines("ref_citeproc.md")
txt <- str_replace_all(txt, "\\[\\]\\{#ref-.*\\}", "")
txt <- str_replace_all(txt, "^ .\\.", "1.")
txt <- str_replace_all(txt, "^ ..\\.", "1.")
txt <- str_replace_all(txt, "Katabuchi, M.", "**Katabuchi, M.**")
txt <- str_replace_all(txt, "doi:\\[", "\\[doi:")
txt <- txt[(str_which(txt, "^1\\.")[1]):length(txt)]

out <- file("ref_citeproc_edit.md")
writeLines(txt, out)
close(out)
