#!/usr/bin/python

import sys
import pdb
import os
import binascii
import getopt
from array import array
from binascii import hexlify, unhexlify
from bisect import bisect_right
import os
import sys

cmd = ""
dummy_zero = "00000000\n"
dummy_ffff = "ffffffff\n"
total_info_hex = ""
total_info_str = ""
dec_mat_name = ""  
dec_prg_name = "" 
enc_mat_name = "" 
enc_prg_name = "" 
llr_map_name = "" 
rec_rul_name = "" 
manager_name = "" 
worker_name    = "" 
manager_mc   = "" 
itfc_svh     = "" 
total_name   = ""
tag_name     = ""
timing_mode  = "mode6" 
dec_mat_ih_name = ""  
dec_prg_ih_name = "" 
enc_mat_ih_name = "" 
enc_prg_ih_name = "" 
llr_map_ih_name = "" 
rec_rul_ih_name = "" 
manager_ih_name = "" 
itfc_ih_name    = "" 
total_ih_name   = ""
dec_mat_start = 0
dec_prg_start = 0+8
enc_mat_start = 0+8+2048
enc_prg_start = 0+8+2048+8
llr_map_start = 0+8+2048+8+4096
rec_rul_start = 0+8+2048+8+4096+256
manager_start = 0+8+2048+8+4096+256+512
worker_start  = 0+8+2048+8+4096+256+512+4096
 
ih_dec_mat_lines=""
ih_dec_prg_lines=""
ih_enc_mat_lines=""
ih_enc_prg_lines=""
ih_llr_map_lines=""
ih_rec_rul_lines=""
ih_manager_lines=""
ih_worker_lines=""
ih_extra_info = ""

def extract_one_line(text,key_word_pre,key_work_post):
    #pdb.set_trace()
    global extract_line
    extract_line_long = text.split(key_word_pre)[1]
    extract_line      = extract_line_long.split(key_work_post)[0]
    return extract_line

def get_git_info():
    global branch
    global commit
    global author
    global date
    global msg

    
    # get git branch
    fp = os.popen("git status","r")
    x = fp.read()
    if "Not currently on any branch" in x :
        print "\nError! Not in the Latest Git Branch\n"
        print "Please commit your code first, then use this adding tag\n"
        sys.exit(1)
    extract_one_line(x,'# On branch ','\n')
    branch = extract_line
    #print ("Debug: branch=%s") % (branch)

    # get git commit
    fp = os.popen("git log -1","r")
    x = fp.read()
    extract_one_line(x,'commit ','\n')
    commit = extract_line
    #print ("Debug: commit=%s") % (commit)

    # get git author
    extract_one_line(x,'Author: ',' <')
    author = extract_line
    #print ("Debug: extract=%s") % (extract_line)

    # get git date
    extract_one_line(x,'Date:   ','\n')
    date = extract_line
    #print ("Debug: extract=%s") % (extract_line)

    # get git msg
    extract_one_line(x,'\n    ','\n')
    msg = extract_line
    #print ("Debug: extract=%s") % (extract_line)


def merge_info(switch):
    global total_info
    global timing_mode

    if switch == "manager":
        total_info = "#PREVIOUS_TAG_BEGIN#" + "\n" \
                     "#[branch] = " + branch + "\n" \
                     "#[commit] = " + commit + "\n" \
                     "#[author] = " + author + "\n" \
                     "#[date  ] = " + date   + "\n" \
                     "#[msg   ] = " + msg + "\n" \
                     "#PREVIOUS_TAG_END#" + "\n"
    elif switch == "worker":
        total_info = "//PREVIOUS_TAG_BEGIN//" + "\n" \
                     "//[branch] = " + branch + "\n" \
                     "//[commit] = " + commit + "\n" \
                     "//[author] = " + author + "\n" \
                     "//[date  ] = " + date   + "\n" \
                     "//[msg   ] = " + msg + "\n" \
                     "//PREVIOUS_TAG_END//" + "\n"
    elif switch == "raw":
        total_info = timing_mode + "\n" \
                     "Current  Tag = " + tag_name +  "\n" \
                     "Previous Msg : "            +  "\n" \
                     "[branch] = " + branch + "\n" \
                     "[commit] = " + commit + "\n" \
                     "[author] = " + author + "\n" \
                     "[date  ] = " + date   + "\n" \
                     "[msg   ] = " + msg + "\n"
    #print ("Debug: total_info=\n%s") % total_info

def add_to_file(file_name,switch):
    i=0
    # read file
    fp_r = open(file_name,'r')
    lines = fp_r.readlines()
    fp_r.close()

    # write new file
    fp_w = open(file_name,'w')
    if switch == "manager" :
        if '#PREVIOUS_TAG_BEGIN#' not in lines[0]: # NO Tag before
            fp_w.write(total_info)
            for line in lines:
                fp_w.write(line)
        else:                                  # Tag already
            fp_w.write(total_info)
            for (i,line) in enumerate(lines) :
                if i <=6 :                     # skip Tag Info Part
                    continue
                else:
                    fp_w.write(line)
    elif switch == "worker" :
        if '//PREVIOUS_TAG_BEGIN//' not in lines[0]: # NO Tag before
            fp_w.write(total_info)
            for line in lines:
                fp_w.write(line)
        else:                                  # Tag already
            fp_w.write(total_info)
            for (i,line) in enumerate(lines):
                if i <=6 :                     # skip Tag Info Part
                    continue
                else:
                    fp_w.write(line)
    fp_w.close()


def intelhex_pack(raw_data_lines, line_len):
    raw_data_len = 0
    left_data_len= 0
    done_data_len= 0
    hi_format_lines=""

    raw_data_len = len(raw_data_lines)/2
    left_data_len= raw_data_len
    ih = IntelHex()
    while (left_data_len > 0) :
        #print ("left_data_len=%d") % left_data_len
        if (left_data_len > line_len) :
            #print ("Debug: in intel_hex_pack (>)-> left_data_len=%d, line_len=%d") % (left_data_len, line_len) 
            done_data_len=raw_data_len-left_data_len
            for i in range (0,line_len) :
                ih[done_data_len+i]=int(raw_data_lines[2*(done_data_len+i)]+raw_data_lines[2*(done_data_len+i)+1],16)
                #print ("Debug: left_data=%d. done_data=%d. raw_0=%s, raw_1=%s > ") % (left_data_len, done_data_len, raw_data_lines[done_data_len+2*i], raw_data_lines[done_data_len+2*i+1] )
            #raw_data_lines[2*i:]
            #print ("Debug: shift raw_data_lines > =%s") % raw_data_lines
            left_data_len = left_data_len - line_len

        elif (left_data_len <= line_len and left_data_len > 0) :
            #print ("Debug: in intel_hex_pack (<)-> left_data_len=%d, line_len=%d") % (left_data_len, line_len) 
            done_data_len=raw_data_len-left_data_len
            for i in range (0, left_data_len) :
                ih[done_data_len+i]=int(raw_data_lines[2*(done_data_len+i)]+raw_data_lines[2*(done_data_len+i)+1],16)
                #print ("Debug: left_data=%d. done_data=%d. raw_0=%s, raw_1=%s < ") % (left_data_len, done_data_len, raw_data_lines[done_data_len+2*i], raw_data_lines[done_data_len+2*i+1] )
            #raw_data_lines[2*i:]
            #print ("Debug: shift raw_data_lines < =%s") % raw_data_lines
            left_data_len = left_data_len - left_data_len
        else :
            print ("Debug: in intel_hex_pack Exception, unkown case")

    hi_format_lines=ih.write_hex_variable(1,line_len)
    #print ("raw_data_len=%d") % raw_data_len
    #print ("hi_format_lines=\n%s") % hi_format_lines
    return hi_format_lines

