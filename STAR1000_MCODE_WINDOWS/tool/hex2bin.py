#!/usr/bin/python
import sys, os
import struct

assert len(sys.argv) > 1
hex_name = sys.argv[1]
#hex_name = 'itfc.hex'
hex_file = open(hex_name, 'r')

bin_name = '%s.bin' % hex_name.split('.')[0]
bin_file = open(bin_name, 'wb')
bin_list = []

for line in hex_file.readlines():
    dword = int(line[6:8], 16)
    bin_list.append(dword)
    dword = int(line[4:6], 16)
    bin_list.append(dword)
    dword = int(line[2:4], 16)
    bin_list.append(dword)
    dword = int(line[0:2], 16)
    bin_list.append(dword)

bin_file.write(bytearray(bin_list))
bin_file.close()
hex_file.close()
