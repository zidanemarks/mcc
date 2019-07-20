#!/usr/bin/python

################################################################
# a tool to generate hex/wkc/svh files from spec(Excel)/hex/wkc/svh
#
# USAGE: 
#
# Contact: Gang.Lin@starblaze-tech.com
################################################################

import os
import sys
import xlrd
from optparse import OptionParser

parser = OptionParser()
parser.add_option('-e', '--spec', action='store', dest='spreadsheet', help='Store registers spreadsheet')
parser.add_option('-w', '--wkc', action='store', dest='workercode', help='Store worker code')
parser.add_option('-x', '--hex', action='store', dest='hexfile', help='Store worker hex')
parser.add_option('-s', '--svh', action='store', dest='svhfile', help='Store worker svh')
parser.add_option('-b', '--bin_dir', action='store', dest='bin_dir', help='please set bin directory')
(options, args) = parser.parse_args()
name = options.spreadsheet
print 'Parsing Spec File: %s' % (name)
workercode = options.workercode
print 'Source Worker Code: %s' % (workercode)
hexfile = options.hexfile
print 'Source HEX Code: %s' % (hexfile)
svhfile = options.svhfile
print 'Source SVH Code: %s' % (svhfile)


class INSTRUCTION: pass
class BITFIELD: pass

value_table={}
base_table = {}
base_table['d'] = 10
base_table['h'] = 16
base_table['b'] = 2

reserved_keyword = {
    #keyword           : mandetory
    'Inst'       : True,
    'AddressWidth'     : True,
    'Description'      : False,
    'FileName'         : True,
    'RegisterWidth'    : True,

    'Offset'           : True,
    'Size'             : False,
    'Qty'              : True,
    'Width'            : True,
    'Type'             : False,
    'Name'             : True,
    'Parameter'        : False,

    'SectionPrefix'    : True,
    'IPName'           : True,

    'Comments'         : False,
    'Bits'             : True,
    'HW'               : False,
    'SW'               : False,
    'Default'          : False,
    'Quantity'         : False,
}

#####unify the value of all cells
####def cell_assign_value(s, attr_c, value_c):
####    assert attr_c.ctype == 1 and attr_c.value in reserved_keyword, \
####        'EXCEL sheet %s: wrong keyword %s' % (s.name, attr_c.value)
####    assert value_c.ctype != 0 or reserved_keyword[attr_c.value] == False, \
####        'EXCEL sheet %s: value is mandetory for keyword %s' % (s.name, attr_c.value)
####    value = value_c.value
####    if value_c.ctype == 2:
####        #number
####        value = int(value)
####    elif len(value)<11 and len(value)>3 and value[0]=='0' and \
####        (value[1]=='x' or value[1]=='X'):
####        #hex number string
####        value = int(value, 16)
####    elif attr_c.value == 'SW':
####        value = value.lower()
####    else:
####        #unicode
####        value = value
####
####    return value
####

###############################################################
def convert_bit_field(bf):
    pair = bf.split(':')
    if len(pair) == 1:
        pair.append(pair[0])
    start = int(pair[1])
    end = int(pair[0])
    return start, end-start+1

################################################################
def get_int(val):
    base = 10
    data = val
    l = val.split("\'")
    if "\'" in val:
        width = int(l[0])
        base = base_table[l[1][0].lower()]
        data = l[1][1:]
           #check value
           #print data, base
    value = int(data, base)
    return value


################################################################
# collect data in excel file into python classes:
################################################################
#get the excel file from commond line
file = xlrd.open_workbook(name)
#find the active table 
sheet = file.sheet_by_name("WORKER MICRO CODE")

