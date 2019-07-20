#!/usr/bin/python
#assembler of MCNFC

import sys
import os
import pdb
#pdb.set_trace()

#define list
def_list=[];
debug_log=[];
macro_fsm =0;    ## macro off   ( `endif ) = 0;
                 ## macro_on    ( `ifdef ) NO DEFINE  = 1; IS DEFINE   = 2
                 ## macro_else  ( `else  ) ELSE_IS_NOT= 3; ELSE_IS_OK  = 4
                 ## Summary: even num could compile, odd num not compile
#definition of instructions
instr_table = {
'nop'   : (0,   '',
                'no operation'),

'setb'  : (1,   '8|reg|11, 12|val|15',
                'register[reg]=val'),

'sets'  : (2,   '8|lun|11, 12|group|15, 16|val|19',
                'lun=0 self 1 peer;group=rr group, ff=en; val=1,0'),

'incptr': (3,   '8|ctrl|11, 16|val|31',
                'nand instruction buffer rptr++'),

'matop' : (4,   '8|reg|11, 12|op|15, 16|offset|19, 20|offset_mask|23',
                'register[reg]=(nand_instr[rptr+offset][op])==op)? 1:0'),

'jnz'   : (5,   '20|addr|31, 8|reg|11, 12|force|15',
                'if(register[reg]==1 || force==1) goto addr'),

'wk'    : (6,   '8|line|15, 16|en|19, 20|addr|31',
                'en[0]:status enable;en[1] data enable;en[2]: on busy yield, en[3]: no stuck to end, if(yield) pc=addr'),

'yield' : (7,   '',
                'yield thread, increase pc'),

'stacp' : (8,   '8|reg|11, 12|neg|15, 16|sta|19',
                'register[reg]=(neg==1)? ~status[sta]:status[sta]'),

'reti'  : (9,   '8|ctrl|11, 12|rs|15, 16|offset|19, 20|addr|31',
                'ctrl[0]==1, valid the block page as recode; ctrl[1]==1,on busy yield and jump to addr, ctrl[2]==1  update the wptr, rs= return status'),

'setp'  : (10,  '8|id|11, 12|shf|15, 16|sector_offset|19',
                'id: sector=0,page=1,block=2,lun=3;shf:right shit value if id;sector_offset:with sector id to read which 2k data'),

'setpr' : (11,  '8|ctrl|11, 12|breg|15, 16|l|23, 24|h|31',
                'ctrl=0 register[breg], ctrl=1 Sector, ctrl=2 Page, ctrl=3 Block, lun; register[breg]:value to set;l:LSB of set param;h:MSB of set param'),

'pbulc' : (12,  '8|reg|11, 12|op|15, 16|ulvl|23',
                'register[reg]=pbuf_lock; pbuf_lock=!((pbuf_lock==0 && op==0) || !(op==1)) , ulvl=unlock level'),

'pbreq' : (13,  '12|ctrl|15, 16|offset|19, 20|offset_mask|23',
                'send nand_instr[rptr+offset] to user prog'),

'cklvl' : (14,  '8|reg|11, 12|sel|15, 16|level|31',
                'register[reg]=(sel==0) ? (pbuf_level<level) : (cbuf_level>level)'),

'ckrpb' : (15,  '8|reg|11, 16|offset|19, 20|offset_mask|23',
                'check read page/block is pervious cached or not, reg=1,cached'),

'matcl' : (16,  '8|reg|11, 12|ctrl|19, 20|ctrl_mask|27, 28|offset|30, 31|offset_mask|31',
                'register[reg]=(nand_instr[rptr+offset][ctrl])==ctrl)? 1:0'),

'gclvl' : (17,  '8|reg|11, 12|val|15',
                'register[reg]=(nand_cmd_level>bal)? 1:0'),

'cpphy' : (18,  '16|offset|19, 20|offset_mask|23',
                'copy phyaddr, block, plane, page in phyaddr register'),

'ckphy' : (19,  '8|reg|11, 12|neg|15, 16|offset|19, 20|ctrl|23, 24|nonequal|27',
                'register[reg]=(phyaddr.section==nand_instr[rptr+offset][phy.section])? ~neg :neg ; crtl=0->page,1->plane, 2->block'),

'tmrst' : (20,  '',
                'clear current timer'),

'tmrea' : (21,  '8|reg|11, 12|val|31',
                'register[reg]=(lun_timer->=val)? 1:0;'),

'mlctl' : (22,  '8|en|11',
                'all mate luns status set'),

'mlidl' : (23,  '8|reg|11',
                'mate lun idle check'),

'offst' : (24,  '16|offset|19, 20|ctrl|23',
                'offst=offset'),

'ccbyt' : (25,  '12|breg|15, 16|offset|19, 20|offset_mask|23',
                'copy nandinstructon control byte to byte operation of register'),

'sbyt'  : (26,  '12|breg|15, 16|bval|23',
                'register[breg]=bval'),

'cmbyt' : (27,  '8|reg|11, 12|breg1|15, 16|breg2|19',
                'register[reg]=(register[breg1]==register[breg2])'),

'adbyt' : (28,  '8|ctrl|11, 12|breg1|15, 16|breg2|19, 20|bregr|23, 24|imm|31',
                'ctrl==0 register[bregr]=(register[breg1]+register[breg2]); else reg[bregr]=reg[breg1]+imm'),

'calre' : (29,  '8|ctrl|11, 20|addr|31',
                'ctrl==0 call, copy pc+1 to register[31:16] and jump;else copy register[31:16] to pc'),

'not'   : (30,  '8|reg|11',
                'register[reg]=~register[reg]'),

'end'   : (31,  '',
                'end thread, reset pc'),

'sar'   : (32,  '12|ctrl|15, 16|value|23',
                'set aux register'),

'adar'  : (33,  '12|ctrl|15, 16|value|23',
                'add aux register'),

'jne'   : (34,  '20|addr|31, 8|reg|11, 12|ctrl|15, 16|value|20',
                'jump not equal'),

'stgpi' : (35,  '8|reg|11, 12|shift|15',
                'store thread gpi for power loss or specific ctrl'),

'setpc' : (36,  '8|breg|12, 16|l|23, 24|h|31',
                'cmd[breg]:value to set;l:LSB of set param;h:MSB of set param'),

'setce' : (37,  '8|index|15, 16|ctrl|19, 20|l|23, 24|h|27',
                'select certain ce;index for ce;force:force to select the ce'),

'cpqs'  : (38,  '8|reg|11, 12|queue|15',
                'copy queue status to reg;'),

'setq'  : (39,  '8|queue|11, 12|force|15',
                'set queue number;'),

'getq'  : (40,  '12|breg|15',
                'get queue number;'),

'gett'  : (41,  '12|breg|15',
                'get thread number;'),

'ccbit' : (42,  '8|bi|15, 16|l|23, 24|h|31',
                'copy cmd bit to reg;'),

'setgpo' : (43,  '8|ctrl|11, 12|breg|15',
                'set gpo value;'),

'setcpl' : (44,  '8|ctrl|11, 12|breg|15, 16|l|23, 24|h|31',
                'set cpl value;')                
                
}

