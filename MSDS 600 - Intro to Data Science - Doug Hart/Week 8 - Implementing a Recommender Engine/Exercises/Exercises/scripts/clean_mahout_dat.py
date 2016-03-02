#!/usr/bin/python

import re
import sys

for line in sys.stdin:
   line = line.strip()
   (userid, movieid, rating, timestamp) = line.split("::")
   print "%s,%s,%s" % (userid, movieid, rating)