## Fix line number for each hex ##
## decoder_matrix = 8
## decoder_progrm = 2048
## encoder_matrix = 8
## encoder_progrm = 4096
## llr_map_table  = 256 
## recovery_rule  = 512
## worker         = 512 (32 CLs)
## manager        = 4096 
## ALL Below should program as 16 byte align
def merge_hex(total, \
              decoder_matrix, decoder_prog, \
              encoder_matrix, encoder_prog, \
              llr_map, rec_rule, \
              manager, worker, \
              extra_info ) :
    dec_mat_lines=""
    dec_prg_lines=""
    enc_mat_lines=""
    enc_prg_lines=""
    llr_map_lines=""
    rec_rul_lines=""
    manager_lines=""
    worker_lines=""
    global ih_dec_mat_lines
    global ih_dec_prg_lines
    global ih_enc_mat_lines
    global ih_enc_prg_lines
    global ih_llr_map_lines
    global ih_rec_rul_lines
    global ih_manager_lines
    global ih_worker_lines
    global ih_extra_info  

    fp_total   = open (total,          'w')
    

    if 1 :
        
        # write decoder matrix hex
        fp_dec_mat = open(decoder_matrix, 'r')
        lines = fp_dec_mat.readlines();
        for (i,line) in enumerate(lines) :
            #fp_total.write(line)
            line = line.rstrip()
            dec_mat_lines = dec_mat_lines + line
        fp_dec_mat.close()
        ih_dec_mat_lines = intelhex_pack(dec_mat_lines, 128) 


        # write decode prog hex
        fp_dec_prg = open(decoder_prog,   'r')
        lines = fp_dec_prg.readlines()
        for (i,line) in enumerate(lines) :
            #fp_total.write(line)
            line = line.rstrip()
            dec_prg_lines = dec_prg_lines + line
        fp_dec_prg.close()
        ## dummy padding
        #for j in range (i+1, 2048) :
        #    fp_total.write(dummy_zero)
        ih_dec_prg_lines = intelhex_pack(dec_prg_lines, 128)
       
        
        # write encoder matrix hex
        fp_enc_mat = open (encoder_matrix, 'r')
        lines = fp_enc_mat.readlines()
        for (i,line) in enumerate(lines) :
            #fp_total.write(line)
            line = line.rstrip()
            enc_mat_lines = enc_mat_lines + line
        fp_enc_mat.close()
        ih_enc_mat_lines = intelhex_pack(enc_mat_lines, 128)


        # write encoder prog hex
        fp_enc_prg = open (encoder_prog,   'r')
        lines = fp_enc_prg.readlines() 
        for (i,line) in enumerate(lines) :
            #fp_total.write(line)
            line = line.rstrip()
            enc_prg_lines = enc_prg_lines + line
        fp_enc_prg.close()
        ## dummy padding
        #for j in range (i+1,4096) :
        #    fp_total.write(dummy_zero)
        #print ("Debug after encoder j=%d") % j
        ih_enc_prg_lines = intelhex_pack(enc_prg_lines, 128)



        # write llr mapping hex
        fp_llr_map = open (llr_map,        'r')
        lines = fp_llr_map.readlines() 
        for line in lines :
            #fp_total.write(line)
            line = line.rstrip()
            llr_map_lines = llr_map_lines + line
        fp_llr_map.close()
        ih_llr_map_lines = intelhex_pack(llr_map_lines, 128)


        # write recovery rule hex
        fp_rec_rul = open (rec_rule,       'r')
        lines = fp_rec_rul.readlines()  
        for line in lines :
            #fp_total.write(line)
            line = line.rstrip()
            rec_rul_lines = rec_rul_lines + line
        fp_rec_rul.close()
        ih_rec_rul_lines = intelhex_pack(rec_rul_lines, 128)


        # write manager hex
        fp_manager = open (manager,        'r')
        lines = fp_manager.readlines() 
        for (i,line) in enumerate(lines) :
            #fp_total.write(line)
            line = line.rstrip()
            manager_lines = manager_lines + line
        fp_manager.close()
        ## dummy padding
        #for j in range (i+1,4096) :
        #    fp_total.write(dummy_zero)
        ih_manager_lines = intelhex_pack(manager_lines, 128)


        # write worker hex
        fp_worker  = open (worker,         'r')
        lines = fp_worker.readlines()
        for line in lines :
            #fp_total.write(line)
            line = line.rstrip()
            worker_lines = worker_lines + line
        fp_worker.close()
        ih_worker_lines = intelhex_pack(worker_lines, 128)



        # write extra info
        if (len(extra_info)%2 == 1) :
            extra_info = extra_info + "\n"
        ih_extra_info = intelhex_pack(extra_info, 128)

        fp_total.write(ih_dec_mat_lines)
        fp_total.write(ih_dec_prg_lines)
        fp_total.write(ih_enc_mat_lines)
        fp_total.write(ih_enc_prg_lines)
        fp_total.write(ih_llr_map_lines)
        fp_total.write(ih_rec_rul_lines)
        fp_total.write(ih_manager_lines)
        fp_total.write(ih_worker_lines )
        fp_total.write(ih_extra_info )
    fp_total.close()


def decode_ih_hex(ih_name, raw_name, len):
    tmp_len = 0
    hex_data= 0

    fp_raw = open(raw_name, "w")
    ih = IntelHex(ih_name)
    #print ("Debug ih intel_hex = %s") % ih
    tmp_len = ih.loadhex_get_len()
    #print ("ih_dec_mat_name=%s") % ih_dec_mat_name
    #print ("Debug tmp_len=%x") % (tmp_len)
    for i in range (0, tmp_len) :
        hex_data = ih._buf[i]
        fp_raw.write(format(int(hex_data),'02x')) 
        #print ("Debug write data==%s") % (format(int(hex_data),'02X'))   # binascii.a2b_hex(ih._buf) )
        if ((i+1)%4==0) :
            fp_raw.write("\n")

    fp_raw.close()

    
def decode_ih_hex_msg(ih_name):
    tmp_len = 0
    hex_data = ""

    ih = IntelHex(ih_name)
    tmp_len = ih.loadhex_get_len()
    for i in range (0, tmp_len) :
        hex_data = hex_data + format(int(ih._buf[i]),'02x') #unhexlify(ih._buf[i]) #binascii.b2a_hex(int(ih._buf[i]))
    print ("%s") % unhexlify(hex_data)



def extract_hex(extract_name) :
    global total_info_hex
    global total_info_str
    global dec_mat_name
    global dec_prg_name
    global enc_mat_name
    global enc_prg_name
    global llr_map_name
    global rec_rul_name
    global manager_name
    global worker_name   
    global msg_info_name
    info_msg_flag = 0
    total_info_lines = 0
    tmp_len = 0
    tmp_cnt = 0
    tmp_mode= ""

    try:
        fp_extract = open(extract_name, "r")
    except:
        print "No files found %s" % (extract_name)
        exit(1)

    os.system("rm -rf extract_files")
    os.system("mkdir extract_files")

    # Found timing mode in stand hex first
    lines = fp_extract.readlines()
    for i,line in enumerate(lines) :
        if (tmp_cnt==8):     # next line is extra info
            tmp_mode=line[1+4*2:1+4*2+5*2]
            break
        if (":00000001FF" in line or ":00000001ff" in line) :
            tmp_cnt += 1
    timing_mode = unhexlify(tmp_mode)
    #print ("Debug timing_mode=%s") % timing_mode
    fp_extract.close()
   
   
    input_files(timing_mode)
    
    ih_dec_mat_name = './extract_files/ih_' + dec_mat_name
    ih_dec_prg_name = './extract_files/ih_' + dec_prg_name
    ih_enc_mat_name = './extract_files/ih_' + enc_mat_name
    ih_enc_prg_name = './extract_files/ih_' + enc_prg_name
    ih_llr_map_name = './extract_files/ih_' + llr_map_name
    ih_rec_rul_name = './extract_files/ih_' + rec_rul_name
    ih_manager_name = './extract_files/ih_' + manager_name
    ih_worker_name  = './extract_files/ih_' + worker_name   
    ih_msg_info_name= './extract_files/ih_' + msg_info_name

    dec_mat_name = './extract_files/' + dec_mat_name
    dec_prg_name = './extract_files/' + dec_prg_name
    enc_mat_name = './extract_files/' + enc_mat_name
    enc_prg_name = './extract_files/' + enc_prg_name
    llr_map_name = './extract_files/' + llr_map_name
    rec_rul_name = './extract_files/' + rec_rul_name
    manager_name = './extract_files/' + manager_name
    worker_name    = './extract_files/' + worker_name   


    #print ("Debug => ih_manager_name=%s") % ih_manager_name 
    #print ("Debug => worker_name=%s") % (worker_name)

    ih_fp_dec_mat = open(ih_dec_mat_name, "w")
    ih_fp_dec_prg = open(ih_dec_prg_name, "w") 
    ih_fp_enc_mat = open(ih_enc_mat_name, "w") 
    ih_fp_enc_prg = open(ih_enc_prg_name, "w") 
    ih_fp_llr_map = open(ih_llr_map_name, "w") 
    ih_fp_rec_rul = open(ih_rec_rul_name, "w") 
    ih_fp_manager = open(ih_manager_name, "w") 
    ih_fp_worker  = open(ih_worker_name , "w") 
    ih_msg_info   = open(ih_msg_info_name,"w")


    ## check info hex and extract all files
    fp_extract = open(extract_name, "r")
    lines = fp_extract.readlines()
    for i,line in enumerate(lines) :
        if (info_msg_flag == 0) :
            ih_fp_dec_mat.write(line)
        elif (info_msg_flag == 1):
            ih_fp_dec_prg.write(line)
        elif (info_msg_flag == 2):
            ih_fp_enc_mat.write(line)
        elif (info_msg_flag == 3):
            ih_fp_enc_prg.write(line)
        elif (info_msg_flag == 4):
            ih_fp_llr_map.write(line)
        elif (info_msg_flag == 5):
            ih_fp_rec_rul.write(line)
        elif (info_msg_flag == 6):
            ih_fp_manager.write(line)
        elif (info_msg_flag == 7):
            ih_fp_worker.write(line)
        elif (info_msg_flag == 8):
            ih_msg_info.write(line)
        if (":00000001FF" in line or ":00000001ff" in line) :
            info_msg_flag += 1

    ih_fp_dec_mat.close()
    ih_fp_dec_prg.close()    
    ih_fp_enc_mat.close()
    ih_fp_enc_prg.close()
    ih_fp_llr_map.close()
    ih_fp_rec_rul.close()
    ih_fp_manager.close()
    ih_fp_worker.close() 
    ih_msg_info.close() 

    decode_ih_hex(ih_dec_mat_name, dec_mat_name, 4)
    decode_ih_hex(ih_dec_prg_name, dec_prg_name, 4)
    decode_ih_hex(ih_enc_mat_name, enc_mat_name, 4)
    decode_ih_hex(ih_enc_prg_name, enc_prg_name, 4)
    decode_ih_hex(ih_llr_map_name, llr_map_name, 4)
    decode_ih_hex(ih_rec_rul_name, rec_rul_name, 4)
    decode_ih_hex(ih_manager_name, manager_name, 4)
    decode_ih_hex(ih_worker_name,  worker_name, 4)


        #if (info_msg_flag!=0) :
        #    total_info_hex = line
        #    break
        #else :
                    
                #print ("Debug in for extr =%s") % line
            # begin extract each hex files
            # elif (i>=dec_mat_start and  i<dec_mat_start + 8):       
            #     fp_dec_mat.write(line)
            # elif (i>=dec_prg_start and i<dec_prg_start+2048): # 2048
            #     fp_dec_prg.write(line)
            # elif (i>=enc_mat_start and i<enc_mat_start+8):    #8
            #     fp_enc_mat.write(line)
            # elif (i>=enc_prg_start and i<enc_prg_start+4096): #4096
            #     fp_enc_prg.write(line)
            # elif (i>=llr_map_start and i<llr_map_start+256):  #256
            #     fp_llr_map.write(line)
            # elif (i>=rec_rul_start and i<rec_rul_start+512):  #512
            #     fp_rec_rul.write(line)
            # elif (i>=manager_start and i<manager_start+4096): #4096
            #     fp_manager.write(line)
            # elif (i>=worker_start):  # variable
            #     fp_worker.write(line)
    

    #total_info_lines = i-1
    #print ("Effective Hex line=%d") % total_info_lines
    #total_info_str = binascii.unhexlify(total_info_hex)
    print ("=============================================")
    print ("Extract Information:")
    print ("=============================================")
    #print ("%s") % (total_info_str)
    decode_ih_hex_msg(ih_msg_info_name)








 
