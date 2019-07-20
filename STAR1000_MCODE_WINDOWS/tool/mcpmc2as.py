#!/usr/bin/python
#assembler of MCNFC

import sys
import os
import getopt
import pdb

##### Usage 
#
# mcpmc2as.py mcnfc.mc <your mc file>
#
# Input : mcnfc.mc
#
# Output: mcnfc.ins
#
# This mcpmc2as.py support both input argument and define key-word in file
# and it will turn all input argument write into `define KEYWORK in file
#
# For mc2as.py, the tool will only support KEYWORD in file, no input argument 
# support

def_list = [];
#definition of instructions
# The below item inside first '' are:
# n|m       ==> indicate the n-th pseudo parameter position map to m-th
#               parameter position in the final instr code
# The below items inside second '' are:
# j|field|k ==> indicate j-th paremeter for final instr code
#               if k="S", the this field should be replaced by corresponding
#               psedu-instr parameter
#               if k="R", the this field is default reserved and use field instead
pseudo_instr_table = {
'matop.nofst' : (   '1|1, 2|2', 
                    '1|reg|S, 2|op|S, 3|0|R, 4|0|R',
                    'Equivalent: matop, reg, op, offset, 0   // offset can be any value'),

'matop.ofst'  : (   '1|1, 2|2, 3|3', 
                    '1|reg|S, 2|op|S, 3|offset|S, 4|1|R',
                    'Equivalent: matop, reg, op, offset, 1'),

'jnz.nfc'     : (   '1|1, 2|2', 
                    '1|addr|S, 2|reg|S, 3|0|R',
                    'Equivalent: jnz, addr, reg, 0'),

'jnz.fc'      : (   '1|1', 
                    '1|addr|S, 2|0|R, 3|1|R',
                    'Equivalent: jnz, addr, reg, 1    // reg can be any value'),

'wk.d'        : (   '1|1, 2|3', 
                    '1|line|S, 2|14|R, 3|addr|S',
                    'Equivalent: wk, line, 4`b1110, addr'),

'wk.s'        : (   '1|1, 2|3', 
                    '1|line|S, 2|13|R, 3|addr|S',
                    'Equivalent: wk, line, 4`b1101, addr'),

'wk.dnstk'    : (   '1|1, 2|3', 
                    '1|line|S, 2|6|R, 3|addr|S',
                    'Equivalent: wk, line, 4`b0110, addr'),

'wk.snstk'    : (   '1|1, 2|3', 
                    '1|line|S, 2|5|R, 3|addr|S',
                    'Equivalent: wk, line, 4`b0101, addr'),

'wk.dnyld'    : (   '1|1, 2|3', 
                    '1|line|S, 2|10|R, 3|addr|S',
                    'Equivalent: wk, line, 4`b1010, addr'),

'wk.snyld'    : (   '1|1, 2|3', 
                    '1|line|S, 2|9|R, 3|addr|S',
                    'Equivalent: wk, line, 4`b1001, addr'),

'wk.dnstkyld' : (   '1|1, 2|3', 
                    '1|line|S, 2|2|R, 3|addr|S',
                    'Equivalent: wk, line, 4`b0010, addr'),

'wk.snstkyld' : (   '1|1, 2|3', 
                    '1|line|S, 2|1|R, 3|addr|S',
                    'Equivalent: wk, line, 4`b0001, addr'),

'wk.nds'      : (   '1|1, 2|3', 
                    '1|line|S, 2|12|R, 3|addr|S',
                    'Equivalent: wk, line, 4`b1100, addr'),

'wk.ndsstk'   : (   '1|1, 2|3', 
                    '1|line|S, 2|4|R, 3|addr|S',
                    'Equivalent: wk, line, 4`b0100, addr'),

'wk.ndsyld'   : (   '1|1, 2|3', 
                    '1|line|S, 2|8|R, 3|addr|S',
                    'Equivalent: wk, line, 4`b1000, addr'),

'wk.ndsstkyld' : (  '1|1, 2|3', 
                    '1|line|S, 2|0|R, 3|addr|S',
                    'Equivalent: wk, line, 4`b0000, addr'),

'wk.stkyld'    : (  '1|1, 2|3', 
                    '1|line|S, 2|12|R, 3|addr|S',
                    'Equivalent: wk, line, 4`b0000, addr'),









'stacp.i'     : (  '1|1, 2|3',
                   '1|reg|S, 2|2|R, 3|sta|S',
                   'Equivalent: stacp, reg, 2`b10, sta'),
   
'stacp.n'     : (  '1|1, 2|3',
                   '1|reg|S, 2|0|R, 3|sta|S',
                   'Equivalent: stacp, reg, 2`b00, sta'),
   
'stacp.ii'    : (  '1|1, 2|3',
                   '1|reg|S, 2|3|R, 3|sta|S',
                   'Equivalent: stacp, reg, 2`b11, sta'),
   
'stacp.ni'    : (  '1|1, 2|3',
                   '1|reg|S, 2|1|R, 3|sta|S',
                   'Equivalent: stacp, reg, 2`b01, sta'),
   
'reti.db'     : (  '1|2, 2|3, 3|4',   
                   '1|15|R, 2|rs|S, 3|offset|S, 4|addr|S',
                   'Equivalent: reti, 4`b1111, rs, offset, addr'),
    
'reti.dbnofst' : ( '1|2, 2|3, 3|4',   
                   '1|7|R, 2|rs|S, 3|offset|S, 4|addr|S',
                   'Equivalent: reti, 4`b0111, rs, offset, addr'),
     
'reti.dbnyld' : (  '1|2, 2|3, 3|4',   
                   '1|13|R, 2|rs|S, 3|offset|S, 4|addr|S',
                   'Equivalent: reti, 4`b1101, rs, offset, addr'),
     
'reti.dbnyldofst' : (   '1|2, 2|3, 3|4',   
                        '1|5|R, 2|rs|S, 3|offset|S, 4|addr|S',
                        'Equivalent: reti, 4`b0101, rs, offset, addr'),
     
'reti.d'      : (  '1|2, 2|3, 3|4',   
                   '1|14|R, 2|rs|S, 3|offset|S, 4|addr|S',
                   'Equivalent: reti, 4`b1110, rs, offset, addr'),
     
'reti.dnofst' : (  '1|2, 2|3, 3|4',   
                   '1|6|R, 2|rs|S, 3|offset|S, 4|addr|S',
                   'Equivalent: reti, 4`b0110, rs, offset, addr'),
     
'reti.dnyld'  : (  '1|2, 2|3, 3|4',   
                   '1|12|R, 2|rs|S, 3|offset|S, 4|addr|S',
                   'Equivalent: reti, 4`b1100, rs, offset, addr'),
     
'reti.dnyldofst' : (  '1|2, 2|3, 3|4',   
                      '1|4|R, 2|rs|S, 3|offset|S, 4|addr|S',
                      'Equivalent: reti, 4`b0100, rs, offset, addr'),
     
'reti.b'      : (  '1|2, 2|3, 3|4',   
                   '1|11|R, 2|rs|S, 3|offset|S, 4|addr|S',
                   'Equivalent: reti, 4`b1011, rs, offset, addr'),
     
'reti.bnofst' : (  '1|2, 2|3, 3|4',   
                   '1|3|R, 2|rs|S, 3|offset|S, 4|addr|S',
                   'Equivalent: reti, 4`b0011, rs, offset, addr'),
     
'reti.bnyld'  : (  '1|2, 2|3, 3|4',   
                   '1|9|R, 2|rs|S, 3|offset|S, 4|addr|S',
                   'Equivalent: reti, 4`b1001, rs, offset, addr'),
     
'reti.bnyldofst' : (  '1|2, 2|3, 3|4',   
                      '1|1|R, 2|rs|S, 3|offset|S, 4|addr|S',
                      'Equivalent: reti, 4`b0001, rs, offset, addr'),
     
'reti.ndb'    : (  '1|2, 2|3, 3|4',   
                   '1|10|R, 2|rs|S, 3|offset|S, 4|addr|S',
                   'Equivalent: reti, 4`b1010, rs, offset, addr'),
     
'reti.ndbofst' : (  '1|2, 2|3, 3|4',   
                    '1|2|R, 2|rs|S, 3|offset|S, 4|addr|S',
                    'Equivalent: reti, 4`b0010, rs, offset, addr'),
     
'reti.ndbyld' : (  '1|2, 2|3, 3|4',   
                   '1|8|R, 2|rs|S, 3|offset|S, 4|addr|S',
                   'Equivalent: reti, 4`b1000, rs, offset, addr'),
     
'reti.ndbyldofst' : (  '1|2, 2|4',   
                       '1|0|R, 2|rs|S, 3|0|R, 4|addr|S',
                       'Equivalent: reti, 4`b0000, rs, 0, addr'),
     
'setp.all'    : (   '1|2, 2|3',  
                    '1|0|R, 2|shf|S, 3|offset|S',
                    'Equivalent: setp, 4`h0, shf, offset'), 
    
'setp.noca'   : (   '1|2, 2|3',  
                    '1|1|R, 2|shf|S, 3|offset|S',
                    'Equivalent: setp, 4`h1, shf, offset'), 
    
'setp.nofst'  : (   '1|1, 2|2',  
                    '1|id|S, 2|shf|S, 3|0|R',
                    'Equivalent: setp, 4`hid, shf, 0'), 
    
'pbulc.lck'   : (   '1|1',
                    '1|reg|S, 2|0|R, 3|0|R',
                    'Equivalent: pbulc, reg, 0, ulvl    //ulvl can be any value'), 
   
'pbulc.ulck'  : (   '1|1, 2|3',
                    '1|reg|S, 2|1|R, 3|ulvl|S',
                    'Equivalent: pbulc, reg, 1, ulvl'), 
   
'pbreq.nofst' : (   '1|1',
                    '1|ctrl|S, 2|0|R, 3|0|R',
                    'Equivalent: pbreq, ctrl, offset, 0    // offset can be any value'),

'pbreq.ofst'  : (   '1|1, 2|2',
                    '1|ctrl|S, 2|offset|S, 3|1|R',
                    'Equivalent: pbreq, ctrl, offset, 1'),

'cklvl.prol'  : (   '1|1, 2|3',
                    '1|reg|S, 2|0|R, 3|level|S',
                    'Equivalent: reg, 4`b0, level'), 
    
'cklvl.cplh'  : (   '1|1, 2|3',
                    '1|reg|S, 2|1|R, 3|level|S',
                    'Equivalent: reg, 4`b1, level'), 
    
'cklvl.reqh'  : (   '1|1, 2|3',
                    '1|reg|S, 2|2|R, 3|level|S',
                    'Equivalent: reg, 4`b2, level'), 
    
'ckrpb.nofst' : (   '1|1',
                    '1|reg|S, 2|0|R, 3|0|R',
                    'Equivalent: reg, offset, 0 // offset can be any value'),
    
'ckrpb.ofst'  : (   '1|1, 2|2',
                    '1|reg|S, 2|offset|S, 3|1|R',
                    'Equivalent: reg, offset, 1'),
    
'matcl.nofst' : (   '1|1, 2|2, 3|3',  
                    '1|reg|S, 2|ctrl|S, 3|ctrl_mask|S, 4|0|R, 5|0|R', 
                    'Equivalent: reg, ctr, ctr_mask, 0, 0'),   
   
'matcl.ofst'  : (   '1|1, 2|2, 3|3, 4|4',  
                    '1|reg|S, 2|ctrl|S, 3|ctrl_mask|S, 4|offset|S, 5|1|R', 
                    'Equivalent: reg, ctr, ctr_mask, offset, 1'),   
   
'cpphy.nofst' : (   '', 
                    '1|0|R, 2|0|R',
                    'Equivalent: cpphy  offset, 0       // offset can be any value'),  
    
'cpphy.ofst'  : (   '1|1', 
                    '1|offset|S, 2|1|R',
                    'Equivalent: cpphy  offset, 1'),  
    
'ckphy.nofst' : (   '1|1, 2|4, 3|5', 
                    '1|reg|S, 2|0|R, 3|0|R, 4|ctrl|S, 5|nonequal|S',
                    'Equivalent: ckphy  reg, 0, 0, ctrl, nonequal'), 
   
'ckphy.ofst'  : (   '1|1, 2|3, 3|4, 4|5', 
                    '1|reg|S, 2|2|R, 3|offset|S, 4|ctrl|S, 5|nonequal|S',
                    'Equivalent: ckphy  reg, 2, offset, ctrl, nonequal'), 
   
'ckphy.nofsti' : (   '1|1, 2|4, 3|5', 
                     '1|reg|S, 2|1|R, 3|0|R, 4|ctrl|S, 5|nonequal|S',
                     'Equivalent: ckphy  reg, 1, 0, ctrl, nonequal'), 
   
'ckphy.ofsti' : (   '1|1, 2|3, 3|4, 4|5', 
                    '1|reg|S, 2|3|R, 3|offset|S, 4|ctrl|S, 5|nonequal|S',
                    'Equivalent: ckphy  reg, 3, offset, ctrl, nonequal'), 
   
'ccbyt.grnofst' : (    '1|1',   
                       '1|breg|S, 2|0|R, 3|0|R',
                       'Equivalent: ccbyt   breg, offset, 0     // offset can be any value'), 
   
'ccbyt.v0nofst' : (    '',   
                       '1|4|R, 2|0|R, 3|0|R',
                       'Equivalent: ccbyt   4, 0, 0'), 
   
'ccbyt.v1nofst' : (    '',   
                       '1|5|R, 2|0|R, 3|0|R',
                       'Equivalent: ccbyt   5, offset, 0'), 
   
'ccbyt.grofst'  : (    '1|1, 2|2',   
                       '1|breg|S, 2|offset|S, 3|1|R',
                       'Equivalent: ccbyt   breg, offset, 1  '), 
   
'ccbyt.v0ofst' : (    '1|2',   
                      '1|4|R, 2|offset|S, 3|1|R',
                       'Equivalent: ccbyt   4, offset, 1   '), 
   
'ccbyt.v1ofst' : (    '1|2',   
                      '1|5|R, 2|offset|S, 3|1|R',
                       'Equivalent: ccbyt   5, offset, 1   '), 
   
'sbyt.gr'      : (    '1|1, 2|2',
                      '1|breg|S, 2|bval|S',
                      'Equivalent: sbyt    breg, bval       // breg=0,1,2,3'),
                      
'sbyt.v0'      : (    '1|2',
                      '1|4|R, 2|bval|S',
                      'Equivalent: sbyt    4, bval      '),
                      
'sbyt.v1'      : (    '1|2',
                      '1|5|R, 2|bval|S',
                      'Equivalent: sbyt    5, bval      '),

'calre.cal'    : (    '1|2',
                      '1|0|R, 2|addr|S',
                      'Equivalent: calre    0, addr'),
                                                                                                                                                      
'calre.rt'     : (    '',
                      '1|1|R, 2|0|R',
                      'Equivalent: calre    1, addr    // addr can be any value'),
                                                                                                                                                      
'sar.v0'       : (    '1|2',
                      '1|0|R, 2|value|S',
                      'Equivalent: sar    0, value'),
    
'sar.v1'       : (    '1|2',
                      '1|1|R, 2|value|S',
                      'Equivalent: sar    1, value'),
    
'sar.v0r'      : (    '',
                      '1|2|R, 2|0|R',
                      'Equivalent: sar    2, 0'),
    
'sar.v1r'      : (    '',
                      '1|3|R, 2|0|R',
                      'Equivalent: sar    3, 0'),
    
'adar.addv0'   : (    '1|2',
                      '1|0|R, 2|value|S',
                      'Equivalent: adar   0, value'), 
    
'adar.addv1'   : (    '1|2',
                      '1|1|R, 2|value|S',
                      'Equivalent: adar   1, value'), 
    
'adar.subv0'   : (    '1|2',
                      '1|2|R, 2|value|S',
                      'Equivalent: adar   2, value'), 
    
'adar.subv1'   : (    '1|2',
                      '1|3|R, 2|value|S',
                      'Equivalent: adar   3, value'), 
    
'setpr.gr'     : (    '1|2, 2|3, 3|4',
                      '1|0|R, 2|breg|S, 3|l|S, 4|h|S', 
                      'Equivalent: setpr    0, breg, l, h'),   
    
'setpr.sect'   : (    '1|3, 2|4',
                      '1|1|R, 2|0|R, 3|l|S, 4|h|S', 
                      'Equivalent: setpr    1, 0, l, h'),   
    
'setpr.pg'     : (    '1|3, 2|4',
                      '1|2|R, 2|0|R, 3|l|S, 4|h|S', 
                      'Equivalent: setpr    2, 0, l, h'),   
    
'setpr.blk'    : (    '1|3, 2|4',
                      '1|3|R, 2|0|R, 3|l|S, 4|h|S', 
                      'Equivalent: setpr    3, 0, l, h'),   
    
'setpr.lun'    : (    '1|3, 2|4',
                      '1|4|R, 2|0|R, 3|l|S, 4|h|S', 
                      'Equivalent: setpr    4, 0, l, h'),   
    
'jne.grtaddr'  : (    '1|1, 2|2',
                      '1|addr|S, 2|reg|S, 3|0|R, 4|0|R', 
                      'Equivalent: jne    addr, reg, 0, 0'),   
    
'jne.grfpc'    : (    '1|1, 2|2',
                      '1|addr|S, 2|reg|S, 3|0|R, 4|0|R', 
                      'Equivalent: jne    addr, reg, 0, 0'),   
    
'jne.grepc'    : (    '1|1, 2|2, 3|4',
                      '1|addr|S, 2|reg|S, 3|0|R, 4|value|S', 
                      'Equivalent: jne    addr, reg, 0, value'),   
    
'jne.v0taddr'  : (    '1|1',
                      '1|addr|S, 2|0|R, 3|1|R, 4|0|R', 
                      'Equivalent: jne    addr, 0, 1, 0'),   
    
'jne.v0fpc'    : (    '1|1',
                      '1|addr|S, 2|0|R, 3|1|R, 4|0|R', 
                      'Equivalent: jne    addr, 0, 1, 0'),   
    
'jne.v0epc'    : (    '1|1, 2|4',
                      '1|addr|S, 2|0|R, 3|1|R, 4|value|S', 
                      'Equivalent: jne    addr, 0, 1, value'),   
    
'jne.v1taddr'  : (    '1|1',
                      '1|addr|S, 2|1|R, 3|1|R, 4|0|R', 
                      'Equivalent: jne    addr, 1, 1, 0'),   
    
'jne.v1fpc'    : (    '1|1',
                      '1|addr|S, 2|1|R, 3|1|R, 4|0|R', 
                      'Equivalent: jne    addr, 1, 1, 0'),   
    
'jne.v1epc'    : (    '1|1, 2|4',
                      '1|addr|S, 2|1|R, 3|1|R, 4|value|S', 
                      'Equivalent: jne    addr, 1, 1, value'),   
    
'jne.vneqaddr' : (    '1|1',
                      '1|addr|S, 2|2|R, 3|1|R, 4|0|R', 
                      'Equivalent: jne    addr, 2, 1, 0'),   
    
'jne.veqpc'    : (    '1|1',
                      '1|addr|S, 2|2|R, 3|1|R, 4|0|R', 
                      'Equivalent: jne    addr, 2, 1, 0'),

'offst.im'     : (    '1|1',
                      '1|offset|S, 2|0|R', 
                      'Equivalent: offst  offset, 0'),

'offst.v0'     : (    '',
                      '1|0|R, 2|1|R', 
                      'Equivalent: offst  offset, 1'),

'offst.v1'     : (    '',
                      '1|0|R, 2|2|R', 
                      'Equivalent: offst  offset, 2'),

'adbyt.breg'   : (    '1|2, 2|3, 3|4',
                      '1|0|R, 2|breg1|S, 3|breg2|S, 4|breg|S, 5|0|R', 
                      'Equivalent: adbyt    0=ctrl, breg1, breg2, breg, 0=imm'),   
    
'adbyt.imm'    : (    '1|4, 2|2, 3|5',
                      '1|1|R, 2|breg1|S, 3|0|R, 4|breg|S, 5|imm|S', 
                      'Equivalent: adbyt    1=ctrl, breg1, 0=breg2, breg, imm'),   
    
'incptr.cmd'   : (    '1|2',
                      '1|0|R, 2|value|S', 
                      'Equivalent: incptr 0, value'),

'incptr.cpl'   : (    '1|2',
                      '1|1|R, 2|value|S', 
                      'Equivalent: incptr 1, value'),

'setgpo.breg'  : (    '1|2',
                      '1|15|R, 2|breg|S', 
                      'Equivalent: setgpo 15, breg'),

'setgpo.v0'    : (    '',
                      '1|14|R, 2|4|R', 
                      'Equivalent: setgpo 14, 4'),

'setgpo.v1'    : (    '',
                      '1|14|R, 2|5|R', 
                      'Equivalent: setgpo 14, 5'),

'setgpo.gr'    : (    '1|2',
                      '1|14|R, 2|breg|S', 
                      'Equivalent: setgpo 14, breg'),

'setce.idx'    : (    '1|1, 2|3, 3|4',
                      '1|index|S, 2|1|R, 3|l|S, 4|h|S', 
                      'Equivalent: setce index, 1, l, h'),

'setce.gr'     : (    '1|1, 2|3, 3|4',
                      '1|gr_idx|S, 2|2|R, 3|l|S, 4|h|S', 
                      'Equivalent: setce index, 2, l, h'),

'setce.nfc'    : (    '',
                      '1|0|R, 2|0|R, 3|0|R, 4|0|R', 
                      'Equivalent: setce 0, 2, 0, 0'),

'setcpl.breg'  : (    '1|2, 2|3, 3|4',
                      '1|15|R, 2|breg|S, 3|l|S, 4|h|S', 
                      'Equivalent: setcpl 15, breg, l, h'),

'setcpl.v0'   : (    '1|3, 2|4',
                      '1|14|R, 2|4|R, 3|l|S, 4|h|S', 
                      'Equivalent: setcpl 14, 4, l, h'),

'setcpl.v1'   : (    '1|3, 2|4',
                      '1|14|R, 2|5|R, 3|l|S, 4|h|S', 
                      'Equivalent: setcpl 14, 5, l, h'),

'setcpl.gr'   : (    '1|2, 2|3, 3|4',
                      '1|14|R, 2|GRx|S, 3|l|S, 4|h|S', 
                      'Equivalent: setcpl 14, GRx, l, h'),

'setcpl.tm'   : (    '1|3, 2|4',
                      '1|13|R, 2|0|R, 3|l|S, 4|h|S', 
                      'Equivalent: setgpo 13, 0, l, h')
}


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
                'register[breg]:value to set;l:LSB of set param;h:MSB of set param'),

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

