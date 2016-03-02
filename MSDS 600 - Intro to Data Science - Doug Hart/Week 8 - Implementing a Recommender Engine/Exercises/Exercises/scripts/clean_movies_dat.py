#!/usr/bin/python

import re
import sys

catlist = {"Action":"1","Adventure":"2","Animation":"3","Children's":"4","Comedy":"5","Crime":"6","Documentary":"7","Drama":"8","Fantasy":"9","Film-Noir":"10","Horror":"11","Musical":"12","Mystery":"13","Romance":"14","Sci-Fi":"15","Thriller":"16","War":"17","Western":"18","None":"99"}

# Regular expression to match year in title
pattern = re.compile(r"^(.*) \((.*)\)$")

for line in sys.stdin:
   line = line.strip()
   (movieid, title, genres) = line.split("::")

# Extract the year
   res = pattern.match(title)
   if res:
      year = res.group(2)
   else:
      year = 9999;

# Convert categories from String to Int
   newcat=[]
   categories = genres.split("|")
   for category in categories:
      newcat.append(catlist[category])
   #if len(newcat) > 1:
   newcat=",".join(newcat)

# Print the record
# \001 is hive native field delimiter, \002 is native array element delimiter
   print "%s\t%s\t%s\t%s" % (movieid, title, year, newcat)