value_table = {}
hex_list = []
src_list = []
current_address = 0
line_no = 0

def assemble_one_line(code_list, collect_value):
    global value_table
    code = []

    #opcode
    opcode, opdata, comment = instr_table[code_list[0]]
    code.append((0, 8, opcode))
    code_data = 0

    #opdata
    for d in opdata.split(','):
        code_data += 1
        if d == '':
            break
        start, field, end = d.split('|')
        wide = int(end)-int(start)+1
        offset = int(start)
        data = code_list[code_data]
        if unicode(data).isnumeric() == True:
            data = int(data)
        elif value_table.has_key(data):
            data = value_table[data]
        elif collect_value == True:
            data = 0
        else:
            raise ValueError('unknown symbol %s' % data)
        code.append((offset, wide, data))

    #code dword
    dword = 0
    for c in code:
        offset, width, value = c
        if value>=2**width:
            return False, 0
        value = value<<offset
        dword += value

    return True, dword


    return True

def macro_define_select(l,index) :
    global def_list
    global macro_fsm
    global debug_log
    line_def_list = []    ## parse line words
    extract_def = ""
    log = ""
    cur = 0               ## current if `ifdef `else `endif

    try:
        line_def_list = l.split()
        #
        if (len(line_def_list)>0 and line_def_list[0]=='`ifdef'):
            extract_def = line_def_list[1]
            if extract_def in def_list:
                macro_fsm = 2
                cur       = 1
                log = (index + macro_fsm)
                debug_log.append(log)
            else:
                macro_fsm = 1
                cur       = 1
                log = (index + macro_fsm)
                debug_log.append(log)
        elif (len(line_def_list)>0 and line_def_list[0]=='`else'):
            if (macro_fsm == 1):        ## ifdef NOT -> else OK
                macro_fsm = 4
                cur       = 1
                log = (index + macro_fsm)
                debug_log.append(log)
            else :   ## ifdef OK -> else NOT
                macro_fsm = 3
                cur       = 1
                log = (index + macro_fsm)
                debug_log.append(log)
        elif (len(line_def_list)>0 and line_def_list[0]=='`endif'):
            macro_fsm = 0
            cur       = 1
            log = (index + macro_fsm)
            debug_log.append(log)
        else:
            cur = 0
            log = (index + macro_fsm)
            debug_log.append(log)
    except:
        print ("mcas.py Except in macro_define_select, line=%s, line_num=%d") % (l,index)

    #print ("Debug in macro_define_select, last return cur=%d, macro_fsm=%d") % (cur,macro_fsm)
    return  cur, macro_fsm   ## return (current_is_directive, macro_fsm_or_off)