'setce' : (37,  '8|index|15, 16|force|19, 20|l|23, 24|h|27',
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


psu_mapping = {}
value_table = {}
ins_list = []
src_list = []
current_address = 0
line_no = 0
instr_on= 0
label_name =""
label_name_list = []

def pseudo_one_line(code_list, collect_value):
    global value_table
    code = []
    code = ""

    # print "debug in pseudo_one_line function body"
    # print "debug input argument are code_list[0]=[%s], collect_value=[%d]" % (code_list[0], collect_value)
    #opcode
    #opcode, opdata, comment = instr_table[code_list[0]]
    mapping, expand, comment = pseudo_instr_table[code_list[0]]
    code_data = 0
    map_data  = 0

    # get instr name
    instr_name = code_list[0].split('.')[0]
    # print "the instr_name=%s" % (instr_name)
    #code.append(instr_name)
    code+="            "
    code+=instr_name

    # do psedu-instr mapping and add in dict
    if mapping != '' :
        for m in mapping.split(','):
            m = m.replace("\t","")
            m = m.replace(" ","")
            map_data += 1
            if m == '':
                break
            psu_pos, ins_pos = m.split('|')
            psu_pos = psu_pos.replace(",", " ")
            psu_pos = psu_pos.replace("\t", " ")
            ins_pos = ins_pos.replace(",", " ")
            ins_pos = ins_pos.replace("\t", " ")
            if unicode(psu_pos).isnumeric() == False:
                print "psedu-position is not numeric %s" % unicode(psu_pos)
                return False, ''
            if unicode(ins_pos).isnumeric() == False:
                print "instr-position is not numeric %s" % unicode(ins_pos)
                return False, ''
            ins_opcode = code_list[int(psu_pos)]
            #print "ins_opcode is %s" % (ins_opcode)
            psu_mapping.update({ins_pos:ins_opcode})
            #print psu_mapping


    for i in expand.split(','):
        code_data += 1        
        i = i.replace("\t","")
        i = i.replace(" ","")
        if i == '':
            break
        d_pos, field, replace = i.split('|')
        if replace == "R":
            #code.append(", ",field)
            if code_data == 1:
                code+="    "
                code+=field
            else:
                code+=", "
                code+=field
        elif replace == "S":
            if psu_mapping.has_key(d_pos):
                psu_map_val = psu_mapping.pop(d_pos)
                #code.append(", ",psu_map_val)
                if code_data == 1:
                    code+="    "
                    code+=psu_map_val
                else:
                    code+=", "
                    code+=psu_map_val
                #print "found psedu-mapping key=%s, value=%s" % (d_pos, psu_map_val)
            else:
                print "Error. Found no psedu-mapping. Key=%s" % (d_pos)
                print "Error. The psedu-mapping table=%s" % (psu_mapping)

    #print "final convert code=%s" % code
    psu_mapping.clear()
    return True, code

#   return True, dword

def pseudo_code_file(filename, collect_value):
    global value_table
    global ins_list
    global src_list
    global line_no
    global current_address
    global label_name
    global instr_on
    global label_name_list
    ins_list = []
    src_list = []
    label_name_list = []
    current_address = 0
    line_no = 0
    line_def_list = []



    with open(filename, 'r') as mcfile:
#        import pdb
#        pdb.set_trace()
        for defval in def_list:
            ins_list.append("`define ")
            ins_list.append(defval)
            ins_list.append("\n")
        for l in mcfile.readlines():
            try:
                line_no += 1
                #print line_no

                #remove comment first
                line = l.rstrip()
                line_orig = line
                line = line.split('#')[0]
                line = line.replace(",", " ")
                line = line.replace("\t", " ")
                line = line.replace("\n", "")
                #line = line.lower()
                
                # write down all in-file directive syntax and return
                line_def_list = l.split()

                if (len(line_def_list)>0 and line_def_list[0]=='`define'):
                    ins_list.append(line_orig)
                    ins_list.append("\n")
                    continue
                elif  (len(line_def_list)>0 and line_def_list[0]=='`ifdef'):
                    ins_list.append(line_orig)
                    ins_list.append("\n")
                    continue
                elif  (len(line_def_list)>0 and line_def_list[0]=='`else'):
                    ins_list.append(line_orig)
                    ins_list.append("\n")
                    continue
                elif  (len(line_def_list)>0 and line_def_list[0]=='`endif'):
                    ins_list.append(line_orig)
                    ins_list.append("\n")
                    continue


                if collect_value == True:
                    #print "True"
                    #print ("True line=%s") % line
                    if ':' in line:
                        #print ("Debug line=%s") % line
                        #print ("Debug line_orig=%s") % line_orig
                        raw_line = line_orig
                        #print ("Debug raw_line=%s") % raw_line
                        raw_line = raw_line.lstrip()
                        if (raw_line!='') :
                            #label_name = label_name.lstrip()
                            label_name_chk = raw_line.split(':')[0]
                            if (' ' in label_name_chk) :
                                print "Error: label contains space before :"
                                print "       %s" % (raw_line)
                                exit(1)

                if collect_value == False:
                    #print "False"
                    #generate label, treated as a value
                    if ':' in line:
                        label_name = line.split(':')[0]
                        line       = line.split(':')[1]
                        #if label_name!="" (empty), then add to label_name_list
                        if label_name.strip()=="" :
                            print "Error: the label has problem in below line:"
                            print "       %s:%s" % (label_name,line)
                            exit(1)
                        else :
                            #label valid, check if repeat
                            if (label_name in label_name_list) :
                                print "Error: the label had already added"
                                print "       %s" % label_name
                                exit(1)
                            else :
                                label_name_list.append(label_name)
                                
                        #print "Contain : label_name=%s, line=%s" % (label_name, line)

                #generate code for this instruction
                #print line
                instr = line.split()
                if len(instr) == 0:
                    #copy label lines to instr file
                    ins_list.append(line_orig)
                    ins_list.append("\n")
                    if label_name == "LABEL_0":
                        instr_on = 1
                    continue

                #assemble line
                if instr_table.has_key(instr[0]):
                    ins_list.append(line_orig)
                    ins_list.append("\n")
                    continue


                if pseudo_instr_table.has_key(instr[0]):
                    # print("find pesud_instr_code. line=[%s] collect_value=[%d] Pseudo code=[%s]\n") % (line, collect_value,instr[0])
                    # print("find result = %d\n") % pseudo_instr_table.has_key(instr[0])
                    ret, code = pseudo_one_line(line.split(), collect_value)
                    # print("[debug] ret=%s, code=%s\n") % (ret, code)
                    ins_list.append('# Orignal # ')
                    line_orig=line_orig.lstrip()
                    ins_list.append(line_orig)
                    ins_list.append("\n")
                    # print "#Pseudo Code#%s\n" % line_orig
                    ins_list.append(code)
                    ins_list.append("\n")
                    # print "             %s\n" % code
                    continue
                else:
                    if instr_on == 1:
                        print "Error: line %d: %s. [Instr unrecongnized!] instr_check=%d" % (line_no, line, instr_on)                        
                        print "mcpmc2as.py Can NOT found instr or pseudo instr %s in the file" % instr[0]
                        return False


                if '=' in line:
                    instr = line.split('=')[0]
                    if unicode(instr).isnumeric() == False:
#                        print("find assign == in line [%s]\n")
                        ins_list.append(line_orig)
                        ins_list.append("\n")
                        continue
                    else:
                        print "Error: line %d: %s. [Variable unrecongnized!]" % (line_no, line)
                        return False

            except:
                print "Error: line in except %d: %s. [Except happend!]" % (line_no, line)
                return False
                ##sys.exit(1)
    return True
def parse_define_plus(plus_def) :
    global def_list
    #print ("capture=%s") % plus_def
    left_def = plus_def
    left_def = plus_def.split('+')[1:]
    def_list = def_list + left_def
    #print "lft=%s" % def_list
    print

def help():
    print ("-------------------------------------------------------------------------")
    print ("Pseudo mcode compiler usage:")
    print ("        [-h | --help]                       print this help")
    print ("        [-d | --def]  MACRO_DEFINE          only support adding SINGLE macro definition")
    print ("        --define      +DEF_1+DEF_2+DEF_3    could support COMBINED MULTIPLE use of +define")
    print ("")    
    print ("Example 1: Print help                                                    ")    
    print ("")    
    print ("        ./mcpmc2as.py -h                                                     ")    
    print ("                                                                         ")
    print ("Example 2: Add macro define                                              ")    
    print ("")    
    print ("        ./mcpmc2as.py c_mng_program_mode7.mc -d DEFINE_1 -d DEFINE_2 --def DEFINE_3 --def DEFINE_4 --define +DEFINE_5+DEFINE_6")    
    print ("                                                                         ")
    print ("Direct Sytax Supported in Source File:                                   ")
    print ("        `define                                                          ")
    print ("        `ifdef                                                           ")
    print ("        `else                                                            ")
    print ("        `endif                                                           ")

if __name__ == '__main__':

    try:
        opts,args = getopt.getopt(sys.argv[2:], "h:d:",["def=","define=","help"])
    except:
        print "                                        "
        print "Exception Happened: Input argument error"
        help()
        exit(1)

    assert len(sys.argv) > 1
    if (sys.argv[1]=="-h") :
        help()
        exit(0)
    elif (sys.argv[1]=="--help") :
        help()
        exit(0)
    else:
        source_name = sys.argv[1]
        instr_code_name = '%s.ins' % source_name.split('.')[0]


    #print("opts=%s, args=%s") % (opts,args)

    for op,value in opts :
        if op in ("-h", "--help") : 
            print ("help asseerted args=%s") % value
            exit(0)
        elif op in ("-d", "--def") : 
            print ("define=%s") % value
            def_list.append(value)
        elif op in ("--define") :
            parse_define_plus(value)



    if True == os.path.exists(instr_code_name):
            os.remove(instr_code_name)

    #first time to collect value and label
    if True == pseudo_code_file(source_name, True):
        #second time to refer label backward
        #pseudo_code_file(source_name, False)
        #pdb.set_trace() 
        if False == pseudo_code_file(source_name, False):
            sys.exit(1)
        with open(instr_code_name, 'w') as instr_code_file:
            instr_code_file.writelines(ins_list)
    else:
        print "Error. main error"
        sys.exit(1)
            
