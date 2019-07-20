#!/usr/bin/python
#assembler of interface micro-code

import sys
import os
import getopt

hex_list = []
value_table = {}
base_table = {}
base_table['d'] = 10
base_table['h'] = 16
base_table['b'] = 2
def_list = [];
debug_log=[];
macro_fsm =0;    ## macro off   ( `endif ) = 0;
                 ## macro_on    ( `ifdef ) NO DEFINE  = 1; IS DEFINE   = 2
                 ## macro_else  ( `else  ) ELSE_IS_NOT= 3; ELSE_IS_OK  = 4
                 ## Summary: even num could compile, odd num not compile

def help():
    print ("-------------------------------------------------------------------------")
    print ("Pseudo mcode compiler usage:")
    print ("        [-h | --help]                       print this help")
    print ("        [-d | --def]  MACRO_DEFINE          only support adding SINGLE macro definition")
    print ("        --define      +DEF_1+DEF_2+DEF_3    could support COMBINED MULTIPLE use of +define")
    print ("")    
    print ("Example 1: Print help                                                    ")    
    print ("")    
    print ("        ./mcitfc.py --help                                               ")    
    print ("                                                                         ")
    print ("Example 2: Add macro define                                              ")    
    print ("")    
    print ("        ./mcitfc.py c_worker_program_mode7.svh -d DEFINE_1 -d DEFINE_2 --def DEFINE_3 --def DEFINE_4 --define +DEFINE_5+DEFINE_6")    
    print ("                                                                         ")
    print ("Direct Sytax Supported in Source File:                                   ")
    print ("        `define                                                          ")
    print ("        `ifdef                                                           ")
    print ("        `else                                                            ")
    print ("        `endif                                                           ")

def parse_define_plus(plus_def) :
    global def_list
    #print ("capture=%s") % plus_def
    left_def = plus_def
    left_def = plus_def.split('+')[1:]
    def_list = def_list + left_def
    #print "lft=%s" % def_list
    print

def macro_define_select(l,index) :
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



def read_itfc_file(source_name):
    global  hex_list
    line_no = 0
    with open(source_name, 'r') as mcfile:
        for line in mcfile.readlines():
            line_no += 1
            #remove comment first
            line = line.split('//')[0]
            line = line.replace("\t", " ")
            line = line.replace("\n", "")
            line = line.replace("{", "")
            line = line.replace("}", "")
            line = line.replace(";", "")
            line = line.replace(",", " ")
    
   
            # Direct syntax function 
            #print("Debug Info: %s") % line
            line_def_list = line.split()
            if (len(line_def_list)>0 and line_def_list[0]=='`define'):
                def_list.append(line_def_list[1])
                #print ("Debug find `define=%s\n") % line_def_list[1]
                #print ("total line =%s\n") % line_def_list
                #print ("def list  =%s\n") % def_list
                continue
            
            cur, macro =  macro_define_select(line,line_no)
            #print ("Debug print cur=%d, macro=%d") % (cur,macro)
            if ( cur == 1 ):  ## current line is directive  (`ifdef `else `endif)
                continue
            elif ( cur==0 and macro==1 ):       ##ifdef FAIL
                continue
            elif ( cur==0 and macro==3 ):       ##else FAIL
                continue
            #else:
                # current line should macro_fsm and go below

            # Post Direct syntax, Lower Case
            line = line.lower()
 
            #generate code for this instruction
            #print line
            instr = line.split()
            if len(instr) == 0:
                #skip empty lines
                continue
    
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
            for segment in line.split():
                if segment in value_table.keys():
                    seg_list.append(value_table[segment])
                else:
                    seg_list.append(segment)
    
            #generate hex
            #print seg_list[::-1]
            instr = 0
            offset = 0
            for seg in seg_list[::-1]:
                width = 32-offset
                base = 10
                data = seg
                l = seg.split("\'")
                if "\'" in seg:
                    width = int(l[0])
                    base = base_table[l[1][0]]
                    data = l[1][1:]
    
                #check value
                #print data, base
                value = int(data, base)
                max = 1<<width
                assert value < max
    
                #build instr
                instr += (value<<offset)
                offset += width
    
            assert offset <= 32
            hex_list.append("%08x\n" % instr)


if __name__=='__main__':
    #opts,args= getopt.getopt(sys.argv[1:], "h:d:", ["def=","define=","help"])
    #print (" Entry opts[0] %s, len=%d") % ( opts,len(opts) )
    #op,value=opts[0]
    try:
        assert len(sys.argv) > 1
        #print ("Debug input argument number=%d") % ( len(sys.argv) )
        if (len(sys.argv)==2):
            source_name=sys.argv[1]
            #print ("len=2, source_name %s") % source_name
            opts,args= getopt.getopt(sys.argv[1:], "h:d:", ["def=","define=","help"])
            if ( len(opts)>0 ):
                op,value=opts[0]
                print ("    Entry debug op %s") % (op)
                if ("--help" in op):
                    print ("    Begin Print Help()")
                    help()
                else:
                    print ("    Need Print Help ? Type: mcitfc.py --help")
            else:
                print ("    default mode: mcitfc.py %s") % source_name

        else :
            opts,args= getopt.getopt(sys.argv[2:], "h:d:", ["def=","define=","help"])
            source_name=sys.argv[1]
        #print ("Debug input arguments=%s") % ( opts )
        #print ("Debug input name=%s") % (source_name)


    except:
        print "Exception Happened: Input argument error"
        help()
        exit(1)


    for op,value in opts :
        if op in ("-h", "--help") : 
            print ("help asseerted args=%s") % value
            exit(0)
        elif op in ("-d", "--def") : 
            #print ("define=%s") % value
            def_list.append(value)
        elif op in ("--define") :
            parse_define_plus(value)


    read_itfc_file(source_name)
    #print hex_list
    hex_name = '%s.hex' % source_name.split('.')[0]
    #print ("Debug output name=%s") % (hex_name)

    if True == os.path.exists(hex_name):
        os.remove(hex_name)

    if (macro_fsm>0) :
        print ("Error. Directive Syntax `endif maybe missing ! Macro FSM=%d") % (macro_fsm)

    with open(hex_name, 'w') as hex_file:
        hex_file.writelines(hex_list)
    #print ("Debug output done")
    print ("    Using define list=%s") % def_list