#collecet instruction pool
inst_pool={}
inst_start = 0;
for r in range(sheet.nrows):
    row = sheet.row(r)
    #print 'checking row(%s) position(%d)' % (row, r) 
    if (inst_start == 0):
        for c in range(sheet.ncols):
            if (row[c].value == u'inst'):
                start_col = c
                inst_head = r
                inst_start = 1
                #print 'found start position(%d, %d)' % (inst_head, start_col) 
                break
    else:
        if (row[start_col].ctype == 1):
            inst_name = row[start_col].value.upper()
            inst_val  = int(row[start_col+2].value, 16)
            inst_pool[inst_name] = INSTRUCTION()
            fields = {};
            setattr(inst_pool[inst_name], "inst_name", inst_name) 
            setattr(inst_pool[inst_name], "inst_val", inst_val)
            for c in range(start_col+3, sheet.ncols):
                #print 'checking cell[%d][%d] value(%s)' % (r,c,row[c].value) 
                if (row[c].value == 1):
                    if (sheet.cell(inst_head, c).ctype == 1):   
                        field_name =  sheet.cell(inst_head, c).value.upper()
                        start_bit, bit_width = convert_bit_field(sheet.cell(inst_head+1, c).value)
                        field = BITFIELD()
                        setattr(field, 'field_name', field_name)
                        setattr(field, 'start_bit',  start_bit)
                        setattr(field, 'bit_width',  bit_width)
                        fields[field_name] = field;
            setattr(inst_pool[inst_name], 'fields', fields)
            print 'Found Instruction(%s), val(%d)' % (inst_pool[inst_name].inst_name,  inst_pool[inst_name].inst_val)
            for i in  inst_pool[inst_name].fields:
                print 'Found Field(%s), start_bit(%d), bit_width(%d)' % (inst_pool[inst_name].fields[i].field_name, inst_pool[inst_name].fields[i].start_bit, inst_pool[inst_name].fields[i].bit_width) 
                
        else:
           # empty line
           continue

################################################################
# generating worker code
################################################################
if workercode != None :
    hex_list = []
    inst_no = 0;
    with open(workercode, 'r') as wkcfile:
        for line in wkcfile.readlines():
            #remove comment first
            line = line.split('//')[0]
            line = line.replace("\t", " ")
            line = line.replace("\n", "")
            line = line.replace("{", "")
            line = line.replace("}", "")
            line = line.replace("(", " ")
            line = line.replace(")", "")
            line = line.replace(";", "")
            line = line.replace(",", " ")
            line = line.replace(".", " ")
            line = line.upper()
    
    
            #generate code for this instruction
            instr = line.split()
            if len(instr) == 0:
                #skip empty lines
                continue
            #print line
    
            #assign
            if '=' in line:
                line = line.replace(" ", "")
                #print line
                assign = line.split('=')
                if len(assign) == 2:
                    value_table[assign[0]] = assign[1]
                    continue
    
            #assemble line
            #print line
            seg_list = []
            instr_val = 0
            instr_start=0
            instr_end=0
            code_line = line.split()
            for segment in code_line:
                if (instr_start == 0) :
                    if (segment == 'RESERVED_CMD'):
                        instr_start = 1
                        instr_end = 1
                        instr_val = 0
                        curr_inst = INSTRUCTION()
                        curr_inst.inst_name = 'RESERVED'
                        break
                    else:
                        if segment in inst_pool.keys():
                            #instruction OP
                            curr_inst = inst_pool[segment]
                            instr_val = curr_inst.inst_val
                            instr_start = 1
                            print 'current instruction is (%s)' % (curr_inst.inst_name)
                            if (curr_inst.inst_name == 'IE'):
                                instr_end = 1
                                break
                else:
                    if segment in curr_inst.fields.keys():
                        curr_field = curr_inst.fields[segment]
                        print 'current field is (%s)' % (curr_field.field_name)
                        val_index = code_line.index(segment) +1;
                        field_seg = code_line[val_index] 
                        if field_seg in value_table.keys():
                            field_val = get_int(value_table[field_seg])
                        else:
                            field_val = get_int(field_seg)
                        #print 'current field val is index(%0d) (%s)' % (val_index, field_val)
                        offset =  curr_inst.fields[segment].start_bit
                        bitwidth = curr_inst.fields[segment].bit_width
                        #print 'current field start_bit is (%0d), bit_width is (%0d) ' % (offset, bitwidth)
                        max_val = int(1<<bitwidth)
                        assert field_val < max_val , 'max is %d, field_val is %d' % (max_val, field_val)
                        instr_val += (field_val << offset)
                        #print 'current instr_val is (%08x)' % (instr_val)
            if (curr_inst.inst_name == 'CL'):
                instr_end = 1    
            if (instr_start):
                hex_list.append("%08x\n" % instr_val)
            if (instr_end):
                inst_len = len(hex_list)%16
                #print 'hex_list length at end of instruction(%d) is %d' % (inst_no, inst_len)
                inst_no += 1
                if (inst_len >0):
                    for i in range( inst_len ,16):
                        hex_list.append("%08x\n" % 0)
                #print hex_list
            
    #for i in range(0, (len(hex_list)/16)):
        #print 'inst(%d), %s' % (i, hex_list[i*16:i*16+15])
    hex_name = '%s.hex' % workercode.split('.')[0]
    
    if True == os.path.exists(hex_name):
        os.remove(hex_name)
    
    with open(hex_name, 'w') as hex_file:
        hex_file.writelines(hex_list)


