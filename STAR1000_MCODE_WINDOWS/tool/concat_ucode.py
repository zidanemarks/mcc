#!/usr/bin/python
import sys
# manager_instr_base = 0x400
manager_instr_base = int(sys.argv[4])
# print "system_argv[4]=%4x, base=%4x" %(sys.argv[4],manager_instr_base)
# print "system_argv[4]=%4x" %(int(sys.argv[4]))
instr_ram_depth = 4096
# f_read = open("itfc.hex", 'r')
# f_write = open("mcode_intruction.hex", 'w')
f_read = open(sys.argv[1], 'r')
f_write = open(sys.argv[3], 'w')
i = 0
## itfc
for line in f_read.readlines() :
    if(i < manager_instr_base) :
        f_write.write(line)
    i=i+1
temp = i
print i
for i in range(temp, manager_instr_base) : 
    f_write.write("00000000\n")
##
print i
f_read.close()
f_read = open(sys.argv[2], 'r')
for line in f_read.readlines() :
    if(i < instr_ram_depth) :
        f_write.write(line)
    i=i+1
temp = i
print i
for i in range(temp, instr_ram_depth) : 
    f_write.write("00000000\n")
f_write.close()