def help () :
    print ("-------------------------------------------------------------------------")
    print ("-------------------------------------------------------------------------")
    print ("release_tag_hex Usage:")
    print ("               -h                          print this help")
    print ("               -e or --extract [file]      extract info from hex [file]")
    print ("               -a or --add     [file]      add extra info into hex [file]")
    print ("")
    print ("-------------------------------------------------------------------------")
    print ("Example 1: extract info from hex file")
    print ("-------------------------------------------------------------------------")
    print ("           release_tag_hex.py -e star1000_mcode.hex")
    print ("")
    print ("-------------------------------------------------------------------------")
    print ("Example 2: add info message to final merged hex")
    print ("-------------------------------------------------------------------------")
    print ("           release_tag_hex.py -a star1000_mcode.hex,")
    print ("                          decoder_matrix_hex, decoder_prog_hex,")
    print ("                          encoder_matrix_hex, encoder_prog_hex,")
    print ("                          llr_map_hex,        recovery_rule_hex,")
    print ("                          manager_hex,        worker.hex,") 
    print ("                          manager.mc,         itfc.svh")

def help1():
    print ("release_tag_hex usage:")
    print ("               -t <tag_name>               tag_name")
    print ("               -m <commit_message>         commit_message for this push")
    print ("               -e or --extract [file]      extract info from hex [file]")
    print ("               --timing [timing_mode]      specify use which timing mode [timing_mode]")
    print ("                                           mode6 is default value")
    print ("")
    print ("------------------------------------------------------------------------")
    print ("Example 1: specify timing mode, add tag and message, then push to git")
    print ("------------------------------------------------------------------------")
    print ("  release_tag_hex.py -t \"tag_test\" -m \"This commit is for test\" --timing mode6")
    print ("")
    print ("------------------------------------------------------------------------")
    print ("Example 2: extract info from hex file")
    print ("------------------------------------------------------------------------")
    print ("  release_tag_hex.py -e star1000_mcode.hex")
    print ("")

def input_files(timing_mode) :
    global dec_mat_name
    global dec_prg_name
    global enc_mat_name
    global enc_prg_name
    global llr_map_name
    global rec_rul_name
    global manager_name
    global worker_name   
    global msg_info_name   
    global manager_mc  
    global itfc_svh  
    global total_name  

    dec_mat_name = "c_decoder_matrix_info.hex"
    dec_prg_name = "c_decoder_program.hex" 
    enc_mat_name = "c_encoder_matrix_info.hex" 
    enc_prg_name = "c_encoder_program.hex" 
    llr_map_name = "c_llr_mapping_table.hex" 
    rec_rul_name = "c_recovery_rules.hex" 
    manager_name = "c_mng_program_BICS2_"+timing_mode+".hex" 
    worker_name    = "c_work_program_BICS2_"+timing_mode+".hex"
    manager_mc   = "c_mng_program_BICS2_"+timing_mode+".mc"
    itfc_svh     = "c_work_program_BICS2_"+timing_mode+".svh"
    total_name   = "star1000_mcode_"+timing_mode+".hex"
    msg_info_name= "msg_info_"+timing_mode+".hex"

def print_input_files():
    print ("Input Files List : ")
    print ("[decoder_matrix_hex]=%s") % dec_mat_name 
    print ("[decoder_progrm_hex]=%s") % dec_prg_name
    print ("[encoder_matrix_hex]=%s") % enc_mat_name
    print ("[encoder_progrm_hex]=%s") % enc_prg_name
    print ("[llr_mapping_hex   ]=%s") % llr_map_name
    print ("[recovery_rule_hex ]=%s") % rec_rul_name
    print ("[manager_hex       ]=%s") % manager_name
    print ("[worker_hex        ]=%s") % worker_name
    print ("[manager.mc        ]=%s") % manager_mc
    print ("[worker.svh        ]=%s") % itfc_svh
    print ("[star1000_mcode.hex]=%s") % total_name


def note() :
    print ("")
    print ("===================================================================")
    print ("                                             ")
    print (" Note: Commit And Push Your Code First ")
    print ("                                       Then Use this Release Tag !!")
    print ("                                             ")
    print ("===================================================================")











if sys.version_info[0] >= 3:
    # Python 3
    Python = 3

    def asbytes(s):
        if isinstance(s, bytes):
            return s
        return s.encode('latin1')
    def asstr(s):
        if isinstance(s, str):
            return s
        return s.decode('latin1')

    IntTypes = (int,)
    StrType = str
    UnicodeType = str

    range_g = range     # range generator
    def range_l(*args): # range list
        return list(range(*args))

    def dict_keys(dikt):        # dict keys list
        return list(dikt.keys())
    def dict_keys_g(dikt):      # dict keys generator
        return dikt.keys()
    def dict_items_g(dikt):     # dict items generator
        return dikt.items()

    from io import StringIO, BytesIO

    def get_binary_stdout():
        return sys.stdout.buffer

    def get_binary_stdin():
        return sys.stdin.buffer

else:
    # Python 2
    Python = 2

    asbytes = str
    asstr = str

    IntTypes = (int, long)
    StrType = basestring
    UnicodeType = unicode

    #range_g = xrange    # range generator
    def range_g(*args):
        # we want to use xrange here but on python 2 it does not work with long ints
        try:
            return xrange(*args)
        except OverflowError:
            start = 0
            stop = 0
            step = 1
            n = len(args)
            if n == 1:
                stop = args[0]
            elif n == 2:
                start, stop = args
            elif n == 3:
                start, stop, step = args
            else:
                raise TypeError('wrong number of arguments in range_g call!')
            if step == 0:
                raise ValueError('step cannot be zero')
            if step > 0:
                def up(start, stop, step):
                    while start < stop:
                        yield start
                        start += step
                return up(start, stop, step)
            else:
                def down(start, stop, step):
                    while start > stop:
                        yield start
                        start += step
                return down(start, stop, step)

    range_l = range     # range list

    def dict_keys(dikt):        # dict keys list
        return dikt.keys()
    def dict_keys_g(dikt):      # dict keys generator
        return dikt.keys()
    def dict_items_g(dikt):     # dict items generator
        return dikt.items()

    from cStringIO import StringIO
    BytesIO = StringIO

    import os
    def _force_stream_binary(stream):
        """Force binary mode for stream on Windows."""
        if os.name == 'nt':
            f_fileno = getattr(stream, 'fileno', None)
            if f_fileno:
                fileno = f_fileno()
                if fileno >= 0:
                    import msvcrt
                    msvcrt.setmode(fileno, os.O_BINARY)
        return stream

    def get_binary_stdout():
        return _force_stream_binary(sys.stdout)

    def get_binary_stdin():
        return _force_stream_binary(sys.stdin)


#from self.compat import (
#    IntTypes,
#    StrType,
#    StringIO,
#    asbytes,
#    asstr,
#    dict_items_g,
#    dict_keys,
#    dict_keys_g,
#    range_g,
#    range_l,
#    )


class _DeprecatedParam(object):
    pass

_DEPRECATED = _DeprecatedParam()


class IntelHex(object):
    ''' Intel HEX file reader. '''

    def __init__(self, source=None):
        ''' Constructor. If source specified, object will be initialized
        with the contents of source. Otherwise the object will be empty.

        @param  source      source for initialization
                            (file name of HEX file, file object, addr dict or
                             other IntelHex object)
        '''
        # public members
        self.padding = 0x0FF
        # Start Address
        self.start_addr = None

        # private members
        self._buf = {}
        self._offset = 0

        if source is not None:
            if isinstance(source, StrType) or getattr(source, "read", None):
                # load hex file
                self.loadhex(source)
            elif isinstance(source, dict):
                self.fromdict(source)
            elif isinstance(source, IntelHex):
                self.padding = source.padding
                if source.start_addr:
                    self.start_addr = source.start_addr.copy()
                self._buf = source._buf.copy()
            else:
                raise ValueError("source: bad initializer type")

    def _decode_record(self, s, line=0):
        '''Decode one record of HEX file.

        @param  s       line with HEX record.
        @param  line    line number (for error messages).

        @raise  EndOfFile   if EOF record encountered.
        '''
        s = s.rstrip('\r\n')
        if not s:
            return          # empty line

        if s[0] == ':':
            try:
                bin = array('B', unhexlify(asbytes(s[1:])))
            except (TypeError, ValueError):
                # this might be raised by unhexlify when odd hexascii digits
                raise HexRecordError(line=line)
            length = len(bin)
            if length < 5:
                raise HexRecordError(line=line)
        else:
            raise HexRecordError(line=line)

        record_length = bin[0]
        if length != (5 + record_length):
            raise RecordLengthError(line=line)

        addr = bin[1]*256 + bin[2]

        record_type = bin[3]
        if not (0 <= record_type <= 5):
            raise RecordTypeError(line=line)

#        print("Debug remove top bin[0]=%x, bin[1]=%x, bin[2]=%x, bin[3]=%x, bin[4]=%x") % (bin[0],bin[1],bin[2],bin[3],bin[4])
#        print("Debug remove top line=%x") % (line)

        crc = sum(bin)
        crc &= 0x0FF
        if crc != 0:
            raise RecordChecksumError(line=line)

        if record_type == 0:
            # data record
            addr += self._offset
#            print("Debug remove Recodr_type=%d, addr=%x, offset=%x") % (record_type,addr,self._offset)
#            print("Debug remove bin[0]=%x, bin[1]=%x, bin[2]=%x, bin[3]=%x, bin[4]=%x") % (bin[0],bin[1],bin[2],bin[3],bin[4])
            for i in range_g(4, 4+record_length):