################################################################
# Covert Worker HEX code to WKC and SVH
################################################################
if hexfile != None:
    wkc_list = []
    svh_list = []
    # print header for SVH
    svh_list.append('C_OP_ICD   = 4\'h0;         //Issuse Command direct\n')
    svh_list.append('C_OP_IC    = 4\'h1;         //Issuse Command\n')
    svh_list.append('C_OP_WC    = 4\'h2;         //Waite Cycles\n')
    svh_list.append('C_OP_WI    = 4\'h3;         //Write Interface\n')
    svh_list.append('C_OP_WIDDR = 4\'h4;         //Write Interface DDR\n')
    svh_list.append('C_OP_RI    = 4\'h5;         //Read Interface\n')
    svh_list.append('C_OP_RIDDR = 4\'h6;         //Read Interface DDR\n')
    svh_list.append('C_OP_CL    = 4\'h7;         //Change the instruction line\n')
    svh_list.append('C_OP_IE    = 4\'hf;         //Insreuction End\n')
    svh_list.append('C_PAGE_SIZE = 16\'d8800;\n')
    svh_list.append('C_SECTOR_SIZE = 16\'d1100;\n')
    svh_list.append('C_SDR_PAGE_SIZE = 16\'d17600;\n')
    svh_list.append('C_SDR_SECTOR_SIZE = 16\'d2200;\n')
    svh_list.append('\n')


    hex_line = 0
    with open(hexfile, 'r') as wkhexfile:
        cmd_no = 0
        cmd_end = 1
        for line in wkhexfile.readlines():
            line_value = int(line, 16)
            if line_value == 0:
                #print 'in cmd %d, hex_line is %d\n' % (cmd_no, hex_line)
                if (hex_line % 16 == 0):
                    print 'inserting RESERVED_CMD in cmd %d, hex_line is %d\n' % (cmd_no, hex_line)
                    wkc_list.append('//L%0d\n' %  cmd_no)
                    svh_list.append('//L%0d RESERVED COMMAND \n' %  cmd_no)
                    cmd_no+=1
                    wkc_list.append('RESERVED_CMD\n') 
                svh_list.append('{32\'h0},\n')
                hex_line+=1
                continue
            else:
                hex_line+=1
                cmd = line_value % 16
                for i in inst_pool:
                    if (cmd == inst_pool[i].inst_val):
                        # found command in spec
                        if cmd_end:
                            wkc_list.append('//L%0d\n' %  cmd_no)
                            svh_list.append('//L%0d\n' %  cmd_no)
                        wkc_list.append('%0s' %  inst_pool[i].inst_name)
                        if ( inst_pool[i].inst_name != 'IE'):
                            cmd_end = 0;
                            wkc_list.append('(' )
                            for j in inst_pool[i].fields:
                                field_name =  inst_pool[i].fields[j].field_name
                                offset  =   inst_pool[i].fields[j].start_bit
                                bitwidth = inst_pool[i].fields[j].bit_width
                                field_val = (line_value/(1<<offset)) % (1<<bitwidth)
                                wkc_list.append('.%0s' %  field_name)
                                wkc_list.append('(%0d)' %  field_val)
                                wkc_list.append(', ')
                            wkc_list.pop()
                            wkc_list.append(')\n' )
                            if ( inst_pool[i].inst_name == 'CL' ) or (hex_line % 16 == 0):
                                cmd_end = 1;
                                cmd_no+=1
                        else:
                            wkc_list.append('\n' )
                            cmd_end = 1;
                            cmd_no+=1
                        # generate svh line
                        svh_list.append('{')
                        svh_list.append('8\'h%x, ' % int(line_value/(1<<24))) # 32:24
                        svh_list.append('4\'h%x, ' % int(line_value/(1<<20) % (1<<4))) # 23:20
                        svh_list.append('8\'h%x, ' % int(line_value/(1<<12) % (1<<8))) # 19:12
                        svh_list.append('8\'h%x, ' % int(line_value/(1<<4 ) % (1<<8))) # 11:4
                        svh_list.append('C_OP_%s},\n ' % (inst_pool[i].inst_name)) # CMD
                        break
    #print wkc_list
    wkc_name = '%s.wkc' % hexfile.split('.')[0]
    if True == os.path.exists(wkc_name):
        os.remove(wkc_name)
    with open(wkc_name, 'w') as wkc_file:
        wkc_file.writelines(wkc_list)

    #print svh_list
    svh_name = '%s.svh' % hexfile.split('.')[0]
    if True == os.path.exists(svh_name):
        os.remove(svh_name)
    with open(svh_name, 'w') as svh_file:
        svh_file.writelines(svh_list)
