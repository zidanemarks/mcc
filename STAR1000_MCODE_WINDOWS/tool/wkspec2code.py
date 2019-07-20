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
parser.add_option('-e', '--spec', action='store', dest='spreadsheet', help='Source Worker Command Spec spreadsheet')
parser.add_option('-w', '--wkc', action='store', dest='workercode', help='Source worker code')
parser.add_option('-x', '--hex', action='store', dest='hexfile', help='Source worker hex')
#parser.add_option('-s', '--svh', action='store', dest='svhfile', help='Source worker svh')
parser.add_option('-s', '--svh_header', action='store', dest='svh_header_file', help='Source worker svh header')
parser.add_option('-b', '--bin_dir', action='store', dest='bin_dir', help='please set bin directory')
(options, args) = parser.parse_args()
name = options.spreadsheet
print 'Parsing Spec File: %s' % (name)
workercode = options.workercode
print 'Source Worker Code: %s' % (workercode)
hexfile = options.hexfile
print 'Source HEX Code: %s' % (hexfile)
#svhfile = options.svhfile
#print 'Source SVH Code: %s' % (svhfile)
svh_header_file = options.svh_header_file
print 'Source SVH Header Code: %s' % (svh_header_file)


class INSTRUCTION: pass
class BITFIELD: pass

value_table={}
intf_cmd_table={}
instr_description_table={}
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
            #print 'Found Instruction(%s), val(%d)' % (inst_pool[inst_name].inst_name,  inst_pool[inst_name].inst_val)
        #    for i in  inst_pool[inst_name].fields:
                #print 'Found Field(%s), start_bit(%d), bit_width(%d)' % (inst_pool[inst_name].fields[i].field_name, inst_pool[inst_name].fields[i].start_bit, inst_pool[inst_name].fields[i].bit_width) 
                
        else:
           # empty line
           continue

#############################################
#generate CMD template file
wkc_temp_list = []
for wk_i in  inst_pool:
    wkc_temp_list.append('%0s' %  inst_pool[wk_i].inst_name)
    if ( inst_pool[wk_i].inst_name != 'IE'):
        wkc_temp_list.append('(' )
        fields = inst_pool[wk_i].fields
        #print fields
#        for j in fields:
#            field_name = fields[j].field_name
#            offset     = fields[j].start_bit
#            bitwidth   = fields[j].bit_width
        sorted_fields = sorted(fields.items(), key = lambda item: item[1])
        #print sorted_fields
        for bitfield in sorted_fields:
            field_name = bitfield[0]  #key
            offset     = bitfield[1].start_bit
            bitwidth   = bitfield[1].bit_width
            wkc_temp_list.append('.%0s' %  field_name)
            wkc_temp_list.append('([%0d+:%0d])' %  (offset, bitwidth))
            wkc_temp_list.append(', ')
        wkc_temp_list.pop()
        wkc_temp_list.append(')\n' )
    else:
        wkc_temp_list.append('\n' )
wkc_temp_list.append('RESERVED_CMD\n' )

#print wkc_temp_list
wkc_temp_name = '%s.wkc_template' % name
if True == os.path.exists(wkc_temp_name):
    os.remove(wkc_temp_name)
with open(wkc_temp_name, 'w') as wkc_temp_file:
    wkc_temp_file.writelines(wkc_temp_list)

################################################################
# generating HEXFILE from worker code 
# generating SVH header file from original svh file
################################################################
if workercode != None :
    hex_list = []
    svh_head_list = []
    inst_no = 0;
    instr_line_num = 0
    with open(workercode, 'r') as wkcfile:
        for line in wkcfile.readlines():
            instr = line.split()
            if len(instr) == 0:
              continue
            elif '//L' in instr[0]:
                instr_line_num = 0
                svh_head_list.append(line)
                #CHK1: when an instruction seperation is found, 
                #      check the hex file is multiple of 16
                assert (len(hex_list)%16 == 0) , 'HEX FILE is not correct when %s is found' % instr[0]
                continue
            elif '//' in instr[0]:
                #remove comments
                continue
            elif '=' in line:
                svh_head_list.append(line) 
