'''input
8
3
5
html text/html
png image/png
gif image/gif
animated......gifs
portrait.pNg
index.Html
a
.
'''
import sys
import math


a=input()
n = int(raw_input())  # Number of elements which make up the association table.
q = int(raw_input())  # Number Q of file names to be analyzed.

dictio={}
for i in range(n):
    # ext: file extension
    # mt: MIME type.
    ext, mt = raw_input().split()
    dictio[ext] = mt
for i in range(q):
    fname = raw_input()  # One file name per line.
    if "." in fname:
	    index = len(fname)-fname[::-1].index(".")
	    fext=fname[index:].lower()
	    if fext in dictio:
		    print(dictio[fext])
	    else:
	    	print("UNKNOWN")
    else:
		print("UNKNOWN")