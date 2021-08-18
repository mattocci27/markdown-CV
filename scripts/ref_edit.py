import re
import os
import sys
from os.path import join, splitext, split

author = sys.argv[1]
print(author)

f = open('outputs/ref_citeproc.md')
lines = f.readlines()
f.close()
outfname = 'outputs/ref_citeproc_edit.md'


tmp = [i for i, line in enumerate(lines) if re.search('\[\]{#ref-.*}', line)]
lines2 = lines[tmp[0]:len(lines)]

tmp2 = [i for i, line in enumerate(lines2) if re.search('^[0-9].\.\n|^[0-9]..\.\n', line)]

lines3 = lines2

for i in tmp2:
     lines3[i+2] = "1. " + lines2[i+2]
     lines3[i] = ""
     lines3[i+2]
     lines3[i]

for line in lines2:
    line2 = line.replace(author, '**' + author + '**')
    line2 = line2.replace('doi:[', '[doi:')
    line2 = re.sub('pre\[\]{#ref-.*}', '', line2)

    if os.path.exists(outfname):
        # yes -> overwrite
        outfp = open(outfname, "a")
    else:
        # no -> new file
        outfp = open(outfname, "w")

    outfp.write(line2)