#                print("Debug remove i=%d, record-len=%d, _offst=%d, addr=%x") % (i,record_length,self._offset,addr)
#                print("Debug remove _buf.get(%x)=%s") % (addr,self._buf.get(addr))
                if not self._buf.get(addr, None) is None:
                    raise AddressOverlapError(address=addr, line=line)
                self._buf[addr] = bin[i]
                addr += 1   # FIXME: addr should be wrapped 
                            # BUT after 02 record (at 64K boundary)
                            # and after 04 record (at 4G boundary)

        elif record_type == 1:
            # end of file record
            if record_length != 0:
                raise EOFRecordError(line=line)
            raise _EndOfFile

        elif record_type == 2:
            # Extended 8086 Segment Record
            if record_length != 2 or addr != 0:
                raise ExtendedSegmentAddressRecordError(line=line)
            self._offset = (bin[4]*256 + bin[5]) * 16

        elif record_type == 4:
            # Extended Linear Address Record
            if record_length != 2 or addr != 0:
                raise ExtendedLinearAddressRecordError(line=line)
            self._offset = (bin[4]*256 + bin[5]) * 65536

        elif record_type == 3:
            # Start Segment Address Record
            if record_length != 4 or addr != 0:
                raise StartSegmentAddressRecordError(line=line)
            if self.start_addr:
                raise DuplicateStartAddressRecordError(line=line)
            self.start_addr = {'CS': bin[4]*256 + bin[5],
                               'IP': bin[6]*256 + bin[7],
                              }

        elif record_type == 5:
            # Start Linear Address Record
            if record_length != 4 or addr != 0:
                raise StartLinearAddressRecordError(line=line)
            if self.start_addr:
                raise DuplicateStartAddressRecordError(line=line)
            self.start_addr = {'EIP': (bin[4]*16777216 +
                                       bin[5]*65536 +
                                       bin[6]*256 +
                                       bin[7]),
                              }

    def loadhex(self, fobj):
        """Load hex file into internal buffer. This is not necessary
        if object was initialized with source set. This will overwrite
        addresses if object was already initialized.

        @param  fobj        file name or file-like object
        """
        if getattr(fobj, "read", None) is None:
            fobj = open(fobj, "r")
            fclose = fobj.close
        else:
            fclose = None

        self._offset = 0
        line = 0

        try:
            decode = self._decode_record
            try:
                for s in fobj:
                    line += 1
                    decode(s, line)
            except _EndOfFile:
                pass
        finally:
            if fclose:
                fclose()


