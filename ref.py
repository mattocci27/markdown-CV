import re
import os
from os.path import join, splitext, split

f = open("ref_citeproc.md")
lines = f.readlines()
f.close()
outfname = "ref_citeproc_edit.md"

tmp = [i for i, line in enumerate(lines) if re.search('\[\]{#ref-.*}', line)]
lines2 = lines[tmp[0]:len(lines)]

for line in lines2:
    line2 = line.replace("Katabuchi, M.", "**Katabuchi, M.**")
    line2 = line2.replace("Ficus", "*Ficus*")
    line2 = line2.replace("fistulosa", "*fistulosa*")
    line2 = line2.replace("Ceratosolen", "*Ceratosolen*")
    line2 = line2.replace("constrictus", "*constrictus*")
    line2 = line2.replace("Anolis", "*Anolis*")
    line2 = line2.replace("doi:[", "[doi:")
    line2 = re.sub("\[\]{#ref-.*}", "", line2)
    line2 = re.sub("^ .\.", "1.", line2)
    line2 = re.sub("^ ..\.", "1.", line2)

    if os.path.exists(outfname):
        # yes -> overwrite
        outfp = open(outfname, "a")
    else:
        # no -> new file
        outfp = open(outfname, "w")

    outfp.write(line2)
