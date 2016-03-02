@echo off
title "Python27 Development - Bryan Mack"


:: Append path to editor and python distributions
set PATH=%PATH%;"C:\Program Files\Sublime Text 2\"
set PATH=%PATH%;"C:\Python27"
set PATH=%PATH%;"C:\Python27\Scripts"


:: Commands
DOSKEY sublime=sublime_text $*