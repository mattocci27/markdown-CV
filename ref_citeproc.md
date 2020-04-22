1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24

Ue seperate md files
====================

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

Use a single md file
====================

-   not working

```{=html}
<!-- -->
```
    pandoc CV.md --standalone -F pandoc-citeproc \
    --template CV_template.tex \
    --from markdown --to context \
    --bibliography=ref.bib \
    --csl=my_ref.csl \
    --pdf-engine=xelatex \
    -V papersize=letter \
    -o Katabuchi_CV.tex

Refs {#refs .unnumbered}
====

::: {#refs}
:::

[]{#ref-Swenson2020} 1. Swenson, N. G., Hulshof, C. M., Katabuchi, M. &
Enquist, B. J. Long-term shifts in the functional composition and
diversity of a tropical dry forest: A 30-yr study. ***Ecolgical
Monographs*** e01408 (2020),
doi:[10.1002/ecm.1408](https://doi.org/10.1002/ecm.1408).

[]{#ref-Sreekar2018} 2. Sreekar, R., Katabuchi, M., Nakamura, A.,
Corlett, R. T., Slik, J. W. F., Fletcher, C., He, F., Weiblen, G. D.,
Shen, G., Xu, H., Sun, I.-F., Cao, K., Ma, K., Chang, L.-W., Cao, M.,
Jiang, M., Gunatilleke, I. A. U. N., Ong, P., Yap, S., Gunatilleke, C.
V. S., Novotny, V., Brockelman, W. Y., Xiang, W., Mi, X., Li, X., Wang,
X., Qiao, X., Li, Y., Tan, S., Condit, R., Harrison, R. D. & Koh, L. P.
Spatial scale changes the relationship between beta diversity, species
richness and latitude. ***Royal Society Open Science*** 5, 181168
(2018), doi:[10.1098/rsos.181168](https://doi.org/10.1098/rsos.181168).

[]{#ref-Johnson2018} 3. Johnson, D. J., Needham, J., Xu, C., Massoud, E.
C., Davies, S. J., Anderson-Teixeira, K. J., Bunyavejchewin, S.,
Chambers, J. Q., Chang-Yang, C.-H., Chiang, J.-M., Chuyong, G. B.,
Condit, R., Cordell, S., Fletcher, C., Giardina, C. P., Giambelluca, T.
W., Gunatilleke, N., Gunatilleke, S., Hsieh, C.-F., Hubbell, S.,
Inman-Narahari, F., Kassim, A. R., Katabuchi, M., Kenfack, D., Litton,
C. M., Lum, S., Mohamad, M., Nasardin, M., Ong, P. S., Ostertag, R.,
Sack, L., Swenson, N. G., Sun, I. F., Tan, S., Thomas, D. W., Thompson,
J., Umaña, M. N., Uriarte, M., Valencia, R., Yap, S., Zimmerman, J.,
McDowell, N. G. & McMahon, S. M. Climate sensitive size-dependent
survival in tropical trees. ***Nature Ecology & Evolution*** 2, 1436
(2018),
doi:[10.1038/s41559-018-0626-z](https://doi.org/10.1038/s41559-018-0626-z).

[]{#ref-Osnas2018} 4. Osnas, J. L. D., Katabuchi, M., Kitajima, K.,
Wright, S. J., Reich, P. B., Van Bael, S. A., Kraft, N. J. B.,
Samaniego, M. J., Pacala, S. W. & Lichstein, J. W. Divergent drivers of
leaf trait variation within species, among species, and among functional
groups. ***Proceedings of the National Academy of Sciences*** 115,
5480--5485 (2018),
doi:[10.1073/pnas.1803989115](https://doi.org/10.1073/pnas.1803989115).

[]{#ref-Li2017} 5. Li, Y., Shipley, B., Price, J. N., Dantas, V. de L.,
Tamme, R., Westoby, M., Siefert, A., Schamp, B. S., Spasojevic, M. J.,
Jung, V., Laughlin, D. C., Richardson, S. J., Bagousse-Pinguet, Y. L.,
Schöb, C., Gazol, A., Prentice, H. C., Gross, N., Overton, J.,
Cianciaruso, M. V., Louault, F., Kamiyama, C., Nakashizuka, T.,
Hikosaka, K., Sasaki, T., Katabuchi, M., Frenette Dussault, C.,
Gaucherand, S., Chen, N., Vandewalle, M. & Batalha, M. A. Habitat
Filtering Determines the Functional Niche Occupancy of Plant Communities
Worldwide. ***Journl of Ecology*** 3, 808--809 (2017),
doi:[10.1111/1365-2745.12802](https://doi.org/10.1111/1365-2745.12802).

[]{#ref-Katabuchi2017} 6. Katabuchi, M., Wright, S. J., Swenson, N. G.,
Feeley, K. J., Condit, R., Hubbell, S. P. & Davies, S. J. Contrasting
outcomes of species- and community-level analyses of the temporal
consistency of functional composition. ***Ecology*** 98, 2273--2280
(2017), doi:[10.1002/ecy.1952](https://doi.org/10.1002/ecy.1952).

[]{#ref-Siefert2015} 7. Siefert, A., Violle, C., Chalmandrier, L.,
Albert, C. H., Taudiere, A., Fajardo, A., Aarssen, L. W., Baraloto, C.,
Carlucci, M. B., Cianciaruso, M. V., L. Dantas, V. de, Bello, F. de,
Duarte, L. D. S., Fonseca, C. R., Freschet, G. T., Gaucherand, S.,
Gross, N., Hikosaka, K., Jackson, B., Jung, V., Kamiyama, C., Katabuchi,
M., Kembel, S. W., Kichenin, E., Kraft, N. J. B., Lagerström, A.,
Bagousse-Pinguet, Y. L., Li, Y., Mason, N., Messier, J., Nakashizuka,
T., Overton, J. M., Peltzer, D. A., Pérez-Ramos, I. M., Pillar, V. D.,
Prentice, H. C., Richardson, S., Sasaki, T., Schamp, B. S., Schöb, C.,
Shipley, B., Sundqvist, M., Sykes, M. T., Vandewalle, M. & Wardle, D. A.
A global meta-analysis of the relative extent of intraspecific trait
variation in plant communities. ***Ecology Letters*** 18, 1406--1419
(2015), doi:[10.1111/ele.12508](https://doi.org/10.1111/ele.12508).

[]{#ref-Katabuchi2015} 8. Katabuchi, M. LeafArea: an R package for rapid
digital image analysis of leaf area. ***Ecological Research*** 30,
1073--1077 (2015),
doi:[10.1007/s11284-015-1307-x](https://doi.org/10.1007/s11284-015-1307-x).

[]{#ref-Ashton2016} 9. Ashton, L. A., Nakamura, A., Basset, Y., Burwell,
C. J., Cao, M., Eastwood, R., Odell, E., Oliveira, E. G. de, Hurley, K.,
Katabuchi, M., Maunsell, S., McBroom, J., Schmidl, J., Sun, Z., Tang,
Y., Whitaker, T., Laidlaw, M. J., McDonald, W. J. F. & Kitching, R. L.
Vertical stratification of moths across elevation and latitude.
***Journal of Biogeography*** 43, 59--69 (2016),
doi:[10.1111/jbi.12616](https://doi.org/10.1111/jbi.12616).

[]{#ref-Nakamura2016} 10. Nakamura, A., Burwell, C. J., Ashton, L. A.,
Laidlaw, M. J., Katabuchi, M. & Kitching, R. L. Identifying indicator
species of elevation: Comparing the utility of woody plants, ants and
moths for long-term monitoring. ***Austral Ecology*** 41, 179--188
(2016), doi:[10.1111/aec.12291](https://doi.org/10.1111/aec.12291).

[]{#ref-Nakamura2015} 11. Nakamura, A., Burwell, C. J., Lambkin, C. L.,
Katabuchi, M., Mcdougall, A., Raven, R. J. & Neldner, V. J. The Role of
Human Disturbance in Island Biogeography of Arthropods and Plants: An
Information Theoretic Approach. ***J. Biogeogr.*** 42, 1406--1417
(2015), doi:[10.1111/jbi.12520](https://doi.org/10.1111/jbi.12520).

[]{#ref-Deng2015} 12. Deng, X., Mohandass, D., Katabuchi, M., Hughes, A.
C. & Roubik, D. W. Impact of Striped-Squirrel Nectar-Robbing Behaviour
on Gender Fitness in Alpinia roxburghii Sweet (Zingiberaceae). ***PLoS
ONE*** 10, (2015),
doi:[10.1371/journal.pone.0144585](https://doi.org/10.1371/journal.pone.0144585).

[]{#ref-Hikosaka2014} 13. Hikosaka, K., Sasaki, T., Kamiyama, C.,
Katabuchi, M., Oikawa, S., Shimazaki, M., Kimura, K. & Nakshizuka, T.
Understanding of species niche, coexistence and extinction based on
functional traits : Approaches from community and physiological ecology
for subalpine moorland plant communities \[in Japanese\].
***Chikyu-Kankyo*** 19, 33--46 (2014).

[]{#ref-Kamiyama2014} 14. Kamiyama, C., Katabuchi, M., Sasaki, T.,
Shimazaki, M., Nakashizuka, T. & Hikosaka, K. Leaf-trait responses to
environmental gradients in moorland communities: Contribution of
intraspecific variation, species replacement and functional group
replacement. ***Ecological Research*** 29, 607--617 (2014),
doi:[10.1007/s11284-014-1148-z](https://doi.org/10.1007/s11284-014-1148-z).

[]{#ref-Sasaki2014} 15. Sasaki, T., Katabuchi, M., Kamiyama, C.,
Shimazaki, M., Nakashizuka, T. & Hikosaka, K. Vulnerability of moorland
plant communities to environmental change: Consequences of realistic
species loss on functional diversity. ***Journal of Applied Ecology***
51, 299--308 (2014),
doi:[10.1111/1365-2664.12192](https://doi.org/10.1111/1365-2664.12192).

[]{#ref-Cdiz2013} 16. Cádiz, A., Nagata, N., Katabuchi, M., Dı́az, L. M.,
Echenique-Dı́az, L. M., Akashi, H. D., Makino, T. & Kawata, M. Relative
importance of habitat use, range expansion, and speciation in local
species diversity of Anolis lizards in Cuba. ***Ecosphere*** 4, art78
(2013),
doi:[10.1890/es12-00383.1](https://doi.org/10.1890/es12-00383.1).

[]{#ref-Asanok2013} 17. Asanok, L., Marod, D., Duengkae, P.,
Pranmongkol, U., Kurokawa, H., Aiba, M., Katabuchi, M. & Nakashizuka, T.
Relationships between functional traits and the ability of forest tree
species to reestablish in secondary forest and enrichment plantations in
the uplands of northern Thailand. ***Forest Ecology and Management***
296, 9--23 (2013),
doi:[10.1016/j.foreco.2013.01.029](https://doi.org/10.1016/j.foreco.2013.01.029).

[]{#ref-Sasaki2013} 18. Sasaki, T., Katabuchi, M., Kamiyama, C.,
Shimazaki, M., Nakashizuka, T. & Hikosaka, K. Variations in Species
Composition of Moorland Plant Communities Along Environmental Gradients
Within a Subalpine Zone in Northern Japan. ***Wetlands*** 33, 269--277
(2013),
doi:[10.1007/s13157-013-0380-6](https://doi.org/10.1007/s13157-013-0380-6).

[]{#ref-Aiba2013} 19. Aiba, M., Katabuchi, M., Takafumi, H., Matsuzaki,
S.-i. S., Sasaki, T. & Hiura, T. Robustness of trait distribution
metrics for community assembly studies under the uncertainties of
assembly processes. ***Ecology*** 94, 2873--2885 (2013),
doi:[10.1890/13-0269.1](https://doi.org/10.1890/13-0269.1).

[]{#ref-Sasaki2012b} 20. Sasaki, T., Katabuchi, M., Kamiyama, C.,
Shimazaki, M., Nakashizuka, T. & Hikosaka, K. Diversity partitioning of
moorland plant communities across hierarchical spatial scales.
***Biodiversity and Conservation*** 21, 1577--1588 (2012),
doi:[10.1007/s10531-012-0265-7](https://doi.org/10.1007/s10531-012-0265-7).

[]{#ref-Sasaki2012} 21. Sasaki, T., Katabuchi, M., Kamiyama, C.,
Shimazaki, M., Nakashizuka, T. & Hikosaka, K. Nestedness and niche-based
species loss in moorland plant communities. ***Oikos*** 121, 1783--1790
(2012),
doi:[10.1111/j.1600-0706.2012.20152.x](https://doi.org/10.1111/j.1600-0706.2012.20152.x).

[]{#ref-Katabuchi2012} 22. Katabuchi, M., Kurokawa, H., Davies, S. J.,
Tan, S. & Nakashizuka, T. Soil resource availability shapes community
trait structure in a species-rich dipterocarp forest. ***Journal of
Ecology*** 100, 643--651 (2012),
doi:[10.1111/j.1365-2745.2011.01937.x](https://doi.org/10.1111/j.1365-2745.2011.01937.x).

[]{#ref-Katabuchi2008b} 23. Katabuchi, M., Isagi, Y. & Nakashizuka, T.
Development of 17 microsatellite markers for Ceratosolen constrictus,
the pollinating fig wasp of Ficus fistulosa. ***Molecular Ecology
Resources*** 8, 840--842 (2008),
doi:[10.1111/j.1755-0998.2007.02084.x](https://doi.org/10.1111/j.1755-0998.2007.02084.x).

[]{#ref-Katabuchi2008} 24. Katabuchi, M., Harrison, R. D. & Nakashizuka,
T. Documenting the effect of foundress number in a dioecious fig, Ficus
fistulosa, in Malaysia. ***Biotropica*** 40, 457--461 (2008),
doi:[10.1111/j.1744-7429.2008.00405.x](https://doi.org/10.1111/j.1744-7429.2008.00405.x).
