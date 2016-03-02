#!/usr/bin/python

import re
import sys

for line in sys.stdin:
   line = line.strip()
   (userid, movieid, rating, timestamp) = line.split("::")
   print "%s\t%s\t%s\t%s" % (userid, movieid, rating, timestamp)
