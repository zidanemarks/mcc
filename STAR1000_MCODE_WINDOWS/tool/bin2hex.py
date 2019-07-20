#!/usr/bin/python
import sys, os

print sys.argv[1], sys.argv[2]

of = open(sys.argv[2], 'w')

with open(sys.argv[1], 'rb') as f:
    dw = f.read(4)
    while dw:
        b = dw.encode('hex')
        if sys.byteorder == 'little':
            s = "%c%c%c%c%c%c%c%c\n" % \
                (b[6], b[7], b[4], b[5], b[2], b[3], b[0], b[1])
        else:
            s = "%s\n" % b
        of.write(s)
        dw = f.read(4)

of.close()
