#!/usr/bin/python

import re
import sys

for line in sys.stdin:
   line = line.strip()
   (userid, gender, age, occupation, zip) = line.split("::")
   print "%s\t%s\t%s\t%s\t%s" % (userid, gender, age, occupation, zip)