def assemble_file(filename, collect_value):
    global value_table
    global hex_list
    global src_list
    global line_no
    global current_address
    global src_label_list
    global label_line
    hex_list = []
    src_list = []
    src_label_list = []
    line_def_list = []
    current_address = 0
    line_no = 0
    label_line = ""
    label_comment = ""
    cur = 0
    macro = 0

    with open(filename, 'r') as mcfile:
        for l in mcfile.readlines():
            try:
                line_no += 1
                #print line_no

                #pdb.set_trace()

                #remove comment first
                line = l.rstrip()
                line = line.split('#')[0]
                line = line.replace(",", " ")
                line = line.replace("\t", " ")
                line = line.replace("\n", "")

                #add def_list in 2017/04/21
                
                line_def_list = l.split()
                if (len(line_def_list)>0 and line_def_list[0]=='`define'):
                    def_list.append(line_def_list[1])
                    #print ("Debug find `define=%s\n") % line_def_list[1]
                    #print ("total line =%s\n") % line_def_list
                    #print ("def list  =%s\n") % def_list
                    continue
                
                # check define macro
                #if (line_no == 650 and collect_value==False):
                #    pdb.set_trace()
                #print ("Debug define_select line=%s, line_no=%d") % (line,line_no)
                cur, macro =  macro_define_select(l,line_no)
                #print ("Debug print cur=%d, macro=%d") % (cur,macro)
                if ( cur == 1 ):  ## current line is directive  (`ifdef `else `endif)
                    continue
                elif ( cur==0 and macro==1 ):       ##ifdef FAIL
                    continue
                elif ( cur==0 and macro==3 ):       ##else FAIL
                    continue
                #else:
                    # current line should macro_fsm and go below

                # Post Direct Syntax, Lower Case
                line = line.lower()

                if collect_value == False:
                    #generate label, treated as a value
                    if ':' in line:
                        label_line, line = line.split(':')
                        #line = line.split(':')[1]
                        #src_label_list.append(label_line)
                        label_line = label_line.upper()
                        label_line = "            "+label_line+":"+"\n"
                        #print ("----> %s\n" % label_line)

                #generate code for this instruction
                #print line
                instr = line.split()
                if len(instr) == 0:
                    #skip empty lines
                    continue

                #assemble line
                if instr_table.has_key(instr[0]):
                    ret, code = assemble_one_line(line.split(), collect_value)
                    if ret == False:
                        print "code error line %d: %s" % (line_no, line)
                        return False

                    hex_list.append("%08x\n" % code)



                    #print ("The input code=%08x\n and =%s") % (code, type(code) )
                    #if (code==int('0x57f0005',16)) :
                    #if (current_address>=20) :
                    #    exit (0)




                    #src_list.append(l)   // original 

                    #src_label_list.append(l)
                    #print ("----> %s \n" % label_line)
                    src_list.append(label_line+l)
                    label_line = ""
                    #src_label_list.append("%s: %s" % label_line, l)
                    current_address += 1
                    #print line, current_address
                    continue

                if collect_value == True:
                    #generate label, treated as a value
                    if ':' in line:
                        #print ("1. line=%s") % line 
                        line = line.strip()
                        label = line.split(':')[0]
                        value_table[label] = current_address
                        #valid assemble code after lable prefix
                        #if line.split(':')[1] != '':
                        if l.strip().split(':')[1] != '':
                            #print ("There are string after label! Further Checking ... \nThe line=%d, the string=%s\n") % (current_address,l.replace("\n",""))

                            ## Refresh The input line (l)
                            line = l.lstrip()
                            line = line.replace("\t", " ")
                            line = line.lstrip()
                            #line = l.split(':')[1]

                            ## judge if successive is normal mcode or comments,
                            ## if normal mcode, current_address will increase by1
                            ## if comments, this will Keep unchanged
                            #print ("2. line=%s") % line 
                            label_comment = line.split(':',1)[1]
                            ## check if split is empty
                            if (len(label_comment)>0) :
                                label_comment=label_comment.replace("\t","").lstrip()
                            #print ("3. line_len=%d") % len(label_comment) 

                            if (len(label_comment)==0) :
                                current_address = current_address
                                #print ("Checking OK. There are empty space after label.\n") 
                            elif label_comment[0]=='#' :
                                current_address = current_address
                                #print ("Checking OK. There are commens after label: %s\n") % label_comment 
                            else :
                                print ("There are string after label! Further Checking ... \nThe line=%d, the string=%s\n") % (current_address,l.replace("\n",""))
                                print ("Checking Error. Please re-check below line and mcode\n")
                                current_address += 1
                                exit(1)
                            #print line, line.split(':')[1], current_address
                        continue

                    #assignment
                    line = line.replace(" ", "")
                    assign = line.split('=')
                    if len(assign) == 2:
                        value_table[assign[0]] = int(assign[1])
                        #print line
                        continue

                    print "cannot decode line %d: %s" % (line_no, l)
                    return False
            except:
                print "Error: line %d: %s" % (line_no, line)
                return False
        #end for l in mcfile.readlines():
        return True