#    def loadhex_get_data(self, fobj):
#        """Load hex file into internal buffer. This is not necessary
#        if object was initialized with source set. This will overwrite
#        addresses if object was already initialized.
#
#        @param  fobj        file name or file-like object
#        """
#        if getattr(fobj, "read", None) is None:
#            fobj = open(fobj, "r")
#            fclose = fobj.close
#        else:
#            fclose = None
#
#        self._offset = 0
#        line = 0
#
#        try:
#            print("Debug print decode  before")
#            decode = self._decode_record
#            print("Debug print decode  after")
#            try:
#                for s in fobj:
#                    line += 1
#                    print("Debug print decode=%s, line=%d") % (s, line)
#                    decode(s, line)
#            except _EndOfFile:
#                pass
#        finally:
#            if fclose:
#                fclose()
#        return len(self._buf)


    def loadhex_get_len(self):
        #print("Debug self._buf=%d") % len(self._buf)
        return len(self._buf) 


    def loadbin(self, fobj, offset=0):
        """Load bin file into internal buffer. Not needed if source set in
        constructor. This will overwrite addresses without warning
        if object was already initialized.

        @param  fobj        file name or file-like object
        @param  offset      starting address offset
        """
        fread = getattr(fobj, "read", None)
        if fread is None:
            f = open(fobj, "rb")
            fread = f.read
            fclose = f.close
        else:
            fclose = None

        try:
            self.frombytes(array('B', asbytes(fread())), offset=offset)
        finally:
            if fclose:
                fclose()

    def loadfile(self, fobj, format):
        """Load data file into internal buffer. Preferred wrapper over
        loadbin or loadhex.

        @param  fobj        file name or file-like object
        @param  format      file format ("hex" or "bin")
        """
        if format == "hex":
            self.loadhex(fobj)
        elif format == "bin":
            self.loadbin(fobj)
        else:
            raise ValueError('format should be either "hex" or "bin";'
                ' got %r instead' % format)

    # alias (to be consistent with method tofile)
    fromfile = loadfile

    def fromdict(self, dikt):
        """Load data from dictionary. Dictionary should contain int keys
        representing addresses. Values should be the data to be stored in
        those addresses in unsigned char form (i.e. not strings).
        The dictionary may contain the key, ``start_addr``
        to indicate the starting address of the data as described in README.

        The contents of the dict will be merged with this object and will
        overwrite any conflicts. This function is not necessary if the
        object was initialized with source specified.
        """
        s = dikt.copy()
        start_addr = s.get('start_addr')
        if start_addr is not None:
            del s['start_addr']
        for k in dict_keys_g(s):
            if type(k) not in IntTypes or k < 0:
                raise ValueError('Source dictionary should have only int keys')
        self._buf.update(s)
        if start_addr is not None:
            self.start_addr = start_addr

    def frombytes(self, bytes, offset=0):
        """Load data from array or list of bytes.
        Similar to loadbin() method but works directly with iterable bytes.
        """
        for b in bytes:
            self._buf[offset] = b
            offset += 1

    def _get_start_end(self, start=None, end=None, size=None):
        """Return default values for start and end if they are None.
        If this IntelHex object is empty then it's error to
        invoke this method with both start and end as None. 
        """
        if (start,end) == (None,None) and self._buf == {}:
            raise EmptyIntelHexError
        if size is not None:
            if None not in (start, end):
                raise ValueError("tobinarray: you can't use start,end and size"
                                 " arguments in the same time")
            if (start, end) == (None, None):
                start = self.minaddr()
            if start is not None:
                end = start + size - 1
            else:
                start = end - size + 1
                if start < 0:
                    raise ValueError("tobinarray: invalid size (%d) "
                                     "for given end address (%d)" % (size,end))
        else:
            if start is None:
                start = self.minaddr()
            if end is None:
                end = self.maxaddr()
            if start > end:
                start, end = end, start
        return start, end

    def tobinarray(self, start=None, end=None, pad=_DEPRECATED, size=None):
        ''' Convert this object to binary form as array. If start and end 
        unspecified, they will be inferred from the data.
        @param  start   start address of output bytes.
        @param  end     end address of output bytes (inclusive).
        @param  pad     [DEPRECATED PARAMETER, please use self.padding instead]
                        fill empty spaces with this value
                        (if pad is None then this method uses self.padding).
        @param  size    size of the block, used with start or end parameter.
        @return         array of unsigned char data.
        '''
        if not isinstance(pad, _DeprecatedParam):
            print ("IntelHex.tobinarray: 'pad' parameter is deprecated.")
            if pad is not None:
                print ("Please, use IntelHex.padding attribute instead.")
            else:
                print ("Please, don't pass it explicitly.")
                print ("Use syntax like this: ih.tobinarray(start=xxx, end=yyy, size=zzz)")
        else:
            pad = None
        return self._tobinarray_really(start, end, pad, size)

    def _tobinarray_really(self, start, end, pad, size):
        if pad is None:
            pad = self.padding

        bin = array('B')

        if self._buf == {} and None in (start, end):
            return bin

        if size is not None and size <= 0:
            raise ValueError("tobinarray: wrong value for size")

        start, end = self._get_start_end(start, end, size)

        for i in range_g(start, end+1):
            bin.append(self._buf.get(i, pad))

        return bin

    def tobinstr(self, start=None, end=None, pad=_DEPRECATED, size=None):
        ''' Convert to binary form and return as binary string.
        @param  start   start address of output bytes.
        @param  end     end address of output bytes (inclusive).
        @param  pad     [DEPRECATED PARAMETER, please use self.padding instead]
                        fill empty spaces with this value
                        (if pad is None then this method uses self.padding).
        @param  size    size of the block, used with start or end parameter.
        @return         string of binary data.
        '''
        if not isinstance(pad, _DeprecatedParam):
            print ("IntelHex.tobinstr: 'pad' parameter is deprecated.")
            if pad is not None:
                print ("Please, use IntelHex.padding attribute instead.")
            else:
                print ("Please, don't pass it explicitly.")
                print ("Use syntax like this: ih.tobinstr(start=xxx, end=yyy, size=zzz)")
        else:
            pad = None
        return self._tobinstr_really(start, end, pad, size)

    def _tobinstr_really(self, start, end, pad, size):
        return asbytes(self._tobinarray_really(start, end, pad, size).tostring())

    def tobinfile(self, fobj, start=None, end=None, pad=_DEPRECATED, size=None):
        '''Convert to binary and write to file.

        @param  fobj    file name or file object for writing output bytes.
        @param  start   start address of output bytes.
        @param  end     end address of output bytes (inclusive).
        @param  pad     [DEPRECATED PARAMETER, please use self.padding instead]
                        fill empty spaces with this value
                        (if pad is None then this method uses self.padding).
        @param  size    size of the block, used with start or end parameter.
        '''
        if not isinstance(pad, _DeprecatedParam):
            print ("IntelHex.tobinfile: 'pad' parameter is deprecated.")
            if pad is not None:
                print ("Please, use IntelHex.padding attribute instead.")
            else:
                print ("Please, don't pass it explicitly.")
                print ("Use syntax like this: ih.tobinfile(start=xxx, end=yyy, size=zzz)")
        else:
            pad = None
        if getattr(fobj, "write", None) is None:
            fobj = open(fobj, "wb")
            close_fd = True
        else:
            close_fd = False

        fobj.write(self._tobinstr_really(start, end, pad, size))

        if close_fd:
            fobj.close()

    def todict(self):
        '''Convert to python dictionary.

        @return         dict suitable for initializing another IntelHex object.
        '''
        r = {}
        r.update(self._buf)
        if self.start_addr:
            r['start_addr'] = self.start_addr
        return r

    def addresses(self):
        '''Returns all used addresses in sorted order.
        @return         list of occupied data addresses in sorted order. 
        '''
        aa = dict_keys(self._buf)
        aa.sort()
        return aa

    def minaddr(self):
        '''Get minimal address of HEX content.
        @return         minimal address or None if no data
        '''
        aa = dict_keys(self._buf)
        if aa == []:
            return None
        else:
            return min(aa)

    def maxaddr(self):
        '''Get maximal address of HEX content.
        @return         maximal address or None if no data
        '''
        aa = dict_keys(self._buf)
        if aa == []:
            return None
        else:
            return max(aa)

    def __getitem__(self, addr):
        ''' Get requested byte from address.
        @param  addr    address of byte.
        @return         byte if address exists in HEX file, or self.padding
                        if no data found.
        '''
        t = type(addr)
        if t in IntTypes:
            if addr < 0:
                raise TypeError('Address should be >= 0.')
            return self._buf.get(addr, self.padding)
        elif t == slice:
            addresses = dict_keys(self._buf)
            ih = IntelHex()
            if addresses:
                addresses.sort()
                start = addr.start or addresses[0]
                stop = addr.stop or (addresses[-1]+1)
                step = addr.step or 1
                for i in range_g(start, stop, step):
                    x = self._buf.get(i)
                    if x is not None:
                        ih[i] = x
            return ih
        else:
            raise TypeError('Address has unsupported type: %s' % t)

    def __setitem__(self, addr, byte):
        """Set byte at address."""
        t = type(addr)
        if t in IntTypes:
            if addr < 0:
                raise TypeError('Address should be >= 0.')
            self._buf[addr] = byte
        elif t == slice:
            if not isinstance(byte, (list, tuple)):
                raise ValueError('Slice operation expects sequence of bytes')
            start = addr.start
            stop = addr.stop
            step = addr.step or 1
            if None not in (start, stop):
                ra = range_l(start, stop, step)
                if len(ra) != len(byte):
                    raise ValueError('Length of bytes sequence does not match '
                        'address range')
            elif (start, stop) == (None, None):
                raise TypeError('Unsupported address range')
            elif start is None:
                start = stop - len(byte)
            elif stop is None:
                stop = start + len(byte)
            if start < 0:
                raise TypeError('start address cannot be negative')
            if stop < 0:
                raise TypeError('stop address cannot be negative')
            j = 0
            for i in range_g(start, stop, step):
                self._buf[i] = byte[j]
                j += 1
        else:
            raise TypeError('Address has unsupported type: %s' % t)

    def __delitem__(self, addr):
        """Delete byte at address."""
        t = type(addr)
        if t in IntTypes:
            if addr < 0:
                raise TypeError('Address should be >= 0.')
            del self._buf[addr]
        elif t == slice:
            addresses = dict_keys(self._buf)
            if addresses:
                addresses.sort()
                start = addr.start or addresses[0]
                stop = addr.stop or (addresses[-1]+1)
                step = addr.step or 1
                for i in range_g(start, stop, step):
                    x = self._buf.get(i)
                    if x is not None:
                        del self._buf[i]
        else:
            raise TypeError('Address has unsupported type: %s' % t)

    def __len__(self):
        """Return count of bytes with real values."""
        return len(dict_keys(self._buf))

    def write_hex_file(self, f, write_start_addr=True):
        """Write data to file f in HEX format.

        @param  f                   filename or file-like object for writing
        @param  write_start_addr    enable or disable writing start address
                                    record to file (enabled by default).
                                    If there is no start address in obj, nothing
                                    will be written regardless of this setting.
        """
        fwrite = getattr(f, "write", None)
        if fwrite:
            fobj = f
            fclose = None
        else:
            fobj = open(f, 'w')
            fwrite = fobj.write
            fclose = fobj.close

        # Translation table for uppercasing hex ascii string.
        # timeit shows that using hexstr.translate(table)
        # is faster than hexstr.upper():
        # 0.452ms vs. 0.652ms (translate vs. upper)
        if sys.version_info[0] >= 3:
            # Python 3
            table = bytes(range_l(256)).upper()
        else:
            # Python 2
            table = ''.join(chr(i).upper() for i in range_g(256))

        # start address record if any
        if self.start_addr and write_start_addr:
            keys = dict_keys(self.start_addr)
            keys.sort()
            bin = array('B', asbytes('\0'*9))
            if keys == ['CS','IP']:
                # Start Segment Address Record
                bin[0] = 4      # reclen
                bin[1] = 0      # offset msb
                bin[2] = 0      # offset lsb
                bin[3] = 3      # rectyp
                cs = self.start_addr['CS']
                bin[4] = (cs >> 8) & 0x0FF
                bin[5] = cs & 0x0FF
                ip = self.start_addr['IP']
                bin[6] = (ip >> 8) & 0x0FF
                bin[7] = ip & 0x0FF
                bin[8] = (-sum(bin)) & 0x0FF    # chksum
                fwrite(':' +
                       asstr(hexlify(bin.tostring()).translate(table)) +
                       '\n')
            elif keys == ['EIP']:
                # Start Linear Address Record
                bin[0] = 4      # reclen
                bin[1] = 0      # offset msb
                bin[2] = 0      # offset lsb
                bin[3] = 5      # rectyp
                eip = self.start_addr['EIP']
                bin[4] = (eip >> 24) & 0x0FF
                bin[5] = (eip >> 16) & 0x0FF
                bin[6] = (eip >> 8) & 0x0FF
                bin[7] = eip & 0x0FF
                bin[8] = (-sum(bin)) & 0x0FF    # chksum
                fwrite(':' +
                       asstr(hexlify(bin.tostring()).translate(table)) +
                       '\n')
            else:
                if fclose:
                    fclose()
                raise InvalidStartAddressValueError(start_addr=self.start_addr)

        # data
        addresses = dict_keys(self._buf)
        addresses.sort()
        addr_len = len(addresses)
        if addr_len:
            minaddr = addresses[0]
            maxaddr = addresses[-1]

            if maxaddr > 65535:
                need_offset_record = True
            else:
                need_offset_record = False
            high_ofs = 0

            cur_addr = minaddr
            cur_ix = 0

            while cur_addr <= maxaddr:
                if need_offset_record:
                    bin = array('B', asbytes('\0'*7))
                    bin[0] = 2      # reclen
                    bin[1] = 0      # offset msb
                    bin[2] = 0      # offset lsb
                    bin[3] = 4      # rectyp
                    high_ofs = int(cur_addr>>16)
                    b = divmod(high_ofs, 256)
                    bin[4] = b[0]   # msb of high_ofs
                    bin[5] = b[1]   # lsb of high_ofs
                    bin[6] = (-sum(bin)) & 0x0FF    # chksum
                    fwrite(':' +
                           asstr(hexlify(bin.tostring()).translate(table)) +
                           '\n')
                while True:
                    # produce one record
                    low_addr = cur_addr & 0x0FFFF
                    # chain_len off by 1
                    chain_len = min(15, 65535-low_addr, maxaddr-cur_addr)

                    # search continuous chain
                    stop_addr = cur_addr + chain_len
                    if chain_len:
                        ix = bisect_right(addresses, stop_addr,
                                          cur_ix,
                                          min(cur_ix+chain_len+1, addr_len))
                        chain_len = ix - cur_ix     # real chain_len
                        # there could be small holes in the chain
                        # but we will catch them by try-except later
                        # so for big continuous files we will work
                        # at maximum possible speed
                    else:
                        chain_len = 1               # real chain_len

                    bin = array('B', asbytes('\0'*(5+chain_len)))
                    b = divmod(low_addr, 256)
                    bin[1] = b[0]   # msb of low_addr
                    bin[2] = b[1]   # lsb of low_addr
                    bin[3] = 0          # rectype
                    try:    # if there is small holes we'll catch them
                        for i in range_g(chain_len):
                            bin[4+i] = self._buf[cur_addr+i]
                    except KeyError:
                        # we catch a hole so we should shrink the chain
                        chain_len = i
                        bin = bin[:5+i]
                    bin[0] = chain_len
                    bin[4+chain_len] = (-sum(bin)) & 0x0FF    # chksum
                    fwrite(':' +
                           asstr(hexlify(bin.tostring()).translate(table)) +
                           '\n')
                    # adjust cur_addr/cur_ix
                    cur_ix += chain_len
                    if cur_ix < addr_len:
                        cur_addr = addresses[cur_ix]
                    else:
                        cur_addr = maxaddr + 1
                        break
                    high_addr = int(cur_addr>>16)
                    if high_addr > high_ofs:
                        break

        # end-of-file record
        fwrite(":00000001FF\n")
        if fclose:
            fclose()

     
    def write_hex_variable(self, write_start_addr=True, raw_len=16):
        """Write data to returned string, modified by chenyang.

        @param  none(f)             filename or file-like object for writing(remove this function)
        @param  write_start_addr    enable or disable writing start address
                                    record to file (enabled by default).
                                    If there is no start address in obj, nothing
                                    will be written regardless of this setting.
        """
        ih_packed_lines = ""
        # fwrite = getattr(f, "write", None)
        # if fwrite:
        #    fobj = f
        #    fclose = None
        # else:
        #    fobj = open(f, 'w')
        #    fwrite = fobj.write
        #    fclose = fobj.close

        # Translation table for uppercasing hex ascii string.
        # timeit shows that using hexstr.translate(table)
        # is faster than hexstr.upper():
        # 0.452ms vs. 0.652ms (translate vs. upper)
        if sys.version_info[0] >= 3:
            # Python 3
            table = bytes(range_l(256)).upper()
        else:
            # Python 2
            table = ''.join(chr(i).upper() for i in range_g(256))

        # start address record if any
        if self.start_addr and write_start_addr:
            keys = dict_keys(self.start_addr)
            keys.sort()
            bin = array('B', asbytes('\0'*9))
            if keys == ['CS','IP']:
                # Start Segment Address Record
                bin[0] = 4      # reclen
                bin[1] = 0      # offset msb
                bin[2] = 0      # offset lsb
                bin[3] = 3      # rectyp
                cs = self.start_addr['CS']
                bin[4] = (cs >> 8) & 0x0FF
                bin[5] = cs & 0x0FF
                ip = self.start_addr['IP']
                bin[6] = (ip >> 8) & 0x0FF
                bin[7] = ip & 0x0FF
                bin[8] = (-sum(bin)) & 0x0FF    # chksum
                # fwrite(':' +
                #       asstr(hexlify(bin.tostring()).translate(table)) +
                #       '\n')
                ih_packed_lines = ih_packed_lines + ':' + asstr(hexlify(bin.tostring()).translate(table)) + '\n'
            elif keys == ['EIP']:
                # Start Linear Address Record
                bin[0] = 4      # reclen
                bin[1] = 0      # offset msb
                bin[2] = 0      # offset lsb
                bin[3] = 5      # rectyp
                eip = self.start_addr['EIP']
                bin[4] = (eip >> 24) & 0x0FF
                bin[5] = (eip >> 16) & 0x0FF
                bin[6] = (eip >> 8) & 0x0FF
                bin[7] = eip & 0x0FF
                bin[8] = (-sum(bin)) & 0x0FF    # chksum
                # fwrite(':' +
                #        asstr(hexlify(bin.tostring()).translate(table)) +
                #        '\n')
                ih_packed_lines = ih_packed_lines + ':' + asstr(hexlify(bin.tostring()).translate(table)) + '\n'
            else:
                # if fclose:
                #     fclose()
                raise InvalidStartAddressValueError(start_addr=self.start_addr)

        # data
        addresses = dict_keys(self._buf)
        addresses.sort()
        addr_len = len(addresses)
        if addr_len:
            minaddr = addresses[0]
            maxaddr = addresses[-1]

            if maxaddr > 65535:
                need_offset_record = True
            else:
                need_offset_record = False
            high_ofs = 0

            cur_addr = minaddr
            cur_ix = 0

            while cur_addr <= maxaddr:
                if need_offset_record:
                    bin = array('B', asbytes('\0'*7))
                    bin[0] = 2      # reclen
                    bin[1] = 0      # offset msb
                    bin[2] = 0      # offset lsb
                    bin[3] = 4      # rectyp
                    high_ofs = int(cur_addr>>16)
                    b = divmod(high_ofs, 256)
                    bin[4] = b[0]   # msb of high_ofs
                    bin[5] = b[1]   # lsb of high_ofs
                    bin[6] = (-sum(bin)) & 0x0FF    # chksum
                    # fwrite(':' +
                    #        asstr(hexlify(bin.tostring()).translate(table)) +
                    #        '\n')
                    ih_packed_lines = ih_packed_lines + ':' + asstr(hexlify(bin.tostring()).translate(table)) + '\n'
                while True:
                    # produce one record
                    low_addr = cur_addr & 0x0FFFF
                    # chain_len off by 1
                    # chain_len = min(15, 65535-low_addr, maxaddr-cur_addr)
                    chain_len = min(raw_len-1, 65535-low_addr, maxaddr-cur_addr)  # modified by chenyang

                    # search continuous chain
                    stop_addr = cur_addr + chain_len
                    if chain_len:
                        ix = bisect_right(addresses, stop_addr,
                                          cur_ix,
                                          min(cur_ix+chain_len+1, addr_len))
                        chain_len = ix - cur_ix     # real chain_len
                        # there could be small holes in the chain
                        # but we will catch them by try-except later
                        # so for big continuous files we will work
                        # at maximum possible speed
                    else:
                        chain_len = 1               # real chain_len

                    bin = array('B', asbytes('\0'*(5+chain_len)))
                    b = divmod(low_addr, 256)
                    bin[1] = b[0]   # msb of low_addr
                    bin[2] = b[1]   # lsb of low_addr
                    bin[3] = 0          # rectype
                    try:    # if there is small holes we'll catch them
                        for i in range_g(chain_len):
                            bin[4+i] = self._buf[cur_addr+i]
                    except KeyError:
                        # we catch a hole so we should shrink the chain
                        chain_len = i
                        bin = bin[:5+i]
                    bin[0] = chain_len
                    bin[4+chain_len] = (-sum(bin)) & 0x0FF    # chksum
                    # fwrite(':' +
                    #        asstr(hexlify(bin.tostring()).translate(table)) +
                    #        '\n')
                    ih_packed_lines = ih_packed_lines + ':' + asstr(hexlify(bin.tostring()).translate(table)) + '\n'
                    # adjust cur_addr/cur_ix
                    cur_ix += chain_len
                    if cur_ix < addr_len:
                        cur_addr = addresses[cur_ix]
                    else:
                        cur_addr = maxaddr + 1
                        break
                    high_addr = int(cur_addr>>16)
                    if high_addr > high_ofs:
                        break

        # end-of-file record
        # fwrite(":00000001FF\n")
        ih_packed_lines = ih_packed_lines + ":00000001FF\n"
        # if fclose:
        #     fclose()
        return ih_packed_lines
     
        
    def tofile(self, fobj, format):
        """Write data to hex or bin file. Preferred method over tobin or tohex.

        @param  fobj        file name or file-like object
        @param  format      file format ("hex" or "bin")
        """
        if format == 'hex':
            self.write_hex_file(fobj)
        elif format == 'bin':
            self.tobinfile(fobj)
        else:
            raise ValueError('format should be either "hex" or "bin";'
                ' got %r instead' % format)

    def gets(self, addr, length):
        """Get string of bytes from given address. If any entries are blank
        from addr through addr+length, a NotEnoughDataError exception will
        be raised. Padding is not used."""
        a = array('B', asbytes('\0'*length))
        try:
            for i in range_g(length):
                a[i] = self._buf[addr+i]
        except KeyError:
            raise NotEnoughDataError(address=addr, length=length)
        return asstr(a.tostring())

    def puts(self, addr, s):
        """Put string of bytes at given address. Will overwrite any previous
        entries.
        """
        a = array('B', asbytes(s))
        for i in range_g(len(a)):
            self._buf[addr+i] = a[i]

    def getsz(self, addr):
        """Get zero-terminated string from given address. Will raise 
        NotEnoughDataError exception if a hole is encountered before a 0.
        """
        i = 0
        try:
            while True:
                if self._buf[addr+i] == 0:
                    break
                i += 1
        except KeyError:
            raise NotEnoughDataError(msg=('Bad access at 0x%X: '
                'not enough data to read zero-terminated string') % addr)
        return self.gets(addr, i)

    def putsz(self, addr, s):
        """Put string in object at addr and append terminating zero at end."""
        self.puts(addr, s)
        self._buf[addr+len(s)] = 0

    def dump(self, tofile=None, width=16, withpadding=False):
        """Dump object content to specified file object or to stdout if None.
        Format is a hexdump with some header information at the beginning,
        addresses on the left, and data on right.

        @param  tofile          file-like object to dump to
        @param  width           number of bytes per line (i.e. columns)
        @param  withpadding     print padding character instead of '--'
        @raise  ValueError      if width is not a positive integer
        """

        if not isinstance(width,int) or width < 1:
            raise ValueError('width must be a positive integer.')
        # The integer can be of float type - does not work with bit operations
        width = int(width)
        if tofile is None:
            tofile = sys.stdout
            
        # start addr possibly
        if self.start_addr is not None:
            cs = self.start_addr.get('CS')
            ip = self.start_addr.get('IP')
            eip = self.start_addr.get('EIP')
            if eip is not None and cs is None and ip is None:
                tofile.write('EIP = 0x%08X\n' % eip)
            elif eip is None and cs is not None and ip is not None:
                tofile.write('CS = 0x%04X, IP = 0x%04X\n' % (cs, ip))
            else:
                tofile.write('start_addr = %r\n' % start_addr)
        # actual data
        addresses = dict_keys(self._buf)
        if addresses:
            addresses.sort()
            minaddr = addresses[0]
            maxaddr = addresses[-1]
            startaddr = (minaddr // width) * width
            endaddr = ((maxaddr // width) + 1) * width
            maxdigits = max(len(hex(endaddr)) - 2, 4)   # Less 2 to exclude '0x'
            templa = '%%0%dX' % maxdigits
            rangewidth = range_l(width)
            if withpadding:
                pad = self.padding
            else:
                pad = None
            for i in range_g(startaddr, endaddr, width):
                tofile.write(templa % i)
                tofile.write(' ')
                s = []
                for j in rangewidth:
                    x = self._buf.get(i+j, pad)
                    if x is not None:
                        tofile.write(' %02X' % x)
                        if 32 <= x < 127:   # GNU less does not like 0x7F (128 decimal) so we'd better show it as dot
                            s.append(chr(x))
                        else:
                            s.append('.')
                    else:
                        tofile.write(' --')
                        s.append(' ')
                tofile.write('  |' + ''.join(s) + '|\n')

    def merge(self, other, overlap='error'):
        """Merge content of other IntelHex object into current object (self).
        @param  other   other IntelHex object.
        @param  overlap action on overlap of data or starting addr:
                        - error: raising OverlapError;
                        - ignore: ignore other data and keep current data
                                  in overlapping region;
                        - replace: replace data with other data
                                  in overlapping region.

        @raise  TypeError       if other is not instance of IntelHex
        @raise  ValueError      if other is the same object as self 
                                (it can't merge itself)
        @raise  ValueError      if overlap argument has incorrect value
        @raise  AddressOverlapError    on overlapped data
        """
        # check args
        if not isinstance(other, IntelHex):
            raise TypeError('other should be IntelHex object')
        if other is self:
            raise ValueError("Can't merge itself")
        if overlap not in ('error', 'ignore', 'replace'):
            raise ValueError("overlap argument should be either "
                "'error', 'ignore' or 'replace'")
        # merge data
        this_buf = self._buf
        other_buf = other._buf
        for i in other_buf:
            if i in this_buf:
                if overlap == 'error':
                    raise AddressOverlapError(
                        'Data overlapped at address 0x%X' % i)
                elif overlap == 'ignore':
                    continue
            this_buf[i] = other_buf[i]
        # merge start_addr
        if self.start_addr != other.start_addr:
            if self.start_addr is None:     # set start addr from other
                self.start_addr = other.start_addr
            elif other.start_addr is None:  # keep existing start addr
                pass
            else:                           # conflict
                if overlap == 'error':
                    raise AddressOverlapError(
                        'Starting addresses are different')
                elif overlap == 'replace':
                    self.start_addr = other.start_addr

    def segments(self):
        """Return a list of ordered tuple objects, representing contiguous occupied data addresses.
        Each tuple has a length of two and follows the semantics of the range and xrange objects.
        The second entry of the tuple is always an integer greater than the first entry.
        """
        addresses = self.addresses()
        if not addresses:
            return []
        elif len(addresses) == 1:
            return([(addresses[0], addresses[0]+1)])
        adjacent_differences = [(b - a) for (a, b) in zip(addresses[:-1], addresses[1:])]
        breaks = [i for (i, x) in enumerate(adjacent_differences) if x > 1]
        endings = [addresses[b] for b in breaks]
        endings.append(addresses[-1])
        beginings = [addresses[b+1] for b in breaks]
        beginings.insert(0, addresses[0])
        return [(a, b+1) for (a, b) in zip(beginings, endings)]
#/IntelHex


class IntelHex16bit(IntelHex):
    """Access to data as 16-bit words. Intended to use with Microchip HEX files."""

    def __init__(self, source=None):
        """Construct class from HEX file
        or from instance of ordinary IntelHex class. If IntelHex object
        is passed as source, the original IntelHex object should not be used
        again because this class will alter it. This class leaves padding
        alone unless it was precisely 0xFF. In that instance it is sign
        extended to 0xFFFF.

        @param  source  file name of HEX file or file object
                        or instance of ordinary IntelHex class.
                        Will also accept dictionary from todict method.
        """
        if isinstance(source, IntelHex):
            # from ihex8
            self.padding = source.padding
            self.start_addr = source.start_addr
            # private members
            self._buf = source._buf
            self._offset = source._offset
        elif isinstance(source, dict):
            raise IntelHexError("IntelHex16bit does not support initialization from dictionary yet.\n"
                                "Patches are welcome.")
        else:
            IntelHex.__init__(self, source)

        if self.padding == 0x0FF:
            self.padding = 0x0FFFF

    def __getitem__(self, addr16):
        """Get 16-bit word from address.
        Raise error if only one byte from the pair is set.
        We assume a Little Endian interpretation of the hex file.

        @param  addr16  address of word (addr8 = 2 * addr16).
        @return         word if bytes exists in HEX file, or self.padding
                        if no data found.
        """
        addr1 = addr16 * 2
        addr2 = addr1 + 1
        byte1 = self._buf.get(addr1, None)
        byte2 = self._buf.get(addr2, None)

        if byte1 != None and byte2 != None:
            return byte1 | (byte2 << 8)     # low endian

        if byte1 == None and byte2 == None:
            return self.padding

        raise BadAccess16bit(address=addr16)

    def __setitem__(self, addr16, word):
        """Sets the address at addr16 to word assuming Little Endian mode.
        """
        addr_byte = addr16 * 2
        b = divmod(word, 256)
        self._buf[addr_byte] = b[1]
        self._buf[addr_byte+1] = b[0]

    def minaddr(self):
        '''Get minimal address of HEX content in 16-bit mode.

        @return         minimal address used in this object
        '''
        aa = dict_keys(self._buf)
        if aa == []:
            return 0
        else:
            return min(aa)>>1

    def maxaddr(self):
        '''Get maximal address of HEX content in 16-bit mode.

        @return         maximal address used in this object 
        '''
        aa = dict_keys(self._buf)
        if aa == []:
            return 0
        else:
            return max(aa)>>1

    def tobinarray(self, start=None, end=None, size=None):
        '''Convert this object to binary form as array (of 2-bytes word data).
        If start and end unspecified, they will be inferred from the data.
        @param  start   start address of output data.
        @param  end     end address of output data (inclusive).
        @param  size    size of the block (number of words),
                        used with start or end parameter.
        @return         array of unsigned short (uint16_t) data.
        '''
        bin = array('H')

        if self._buf == {} and None in (start, end):
            return bin

        if size is not None and size <= 0:
            raise ValueError("tobinarray: wrong value for size")

        start, end = self._get_start_end(start, end, size)

        for addr in range_g(start, end+1):
            bin.append(self[addr])

        return bin


#/class IntelHex16bit


def hex2bin(fin, fout, start=None, end=None, size=None, pad=None):
    """Hex-to-Bin convertor engine.
    @return     0   if all OK

    @param  fin     input hex file (filename or file-like object)
    @param  fout    output bin file (filename or file-like object)
    @param  start   start of address range (optional)
    @param  end     end of address range (inclusive; optional)
    @param  size    size of resulting file (in bytes) (optional)
    @param  pad     padding byte (optional)
    """
    try:
        h = IntelHex(fin)
    except HexReaderError:
        e = sys.exc_info()[1]     # current exception
        txt = "ERROR: bad HEX file: %s" % str(e)
        print(txt)
        return 1

    # start, end, size
    if size != None and size != 0:
        if end == None:
            if start == None:
                start = h.minaddr()
            end = start + size - 1
        else:
            if (end+1) >= size:
                start = end + 1 - size
            else:
                start = 0

    try:
        if pad is not None:
            # using .padding attribute rather than pad argument to function call
            h.padding = pad
        h.tobinfile(fout, start, end)
    except IOError:
        e = sys.exc_info()[1]     # current exception
        txt = "ERROR: Could not write to file: %s: %s" % (fout, str(e))
        print(txt)
        return 1

    return 0
#/def hex2bin


def bin2hex(fin, fout, offset=0):
    """Simple bin-to-hex convertor.
    @return     0   if all OK

    @param  fin     input bin file (filename or file-like object)
    @param  fout    output hex file (filename or file-like object)
    @param  offset  starting address offset for loading bin
    """
    h = IntelHex()
    try:
        h.loadbin(fin, offset)
    except IOError:
        e = sys.exc_info()[1]     # current exception
        txt = 'ERROR: unable to load bin file:', str(e)
        print(txt)
        return 1

    try:
        h.tofile(fout, format='hex')
    except IOError:
        e = sys.exc_info()[1]     # current exception
        txt = "ERROR: Could not write to file: %s: %s" % (fout, str(e))
        print(txt)
        return 1

    return 0
#/def bin2hex


def diff_dumps(ih1, ih2, tofile=None, name1="a", name2="b", n_context=3):
    """Diff 2 IntelHex objects and produce unified diff output for their
    hex dumps.

    @param ih1        first IntelHex object to compare
    @param ih2        second IntelHex object to compare
    @param tofile     file-like object to write output
    @param name1      name of the first hex file to show in the diff header
    @param name2      name of the first hex file to show in the diff header
    @param n_context  number of context lines in the unidiff output
    """
    def prepare_lines(ih):
        sio = StringIO()
        ih.dump(sio)
        dump = sio.getvalue()
        lines = dump.splitlines()
        return lines
    a = prepare_lines(ih1)
    b = prepare_lines(ih2)
    import difflib
    result = list(difflib.unified_diff(a, b, fromfile=name1, tofile=name2, n=n_context, lineterm=''))
    if tofile is None:
        tofile = sys.stdout
    output = '\n'.join(result)+'\n'
    tofile.write(output)


class Record(object):
    """Helper methods to build valid ihex records."""

    def _from_bytes(bytes):
        """Takes a list of bytes, computes the checksum, and outputs the entire
        record as a string. bytes should be the hex record without the colon
        or final checksum.

        @param  bytes   list of byte values so far to pack into record.
        @return         String representation of one HEX record
        """
        assert len(bytes) >= 4
        # calculate checksum
        s = (-sum(bytes)) & 0x0FF
        bin = array('B', bytes + [s])
        return ':' + asstr(hexlify(bin.tostring())).upper()
    _from_bytes = staticmethod(_from_bytes)

    def data(offset, bytes):
        """Return Data record. This constructs the full record, including
        the length information, the record type (0x00), the
        checksum, and the offset.

        @param  offset  load offset of first byte.
        @param  bytes   list of byte values to pack into record.

        @return         String representation of one HEX record
        """
        assert 0 <= offset < 65536
        assert 0 < len(bytes) < 256
        b = [len(bytes), (offset>>8)&0x0FF, offset&0x0FF, 0x00] + bytes
        return Record._from_bytes(b)
    data = staticmethod(data)

    def eof():
        """Return End of File record as a string.
        @return         String representation of Intel Hex EOF record 
        """
        return ':00000001FF'
    eof = staticmethod(eof)

    def extended_segment_address(usba):
        """Return Extended Segment Address Record.
        @param  usba     Upper Segment Base Address.

        @return         String representation of Intel Hex USBA record.
        """
        b = [2, 0, 0, 0x02, (usba>>8)&0x0FF, usba&0x0FF]
        return Record._from_bytes(b)
    extended_segment_address = staticmethod(extended_segment_address)

    def start_segment_address(cs, ip):
        """Return Start Segment Address Record.
        @param  cs      16-bit value for CS register.
        @param  ip      16-bit value for IP register.

        @return         String representation of Intel Hex SSA record.
        """
        b = [4, 0, 0, 0x03, (cs>>8)&0x0FF, cs&0x0FF,
             (ip>>8)&0x0FF, ip&0x0FF]
        return Record._from_bytes(b)
    start_segment_address = staticmethod(start_segment_address)

    def extended_linear_address(ulba):
        """Return Extended Linear Address Record.
        @param  ulba    Upper Linear Base Address.

        @return         String representation of Intel Hex ELA record.
        """
        b = [2, 0, 0, 0x04, (ulba>>8)&0x0FF, ulba&0x0FF]
        return Record._from_bytes(b)
    extended_linear_address = staticmethod(extended_linear_address)

    def start_linear_address(eip):
        """Return Start Linear Address Record.
        @param  eip     32-bit linear address for the EIP register.

        @return         String representation of Intel Hex SLA record.
        """
        b = [4, 0, 0, 0x05, (eip>>24)&0x0FF, (eip>>16)&0x0FF,
             (eip>>8)&0x0FF, eip&0x0FF]
        return Record._from_bytes(b)
    start_linear_address = staticmethod(start_linear_address)


class _BadFileNotation(Exception):
    """Special error class to use with _get_file_and_addr_range."""
    pass

def _get_file_and_addr_range(s, _support_drive_letter=None):
    """Special method for hexmerge.py script to split file notation
    into 3 parts: (filename, start, end)

    @raise _BadFileNotation  when string cannot be safely split.
    """
    if _support_drive_letter is None:
        _support_drive_letter = (os.name == 'nt')
    drive = ''
    if _support_drive_letter:
        if s[1:2] == ':' and s[0].upper() in ''.join([chr(i) for i in range_g(ord('A'), ord('Z')+1)]):
            drive = s[:2]
            s = s[2:]
    parts = s.split(':')
    n = len(parts)
    if n == 1:
        fname = parts[0]
        fstart = None
        fend = None
    elif n != 3:
        raise _BadFileNotation
    else:
        fname = parts[0]
        def ascii_hex_to_int(ascii):
            if ascii is not None:
                try:
                    return int(ascii, 16)
                except ValueError:
                    raise _BadFileNotation
            return ascii
        fstart = ascii_hex_to_int(parts[1] or None)
        fend = ascii_hex_to_int(parts[2] or None)
    return drive+fname, fstart, fend


##
# IntelHex Errors Hierarchy:
#
#  IntelHexError    - basic error
#       HexReaderError  - general hex reader error
#           AddressOverlapError - data for the same address overlap
#           HexRecordError      - hex record decoder base error
#               RecordLengthError    - record has invalid length
#               RecordTypeError      - record has invalid type (RECTYP)
#               RecordChecksumError  - record checksum mismatch
#               EOFRecordError              - invalid EOF record (type 01)
#               ExtendedAddressRecordError  - extended address record base error
#                   ExtendedSegmentAddressRecordError   - invalid extended segment address record (type 02)
#                   ExtendedLinearAddressRecordError    - invalid extended linear address record (type 04)
#               StartAddressRecordError     - start address record base error
#                   StartSegmentAddressRecordError      - invalid start segment address record (type 03)
#                   StartLinearAddressRecordError       - invalid start linear address record (type 05)
#                   DuplicateStartAddressRecordError    - start address record appears twice
#                   InvalidStartAddressValueError       - invalid value of start addr record
#       _EndOfFile  - it's not real error, used internally by hex reader as signal that EOF record found
#       BadAccess16bit - not enough data to read 16 bit value (deprecated, see NotEnoughDataError)
#       NotEnoughDataError - not enough data to read N contiguous bytes
#       EmptyIntelHexError - requested operation cannot be performed with empty object

class IntelHexError(Exception):
    '''Base Exception class for IntelHex module'''

    _fmt = 'IntelHex base error'   #: format string

    def __init__(self, msg=None, **kw):
        """Initialize the Exception with the given message.
        """
        self.msg = msg
        for key, value in dict_items_g(kw):
            setattr(self, key, value)

    def __str__(self):
        """Return the message in this Exception."""
        if self.msg:
            return self.msg
        try:
            return self._fmt % self.__dict__
        except (NameError, ValueError, KeyError):
            e = sys.exc_info()[1]     # current exception
            return 'Unprintable exception %s: %s' \
                % (repr(e), str(e))

class _EndOfFile(IntelHexError):
    """Used for internal needs only."""
    _fmt = 'EOF record reached -- signal to stop read file'

class HexReaderError(IntelHexError):
    _fmt = 'Hex reader base error'

class AddressOverlapError(HexReaderError):
    _fmt = 'Hex file has data overlap at address 0x%(address)X on line %(line)d'

# class NotAHexFileError was removed in trunk.revno.54 because it's not used


class HexRecordError(HexReaderError):
    _fmt = 'Hex file contains invalid record at line %(line)d'


class RecordLengthError(HexRecordError):
    _fmt = 'Record at line %(line)d has invalid length'

class RecordTypeError(HexRecordError):
    _fmt = 'Record at line %(line)d has invalid record type'

class RecordChecksumError(HexRecordError):
    _fmt = 'Record at line %(line)d has invalid checksum'

class EOFRecordError(HexRecordError):
    _fmt = 'File has invalid End-of-File record'


class ExtendedAddressRecordError(HexRecordError):
    _fmt = 'Base class for extended address exceptions'

class ExtendedSegmentAddressRecordError(ExtendedAddressRecordError):
    _fmt = 'Invalid Extended Segment Address Record at line %(line)d'

class ExtendedLinearAddressRecordError(ExtendedAddressRecordError):
    _fmt = 'Invalid Extended Linear Address Record at line %(line)d'


class StartAddressRecordError(HexRecordError):
    _fmt = 'Base class for start address exceptions'

class StartSegmentAddressRecordError(StartAddressRecordError):
    _fmt = 'Invalid Start Segment Address Record at line %(line)d'

class StartLinearAddressRecordError(StartAddressRecordError):
    _fmt = 'Invalid Start Linear Address Record at line %(line)d'

class DuplicateStartAddressRecordError(StartAddressRecordError):
    _fmt = 'Start Address Record appears twice at line %(line)d'

class InvalidStartAddressValueError(StartAddressRecordError):
    _fmt = 'Invalid start address value: %(start_addr)s'


class NotEnoughDataError(IntelHexError):
    _fmt = ('Bad access at 0x%(address)X: '
            'not enough data to read %(length)d contiguous bytes')

class BadAccess16bit(NotEnoughDataError):
    _fmt = 'Bad access at 0x%(address)X: not enough data to read 16 bit value'

class EmptyIntelHexError(IntelHexError):
    _fmt = "Requested operation cannot be executed with empty object"













if __name__ == '__main__':
    assert len(sys.argv) > 1

    try:
        opts,args = getopt.getopt(sys.argv[1:], "cht:m:e:a:",["timing=","extract=","add=","help","clean"])
    except getopt.GetoptError, err:
        print "Exception Happened:"
        help1()
        exit(1)




    #print ("opts = %s, args = %s") % (opts, args)
    for op,value in opts :
        if op in ("-h", "--help") : 
            help1()
            exit(0)
        elif op in ("-c", "--clean") :
            print ("Cleaning and Deleting Temp Folder")
            os.system ("rm -rf extract_files")
            os.system ("rm -rf tmp")
            print ("Done.")
            exit(0)
        elif op in ("-e", "--extract") :
            #input_files()
            extract_name = value
            extract_hex(extract_name)
            exit(0)
        elif op in ("-t") :
            tag_name = value
        elif op in ("--timing") :
            timing_mode = value
        elif op in ("-m") :
            tag_msg = value
        elif op in ("-a", "--add") :
            total_name = value

            dec_mat_name = sys.argv[3]
            dec_prg_name = sys.argv[4]
            enc_mat_name = sys.argv[5]
            enc_prg_name = sys.argv[6]
            llr_map_name = sys.argv[7]
            rec_rul_name = sys.argv[8]
            manager_name = sys.argv[9]
            worker_name    = sys.argv[10]
            manager_mc   = sys.argv[11]
            itfc_svh     = sys.argv[12]
            print ("Input Files List : ")
            print ("[decoder_matrix_hex]=%s") % dec_mat_name 
            print ("[decoder_progrm_hex]=%s") % dec_prg_name
            print ("[encoder_matrix_hex]=%s") % enc_mat_name
            print ("[encoder_progrm_hex]=%s") % enc_prg_name
            print ("[llr_mapping_hex   ]=%s") % llr_map_name
            print ("[recovery_rule_hex ]=%s") % rec_rul_name
            print ("[manager_hex       ]=%s") % manager_name
            print ("[worker_hex        ]=%s") % worker_name
            print ("[manager.mc        ]=%s") % manager_mc
            print ("[worker.svh        ]=%s") % itfc_svh
            print ("[star1000_mcode.hex]=%s") % total_name
        
            #git_ret=os.system("git status")
            get_git_info()
            merge_info("manager")
            add_to_file(manager_mc,"manager")
            merge_info("worker")
            add_to_file(itfc_svh,"worker")
            merge_info("raw")
            #total_info_hex = binascii.a2b_hex("total_info")
            print ("before hex total_info_hex=%s") % total_info
            total_info_hex = binascii.hexlify(total_info)
            print ("total_info_hex=%s") % total_info_hex
            total_info_str = binascii.unhexlify(total_info_hex)
            print ("total_info_str=\n%s") % total_info_str
        
        
            #test_tag = int('0xFFFFFFFF',16)
            #print ("Test_tag =%x") % test_tag
            total_info_hex = dummy_ffff + total_info_hex
        
        
            merge_hex(total_name, \
                      dec_mat_name, dec_prg_name, \
                      enc_mat_name, enc_prg_name, \
                      llr_map_name, rec_rul_name, \
                      manager_name, worker_name,    \
                      total_info_hex  )
        
        else : 
            print "Other output opt=%s, value=%s" % (op,value)
            exit (0)

    note()
    input_files(timing_mode)

    #git_ret=os.system("git status")
    get_git_info()
    #merge_info("manager")
    #add_to_file(manager_mc,"manager")
    #merge_info("worker")
    #add_to_file(itfc_svh,"worker")
    merge_info("raw")
    #total_info_hex = binascii.a2b_hex("total_info")
    #print ("before hex total_info_hex=%s") % total_info
    total_info_hex = binascii.hexlify(total_info)
    #print ("total_info_hex=%s") % total_info_hex
    total_info_str = binascii.unhexlify(total_info_hex)
    #print ("total_info_str=\n%s") % total_info_str

    
    os.system("rm -rf tmp")
    os.system("mkdir tmp")

#    #test_tag = int('0xFFFFFFFF',16)
#    #print ("Test_tag =%x") % test_tag
#    total_info_hex = dummy_ffff + total_info_hex
#



    merge_hex(total_name, \
              dec_mat_name, dec_prg_name, \
              enc_mat_name, enc_prg_name, \
              llr_map_name, rec_rul_name, \
              manager_name, worker_name,    \
              total_info_hex  )


    # First Commit New Total Hex
    # git add
    cmd = 'git add %s' % (total_name)
    try:
        os.system(cmd)
    except:
        print ("Debug: git add %s failed") % (total_name)
        exit(1)
    # git commit
    cmd = 'git commit -m \"tag=%s\"' % (tag_name)
    try:
        os.system(cmd)
    except:
        print ("Debug: git commit tag=%s failed") % (tag_name)
        exit(1)
    # git push
    cmd = 'git push -f origin %s' % (branch)
    try:
        os.system(cmd)
    except:
        print ("Debug: git push branch=%s failed") % (branch)
        exit(1)
    print ("Debug tag_msg=%s, tag_name=%s") % (tag_msg,tag_name)
    print ("\n\n")
    # git add tag
    cmd = 'git tag -a \"%s\" -m \"%s\"' % (tag_name,tag_msg)
    print "cmd = %s" % cmd
    try:
        os.system (cmd)
    except:
        print ("Debug: git add tag=%s failed") % (tag_name)
        exit(1)
    # git push tag
    cmd = 'git push -f origin %s' % tag_name
    try:
        os.system (cmd)
    except:
        print ("Debug: git push -f tag=%s failed") % (tag_name)
        exit(1) 

    #print "the extract work=%s" % (extract_line)



