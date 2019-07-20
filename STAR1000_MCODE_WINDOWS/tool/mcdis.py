#!/usr/bin/python
from mcas import *

class Line:
    def __init__(self, instr):
        self.op = instr%0x100
        self.instr = instr

    def __str__(self):
        return "%x, %d" % (self.instr, self.label)


dis_table = {}
label_set = set()
instr_list = []

#entry
assert len(sys.argv) > 2
hex_name = sys.argv[1]
dis_name = sys.argv[2]
dis_file = open(dis_name, 'w')

#build disassemble table from instruction table
for key, value in instr_table.iteritems():
    op, param, notes = value
    dis_table[op] = (key, param)

#load the hex file
with open(hex_name, 'r') as f:
    for l in f.readlines():
        instr = int(l, 16)
        instr_list.append(Line(instr))

#scan instr list to mark label of address
for instr in instr_list:
    if instr.op in (5, 6, 9, 29):
        addr = instr.instr>>20
        #print hex(instr.instr), addr
        label_set.add(addr)

#print label_set
#generate disasseble
for l in range(len(instr_list)):
    instr = instr_list[l]
    op, param = dis_table[instr.op]
    lstring = ''
    dis_line = ''

    #lable
    if l in label_set:
        lstring = 'LABLE_%x:' % l
    dis_line += "%-12s" % lstring

    #op
    dis_line += "%-8s\t" % op

    #parameters
    code = instr.instr
    if param != '':
        for seg in param.split(','):
            #get the value of one segment
            start, name, end = seg.split('|')
            start = int(start)
            end = int(end)
            value = code % (1<<(end+1))
            value = value>>start

            #generate code for the segment
            if 'reg' in name:
                dis_line += "r%d, " % value
            elif name == 'addr':
                dis_line += "LABLE_%x, " % value
            else:
                dis_line += "%d, " % value

        #remove the last ', '
        dis_line = dis_line[:-2]

    dis_file.write("%s\n" % dis_line)

dis_file.close()