if __name__ == '__main__':
    rtn_value = 0
    assert len(sys.argv) > 1
    source_name = sys.argv[1]

    hex_name = '%s.hex' % source_name.split('.')[0]
    if True == os.path.exists(hex_name):
        os.remove(hex_name)

    dis_name = '%s.dis' % source_name.split('.')[0]
    if True == os.path.exists(dis_name):
        os.remove(dis_name)
    #first time to collect value and label
    rtn_value = assemble_file(source_name, True)
    if True == rtn_value : ##assemble_file(source_name, True):
        #second time to refer label backward
        def_list=[]
        assemble_file(source_name, False)
        #print ("before write hex_list=%s") % hex_list
        if (macro_fsm>0) :
            print ("Error. Directive Syntax `endif maybe missing ! Macro FSM=%d") % (macro_fsm)
        with open(hex_name, 'w') as hex_file:
            hex_file.writelines(hex_list)
            
        #print ("before write src_list=%s") % src_list
        with open(dis_name, 'w') as dis_file:
            assert len(hex_list)==len(src_list)
            for i in range(len(hex_list)):
		    dis_file.write("0x%s : %s\n%s" % ((hex(i)[2:].zfill(8), hex_list[i][:8], src_list[i])))
    else:
        print ("Unexcept in parse file") 
        print type (rtn_value)   ## ("rtn_value=%d") % rtn_value
        #print ("hex_list=%s") % hex_list
        #print ("src_list=%s") % src_list
        #print hex_list
    #print value_table
    #print current_address