#            #remove comment first
#            line = line.split('//')[0]
            # remove unused seperation
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
    
            #assign
            if '=' in line:
                line = line.replace(" ", "")
                #print line
                assign = line.split('=')
                if len(assign) == 2:
                    value_table[assign[0]] = assign[1]
                    continue
    
            #generate code for this instruction
            code_line = line.split()
            # detect worker instruction start: line start with "//L"
            if len(code_line) == 0:
                #skip empty lines
                continue
            #print line
    
    
            #assemble line
            #print line
            seg_list = []
            instr_val = 0
            instr_start=0
            instr_end=0
            for segment in code_line:
                if (instr_start == 0) :
                    if (segment == 'RESERVED_CMD'):
                        instr_start = 1
                        instr_line_num += 1
                        instr_end = 1
                        instr_val = 0
                        curr_inst = INSTRUCTION()
                        curr_inst.inst_name = 'RESERVED'
                        break
                    elif segment in inst_pool.keys():
                            #instruction OP
                            curr_inst = inst_pool[segment]
                            instr_val = curr_inst.inst_val
                            instr_start = 1
                            instr_line_num += 1
                            #print 'current instruction is (%s)' % (curr_inst.inst_name)
                            if (curr_inst.inst_name == 'IE'):
                                instr_end = 1
                                break
                else:
                    if segment in curr_inst.fields.keys():
                        curr_field = curr_inst.fields[segment]
                        #print 'current field is (%s)' % (curr_field.field_name)
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
            if (instr_start):
                if (curr_inst.inst_name == 'CL'):
                    #CHK 3: when CL is found, make sure the current instruction is less than 16 line
                    assert (instr_line_num < 16), 'CL command is found at line %d' % instr_line_num
                    instr_end = 1    
                hex_list.append("%08x\n" % instr_val)
            if (instr_end):
                #CHK 4: when instruction is ended, make sure the current instruction is no more than 16 line
                assert (instr_line_num <= 16), 'Line number of current instruction(%d) is more than 16 line ' % instr_line_num
                inst_len = len(hex_list)%16
                #print 'hex_list length at end of instruction(%d) is %d' % (inst_no, inst_len)
                inst_no += 1
                if (inst_len >0):
                    for i in range( inst_len ,16):
                        hex_list.append("%08x\n" % 0)
                #print hex_list
            
    #for i in range(0, (len(hex_list)/16)):
        #print 'inst(%d), %s' % (i, hex_list[i*16:i*16+15])
    hex_name = '%s_wkc.hex' % workercode.split('.')[0]
    
    if True == os.path.exists(hex_name):
        os.remove(hex_name)
    
    with open(hex_name, 'w') as hex_file:
        hex_file.writelines(hex_list)

    # generate SVH header files

    svh_head_name = '%s_template.svh' % workercode.split('.')[0]
    if True == os.path.exists(svh_head_name):
        os.remove(svh_head_name)
    with open(svh_head_name, 'w') as svh_head_file:
        svh_head_file.writelines(svh_head_list)


################################################################
# Covert Worker HEX code to WKC and SVH
################################################################
if hexfile != None:
    wkc_list = []
    svh_list = []
    # print header for SVH
    if svh_header_file == None:
        svh_header_file = '%s_template.svh' % hexfile.split('.')[0]
    with open(svh_header_file, 'r') as svh_h_file:
        for line in svh_h_file.readlines():
            #assign
            if '//L' in line:
                instr_key = line.split(" ")[0] 
                instr_key = instr_key.replace('//L', "")
                instr_description_table[int(instr_key)] = line
                continue
            elif '=' in line:
                svh_list.append(line)
                wkc_list.append(line)
                line = line.split('//')[0]
                line = line.replace(" ", "")
                line = line.replace("\t", "")
                line = line.replace("\n", "")
                line = line.replace(";", "")
                #print line
                assign = line.split('=')
                if len(assign) == 2:
                    if (assign[0].find('C_ITF') >=0):
                        intf_cmd_table[int(assign[1])] = assign[0]  
                        print intf_cmd_table
                


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
                            if (instr_description_table.has_key(cmd_no)):
                                wkc_list.append(instr_description_table[cmd_no])
                                svh_list.append(instr_description_table[cmd_no])
                            else:
                                wkc_list.append('//L%0d\n' %  cmd_no)
                                svh_list.append('//L%0d\n' %  cmd_no)
                        wkc_list.append('%0s' %  inst_pool[i].inst_name)
                        if ( inst_pool[i].inst_name != 'IE'):
                            cmd_end = 0;
                            wkc_list.append('(' )
                            fields = inst_pool[i].fields
                            sorted_fields = sorted(fields.items(), key = lambda item: item[1])
                            for bitfield in sorted_fields:
                                field_name = bitfield[0]  #key
                                offset     = bitfield[1].start_bit
                                bitwidth   = bitfield[1].bit_width
                                field_val = (line_value/(1<<offset)) % (1<<bitwidth)
                                wkc_list.append('.%0s' %  field_name)
                                # more readable
                                if (field_name == 'DQ_PAT'):
                                    wkc_list.append('(%d\'h%0X)' %  (bitwidth, field_val))
                                elif (((field_name == 'CMD_PRE') or (field_name == 'CMD_VALID')) and (len(intf_cmd_table) >0)):
                                    #print 'intf_cmd value(%d)' % field_val
                                    #print 'intf_cmd has key(%s)' % (intf_cmd_table.get(field_val))
                                    if (intf_cmd_table.has_key(field_val)):
                                        wkc_list.append('(%s)' % (intf_cmd_table[field_val])) 
                                    else:
                                        wkc_list.append('(%0d)' %  field_val)
                                else:
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
    svh_name = '%s_wkc.svh' % hexfile.split('.')[0]
    if True == os.path.exists(svh_name):
        os.remove(svh_name)
    with open(svh_name, 'w') as svh_file:
        svh_file.writelines(svh_list)
