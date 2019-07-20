#`define  SLC_PROG_4PLANE_AUTO
#`define  TLC_PROG_4PLANE_AUTO
#`define  TLC_ONE_CMD_PROGRAM
`define  SECONDARY_MULTI_PLANE_READ
#`define  PRIMARY_MULTI_PLANE_READ
#`define  MICRON_B16A_UNIFY_PROGRAM 
`define  MICRON_B0KB_TLC_PROGRAM_LEGACY_WAY 
`define  NON_INDEPENDENT_MULTI
`define  YMTC_64L_ATOMIC_PROGRAM
#`define  INDEPENDENT_MULTI
#`define   MODE8
`define   MODE7

#microcode of MCNFC NAND mananger

##### OP List #####
C_INIT_DEB =0
C_ERASE =1
C_PROG_NATIVE =2
C_PROG_NATIVE_1CMD_2PLANE = 3
C_READ_DDR =4
C_READ_SDR =5
C_READ_REY =6
C_SOFT_READ=7
C_PROG_SLC =8
C_READ_SLC =9
C_PROG_SLC_1CMD_2PLANE = 10
C_16K_READ_DDR=11
C_RETRUN_DUMMY_OP  =12
C_PROG_DUMMY       =13
C_16K_SLC_READ_DDR =14
C_RAW_CMD          =15












##### CTRL List #####
C_RAW_CTRL_CMD  = 0
C_RAW_CTRL_ADDR = 1
C_RAW_CTRL_ASYNC_READ   = 2
C_RAW_CTRL_SYNC_8_READ  = 3
C_RAW_CTRL_SYNC_2_WRITE = 4
C_RAW_CTRL_SYNC_2_READ  = 5
C_RAW_CTRL_DATA = 6
C_RAW_CTRL_SYNC_8_WRITE = 7
C_RAW_CTRL_ASYNC_4_READ = 8
C_RAW_CTRL_ASYNC_WRITE_4_BYTE = 9 



C_INIT_CTRL_RST    = 0
C_INIT_CTRL_HD_RST = 1
C_INIT_CTRL_GETF_BY_LUN  = 2
C_INIT_CTRL_SETF_BY_ADDR = 4
C_INIT_CTRL_GETF_BY_ADDR = 5
C_INIT_CTRL_RDID   = 8
C_INIT_CTRL_SETF_BY_LUN  = 9


C_INIT_CTRL_RDPARAM      = 7
C_INIT_CTRL_TEST         = 15


##### Instruction List ######
C_NOP    =  0
C_SETB   =  1
C_SETS   =  2
C_INCPTR =  3
C_MATOP  =  4
C_JNZ    =  5
C_WK     =  6
C_YIELD  =  7
C_STACP  =  8
C_RETI   =  9
C_SETP   =  10
C_SETPR  =  11
C_PBULC  =  12
C_PBREQ  =  13
C_CKLVL  =  14
C_CKRPB  =  15
##
C_MATCL  =  16
C_GCLVL  =  17
C_CPPHY  =  18
C_CKPHY  =  19
C_TMRST  =  20
C_TMREA  =  21
C_MLCTL  =  22
C_MLIDL  =  23
C_OFFST  =  24
C_CCBYT  =  25
C_SBYT   =  26
C_CMBYT  =  27
C_ADBYT  =  28
C_CALRE  =  29
C_NOT    =  30
C_END    =  31
C_SAR     =  32
C_ADAR     =  33
C_JNE     =  34
C_STGPI  =  35



#define registers
r0 = 0
r1 = 1
r2 = 2
r3 = 3
r4 = 4
r5 = 5
r6 = 6
r7 = 7
r8 = 8
r9 = 9
r10 = 10
r11 = 11
r12 = 12
r13 = 13
r14 = 14
r15 = 15
r16 = 16
r17 = 17
r18 = 18
r19 = 19
r20 = 20
r21 = 21
r22 = 22
r23 = 23
r24 = 24
r25 = 25
r26 = 26
r27 = 27
r28 = 28
r29 = 29
r30 = 30
r31 = 31

B0 = 0
B1 = 1
B2 = 2
B3 = 3
B15 = 15

R0 = 0
R1 = 1
R2 = 2
R3 = 3
R4 = 4
R5 = 5
R6 = 6
R7 = 7
R8 = 8
R9 = 9
R10 = 10
R11 = 11
R12 = 12
R13 = 13
R14 = 14
R15 = 15
R16 = 16
R17 = 17
R18 = 18
R19 = 19
R20 = 20
R21 = 21
R22 = 22
R23 = 23
R24 = 24
R25 = 25
R26 = 26
R27 = 27
R28 = 28
R29 = 29
R30 = 30
R31 = 31
#define other values
true = 1
false = 0


##### Control List ######
C_CTR_SLC     = 0
C_CTR_MLC     = 16
C_CTR_TLC     = 32

C_MP_AUTO   = 0
C_MP_DIS    = 1
C_MP_FOR2   = 2
C_MP_FOR4   = 3

C_PAGE_LOWER  = 0
C_PAGE_EXTRA  = 4
C_PAGE_UPPER  = 8

C_SETP_SECTOR = 0
C_SETP_PAGE   = 1
C_SETP_BLOCK  = 2
C_SETP_LUN    = 3





C_UCL_A_MPAUTO    =0  ## A for SLC pages
C_UCL_A_MPDIS     =1  ## A for SLC pages

C_UCL_A_MPFOR2    =2  ## A for SLC pages
C_UCL_A_MPFOR4    =3  ## A for SLC pages
C_UCL_B_MPAUTO    =0  ## B for MLC pages
C_UCL_B_MPDIS     =1  ## B for MLC pages
C_UCL_B_MPFOR2    =2  ## B for MLC pages
C_UCL_B_MPFOR4    =3  ## B for MLC pages

C_UCL_A_PROG      =0  ## A for SLC pages
C_UCL_B_PROG      =4  ## B for MLC pages

C_UCL_EASUP       =3
C_UCL_PROSUP      =4

C_MP_AUTO   = 0
C_MP_DIS    = 1
C_MP_FOR2   = 2
C_MP_FOR4   = 3


C_PAGE_LSB  = 0
C_PAGE_CSB  = 4
C_PAGE_MSB  = 8
C_PAGE_TLC  = 12

C_UPPER_PAGE = 8
C_EXTRA_PAGE = 4
C_LOWER_PAGE = 0

C_AUTO_ADJUST  = 16

C_RR_DIRECT = 0
C_RR_INDEX  = 1

C_SUS_EN    = 0
C_SUS_DIS   = 16
C_SUS_GO    = 32
C_SUS_RESU  = 48

C_POWLS_CAN_EN  = 0
C_POWLS_CAN_DIS = 64

C_CACHED_DIS = 0
C_CACHED_EN  = 128
C_CACHE_READ = 1

C_ERASE_CTRL_TLC = 32
C_ERASE_CTRL_SLC = 0

##### Command Line Definition ###### 
I_CL_RESET       = 0 
I_CL_ASYNC_RS    = 1
I_CL_ASYNC_RDID  = 2 
I_CL_RESERVED_3  = 3
I_CL_SYNC_RS_70H = 4
I_CL_SETF_BY_ADDR      = 5
I_CL_SETF_BY_ADDR_DATA = 6
I_CL_GETF         = 7
I_CL_GETF_BY_ADDR = 7


I_CL_SYNC_RS_78H = 8
I_CL_ERASE       = 9
I_CL_PROG        = 10
I_CL_RST_LUN     = 11
I_CL_READ_COMMON = 12
I_CL_READ_COL    = 13
I_CL_READ_COL_P2 = 14

I_CL_SETF_BY_LUN      = 15
I_CL_SETF_BY_LUN_DATA = 16

I_CL_ASYNC_RS_71H = 17
I_CL_GETF_BY_LUN  = 18

I_CL_SYNC_RDID   = 19

I_CL_RESERVED_20 = 20
I_CL_RESERVED_21 = 21

I_CL_4K_CONT_READ= 22

I_CL_RESERVED_23 = 23
I_CL_RESERVED_24 = 24
I_CL_RESERVED_25 = 25
I_CL_RESERVED_26 = 26

I_CL_SYNC_ISSUE_CMD     = 27
I_CL_SYNC_ISSUE_ADDR    = 28
I_CL_SYNC_ISSUE_DATA    = 33
I_CL_ASYNC_READ_1BYTE   = 29
I_CL_SYNC_READ_2BYTES   = 35
I_CL_SYNC_READ_8BYTES   = 30
I_CL_SYNC_WRITE_2BYTES  = 31
I_CL_SYNC_WRITE_8BYTES  = 36
I_CL_ASYNC_READ_4BYTES  = 38 
I_CL_ASYNC_WRITE_4BYTES = 39

I_CL_RESERVED_32 = 32


I_CL_RESERVED_34 = 34


I_CL_RESERVED_39  = 39
I_CL_RESERVED_40 = 40
I_CL_RESERVED_41 = 41
I_CL_RESERVED_42 = 42
I_CL_RESERVED_43 = 43
I_CL_RESERVED_44 = 44
I_CL_RESERVED_45 = 45
I_CL_RESERVED_46 = 46

I_CL_PROG_DUMMY = 47

I_CL_RESERVED_48 = 48

I_CL_SYNC_RS_71H = 49
I_CL_MP2_ERASE = 50
I_CL_READ_3F = 54



I_CL_F1_F2_RS = 51
I_CL_READ_SLC = 52
I_CL_SLC_READ_CAH_MUL_CMD   = 53
I_CL_SLC_READ_MUL_CMD   = 53
I_CL_SLC_READ_CAH_CMD   = 53
I_CL_SLC_READ_NOR_CMD   = 53
I_CL_TLC_READ_COMMON = 53
I_CL_MUL_READ_SECONDARY_CMD = 53
I_CL_READ_LSB_NOR_CMD = 53
I_CL_READ_MSB_MUL_CMD   = 53
I_CL_READ_CSB_MUL_CMD   = 53
I_CL_READ_LSB_MUL_CMD   = 53

I_CL_READ_MSB_CAH_CMD   = 53
I_CL_READ_CSB_CAH_CMD   = 53
I_CL_READ_LSB_CAH_CMD   = 53

I_CL_READ_MSB_NOR_CMD   = 53
I_CL_READ_CSB_NOR_CMD   = 53
I_CL_READ_LSB_NOR_CMD   = 53
I_CL_RR_CSB = 53
I_CL_RR_SLC             = 53 
I_CL_RR_LSB             = 53
I_CL_RR_MSB             = 53
I_CL_RR_CSB             = 53
I_CL_SOFT_RR            = 53
I_CL_RR_CSB_LAST        = 53
I_CL_READ_CMD           = 53
I_CL_SYNC_PAR_FEA       = 53
I_CL_SOFT_RR_POS        = 53
I_CL_SOFT_RR_NEG        = 53

I_CL_RESERVED_52 = 52
I_CL_RESERVED_53 = 53
I_CL_RESERVED_54 = 54
I_CL_RESERVED_55 = 55
I_CL_RESERVED_56 = 56
I_CL_RESERVED_57 = 57
I_CL_RESERVED_58 = 58
I_CL_RESERVED_59 = 59
I_CL_RESERVED_60 = 60
I_CL_RESERVED_61 = 61
I_CL_RESERVED_62 = 62
I_CL_RESERVED_63 = 63
## command line number in ITFC
I_CL_ASYNC_RESET        = 0 
I_CL_ASYNC_RS           = 1
I_CL_ASYNC_RDID         = 2 
I_CL_SETF01             = 3 
I_CL_SYNC_RS_70H        = 4
I_CL_SETF02_CMD         = 5
I_CL_SYNC_SET_FEA       = 5
I_CL_SYNC_PAR_FEA       = 15
I_CL_SETF02_DATA        = 6
I_CL_GETF02_DATA        = 7
I_CL_SYNC_RS_78H        = 8
I_CL_ERASE              = 9
I_CL_PROG               = 10
I_CL_RST_LUN            = 11
I_CL_READ_CMD           = 12
I_CL_READ_P1            = 13
I_CL_READ_P2            = 14
I_CL_RR_SLC             = 15
I_CL_RR_LSB             = 15
I_CL_RR_MSB             = 15
I_CL_RR_CSB             = 15
I_CL_RR_COMMON          = 15
I_CL_SOFT_RR            = 15
I_CL_RR_CSB_LAST        = 18
I_CL_SYNC_RDID          = 19              
I_CL_ERASE_SLC          = 20
I_CL_PROG_SLC           = 21
I_CL_CP_RRT_CMD         = 22
I_CL_4K_CONT_READ       = 22
I_CL_SDR_READ_CMD       = 23
I_CL_SYNC_SOFTBIT_SET   = 24
I_CL_READ_SLC           = 25
I_CL_PROG_MLC           = 26
I_CL_SYNC_ISSUE_CMD     = 27
I_CL_SYNC_ISSUE_DATA    = 33
I_CL_SYNC_RS_72H        = 34
I_CL_SYNC_RAW_RD_2B     = 35
I_CL_SYNC_WRITE_8BYTES  = 36
I_CL_SYNC_WRITE_8BYTES_SEC  = 37
I_CL_ASYNC_READ_4BYTES  = 38
 

I_CL_SLC_READ_3F            = 54
I_CL_SLC_SEC_READ_COMMON    = 40
I_CL_SLC_TLC_READ_COMMON    = 41



I_CL_PROG_DUMMY         = 47
I_CL_MP2_ERASE_SLC      = 48
I_CL_SYNC_RS_71H        = 49
I_CL_MP2_ERASE          = 50

I_CL_F1_F2_RS           = 51
I_CL_SOFT_RR_NEG        = 52
I_CL_SOFT_RR_POS        = 53
I_CL_READ_3F            = 54
I_CL_PROG_POST          = 56


## Worker ctrl
## bit[3] : no stuck
## bit[2] : on busy yield
## bit[1] : data enable
## bit[0] : status enable

C_WK_CTRL_0 = 0 
C_WK_CTRL_1 = 1 
C_WK_CTRL_2 = 2 
C_WK_CTRL_3 = 3 
C_WK_CTRL_4 = 4 
C_WK_CTRL_5 = 5 
C_WK_CTRL_6 = 6 
C_WK_CTRL_7 = 7 
C_WK_CTRL_8 = 8 
C_WK_CTRL_9 = 9 
C_WK_CTRL_A = 10
C_WK_CTRL_B = 11
C_WK_CTRL_C = 12
C_WK_CTRL_D = 13
C_WK_CTRL_E = 14
C_WK_CTRL_F = 15
## Readable Worker Control
C_WK_CTRL_STK_NYLD_NDS = 0 
C_WK_CTRL_STK_NYLD_S   = 1 
C_WK_CTRL_STK_NYLD_D   = 2 
C_WK_CTRL_STK_NYLD_DS  = 3 
C_WK_CTRL_STK_YLD_NDS  = 4 
C_WK_CTRL_STK_YLD_S    = 5 
C_WK_CTRL_STK_YLD_D    = 6 
C_WK_CTRL_STK_YLD_DS   = 7 
C_WK_CTRL_NSTK_NYLD_NDS= 8 
C_WK_CTRL_NSTK_NYLD_S  = 9 
C_WK_CTRL_NSTK_NYLD_D  = 10
C_WK_CTRL_NSTK_NYLD_DS = 11
C_WK_CTRL_NSTK_YLD_NDS = 12
C_WK_CTRL_NSTK_YLD_S   = 13
C_WK_CTRL_NSTK_YLD_D   = 14
C_WK_CTRL_NSTK_YLD_DS  = 15

LABEL_NA = 0
C_POS = 0
C_NEG = 1

C_CMD_00H = 0
C_CMD_20H = 32
C_CMD_30H = 48
C_CMD_31H = 49
C_CMD_32H = 50

C_CTRL_MASK_FC = 252  #
C_CTRL_MASK_EF = 239  #

##
BIT_LSB_CA = 0
BIT_MSB_CA = 15
BIT_LSB_PA = 16
BIT_MSB_PA = 25
BIT_LSB_BA = 26
BIT_MSB_BA = 37
BIT_LSB_LA = 38
BIT_MSB_LA = 39

##SETP_ID_PA = 1
##SETP_ID_BA = 2
#SETP_ID_LA = 3
SETP_ID_NO_PS= 3
SETP_ID_NO_CA= 1
SETP_ID_ALL  = 0

SET_OFFSET_DIRECT = 1


## ---------Constranit----------------
##  Before developing mcode, user should note below contraint.
## -----------------------------------
##    PROG
## 1. r0 as temp register for jump
## 2. r1 as buffer lock flag, if buffer_lock, the whole program is done, can could yield
## 3. r2 as 1cmd-1plane/1cmd-2plane flag. 0=1cmd-1plane; 1=1cmd-2plane
## 4. r4 used as flag of ?th plane in ONE 1cmd-2plane cmd (Example: r4=0, means executing 1st plane for 1cmd-2plane cmd, 
##    r4=1, means executing 2nd plane for 1cmd-2plane)
## 5. r5 as cache flag (cache finish)
## 6. r6 as cache flag (init+middle), original is used r4, now, moved to r6
## 5. r7 as SLC flag mark, 1=SLC, 0=TLC
##    In above, could use jnz/jne for r4 judge, while R3.r28 has the same meaning as r4, r28 could NOT BE USED for jnz/jne !!!
## 4. R3 [r24~r31] as setgpo cnt,need init clean to zer0
## 6. R2 = used as postfix value, range in func, temp; SLC da/df will also reuse R2 register; as compare number (2 or 5) see if atomic is reach maximux
## 7. R1 = used as atomic cnt, for sequence control 
##
##    SOFT BIT READ
## 1. LABEL_SOFT_READ_FEATURE_SET needs 2 arguments: V0==L/C/M prefix index (1/2/3), V1=Type (RR/Pos/Neg/Clear)
##
##    ERASE (SLC & TLC)
## 1. GR1, GR2 are reserved for CPL DQ bit0-bit2 return and compare
## 2. For slc and tlc erase code reuse, GR3 will be used as slc/tlc flag (0=slc, 1=tlc)
##
## -----------------------------------
##    read 4k
## 1. r8 normal multi-plane read flag      no_used
## 2. r9 cached read multi-plane flag      no_used
## 3. r10 single plane cached read flag    no_used
## update GR usage
## 1. GR[15:8]  current read cmd sector flag. 8'h00:sector0  8'h01:sector1 8'h02:sector2 8'h03:sector3.  sector acculate in this byte when loop
## 2. GR[23:16] next read cmd sector flag. 8'h00:sector0  8'h01:sector1 8'h02:sector2 8'h03:sector3. GR[23:16] also store F1/F2 for read status before yeild
## 3. v0: first read page ctrl. 8'h00: lsb, 8'h01:csb, 8'h02:msb
## 4. v1: second and the following read page ctrl. 8'h00: lsb, 8'h01:csb, 8'h02:msb
## 5. GR[31:24] store current cmd word line info.
## 6. GR[7:0] temply store next cmd word line info, in order to compare
## -----------------------------------
C_PROG_ON  = 0
C_PROG_END = 1
C_T1_BLOCK_BIT = 12 
C_T1_CMD_CTRL_BIT = 52
C_PAGE_IN_PARAM_START = 40
C_BLOCK_IN_PARAM_START = 52
C_CMD_CTR_SHARED_TYPE_START = 56
C_CMD_CTR_ATOMIC_EN_START = 59
C_CMD_CTR_ATOMIC_ACTIVE_START = 58
C_LUN_IN_PARAM_START = 62
C_ITFC_PARAM_BLK_START = 27
C_ITFC_PARAM_BLK_END = 37
C_CMD_RETRY_DATA_START = 192

slc_prog_low_thrs = 40
tlc_prog_low_thrs = 40
level_l0 = 50 
level_h0 = 50
level_2k = 256
level_empty = 50

level_2k_ingress_low = 40

#chk_read_1st_level = 143
chk_soft_read_1st_level = 143
chk_soft_read_2nd_level = 286
chk_read_1st_level = 80
chk_read_2nd_level = 286


## DO NOT CHANGE LABEL_0
## LABEL_0 is reserved for check

LABEL_0:    
            matop       r0, C_READ_DDR, 0, 0      
            jnz         LABEL_READ_TLC_ENTRY, r0, 0
            matop       r0, C_16K_READ_DDR, 0, 0      
            jnz         LABEL_PAGE_READ_TLC_ENTRY, r0, 0
            matop       r0, C_16K_SLC_READ_DDR, 0, 0      
            jnz         LABEL_PAGE_READ_SLC_ENTRY, r0, 0
            matop       r0, C_READ_SLC, 0, 0      
            jnz         LABEL_READ_SLC_ENTRY, r0, 0
            matop       r0, C_READ_REY, 0, 0
            jnz         LABEL_RR_ENTRY, r0, 0
            matop       r0, C_PROG_SLC, 0, 0
            jnz         LABEL_PROG_SLC_ENTRY, r0, 0            
            matop       r0, C_PROG_SLC_1CMD_2PLANE, 0, 0
            jnz         LABEL_PROG_SLC_ENTRY_1CMD_2PLANE, r0, 0            
            matop       r0, C_PROG_NATIVE, 0, 0
            jnz         LABEL_PROG_NATIVE_ENTRY, r0, 0
            matop       r0, C_PROG_NATIVE_1CMD_2PLANE, 0, 0
            jnz         LABEL_PROG_NATIVE_ENTRY_1CMD_2PLANE, r0, 0
            matop       r0, C_PROG_DUMMY, 0, 0
            jnz         LABEL_PROG_DUMMY_ENTRY, r0, 0
            matop       r0, C_ERASE, 0, 0
            jnz         LABEL_SYNC_ERASE_XLC_ENTRY, r0, 0
            matop       r0, C_RAW_CMD, 0, 0
            jnz         LABEL_RAW_CMD_ENTRY, r0, 0
            matop       r0, C_INIT_DEB, 0, 0
            jnz         LABEL_INIT_DEB_ENTRY, r0, 0          

            ####matop       r0, C_16K_SLC_READ_DDR, 0, 0      
            ####jnz         LABEL_SLC_PAGE_READ_ENTRY, r0, 0
            ####matop       r0, C_SOFT_READ, 0, 0
            ####jnz         LABEL_SOFT_READ_ENTRY, r0, 0
            ####matop       r0, C_READ_SDR, 0, 0
            ####jnz         LABEL_READ_SDR_ENTRY, r0, 0
            ####matop       r0, C_PROG_SDR, 0, 0
            ####jnz         LABEL_PROG_SDR_ENTRY, r0, 0
            #matop       r0, C_PROG_SLC, 0, 0
            #jnz         LABEL_PROG_ENTRY, r0, 0            

            #interface functions
            
            
            incptr.cmd  1    
            end         

## Nand init debug entry
LABEL_INIT_DEB_ENTRY:
            matcl       r0, C_INIT_CTRL_RST,   0, 0, SET_OFFSET_DIRECT
            jnz         LABEL_RST_ENTRY, r0, 0

            matcl       r0, C_INIT_CTRL_HD_RST, 0, 0, SET_OFFSET_DIRECT
            jnz         LABEL_SYNC_HD_RST_ENTRY, r0, 0

            matcl       r0, C_INIT_CTRL_RDID, 0, 0, SET_OFFSET_DIRECT
            jnz         LABEL_SYNC_RDID_ENTRY, r0, 0

            matcl       r0, C_INIT_CTRL_SETF_BY_ADDR, 0, 0, SET_OFFSET_DIRECT
            jnz         LABEL_SYNC_SETF_BY_ADDR_ENTRY, r0, 0

            matcl       r0, C_INIT_CTRL_SETF_BY_LUN, 0, 0, SET_OFFSET_DIRECT
            jnz         LABEL_SYNC_SETF_BY_LUN_ENTRY, r0, 0

            matcl       r0, C_INIT_CTRL_GETF_BY_ADDR, 0, 0, SET_OFFSET_DIRECT
            jnz         LABEL_SYNC_GETF_BY_ADDR_ENTRY, r0, 0

            matcl       r0, C_INIT_CTRL_GETF_BY_LUN, 0, 0, SET_OFFSET_DIRECT
            jnz         LABEL_SYNC_GETF_BY_LUN_ENTRY, r0, 0

            matcl       r0, C_INIT_CTRL_RDPARAM, 0, 0, SET_OFFSET_DIRECT
            jnz         LABEL_SYNC_RDPARAM_ENTRY, r0, 0

            matcl       r0, C_INIT_CTRL_TEST, 0, 0, SET_OFFSET_DIRECT
            jnz         LABEL_SYNC_MCODE_TEST_ENTRY, r0, 0

## ITFC Debug test entry
LABEL_RAW_CMD_ENTRY:
            matcl       r0, C_RAW_CTRL_CMD, 0, 0, SET_OFFSET_DIRECT
            jnz         ITFC_ISSUE_CMD, r0, 0
            matcl       r0, C_RAW_CTRL_DATA, 0, 0, SET_OFFSET_DIRECT
            jnz         ITFC_ISSUE_DATA, r0, 0
            matcl       r0, C_RAW_CTRL_ADDR, 0, 0, SET_OFFSET_DIRECT
            jnz         ITFC_ISSUE_ADDR, r0, 0
            matcl       r0, C_RAW_CTRL_SYNC_2_READ, 0, 0, SET_OFFSET_DIRECT
            jnz         ITFC_SYNC_READ_2_BYTE, r0, 0         
            matcl       r0, C_RAW_CTRL_SYNC_8_READ, 0, 0, SET_OFFSET_DIRECT
            jnz         ITFC_SYNC_READ_8_BYTE, r0, 0
            matcl       r0, C_RAW_CTRL_SYNC_2_WRITE, 0, 0, SET_OFFSET_DIRECT
            jnz         ITFC_SYNC_WRITE_2_BYTE, r0, 0 
            matcl       r0, C_RAW_CTRL_SYNC_8_WRITE, 0, 0, SET_OFFSET_DIRECT
            jnz         ITFC_SYNC_WRITE_8_BYTE, r0, 0 
            matcl       r0, C_RAW_CTRL_ASYNC_READ, 0, 0, SET_OFFSET_DIRECT
            jnz         ITFC_ASYNC_READ_BYTE, r0, 0    
            matcl       r0, C_RAW_CTRL_ASYNC_4_READ, 0, 0, SET_OFFSET_DIRECT
            jnz         ITFC_ASYNC_READ_4_BYTE, r0, 0
            matcl       r0, C_RAW_CTRL_ASYNC_WRITE_4_BYTE, 0, 0, SET_OFFSET_DIRECT
            jnz         ITFC_ASYNC_WRITE_4_BYTE, r0, 0          




## Reset FFh
LABEL_RST_ENTRY:
            sets        0, 5, 1
            wk          I_CL_RESET, C_WK_CTRL_8, LABEL_RST_ENTRY
            jnz.fc      LABEL_ASYNC_RS_71H
            nop         

## ASYNC Read Status 71h
LABEL_ASYNC_RS_71H:
            yield   
            offst.im    0
            #ccbit       39, 8, 15   ## copy lun bit to B1
            setpr.lun   0, 7        ## copy lun to itfc_param 0
            #setp.nofst  7, 0        ## offset=0, copy lun, shift=0    
            wk          I_CL_ASYNC_RS, C_WK_CTRL_1, LABEL_ASYNC_RS_71H
            stacp       r0, 1, 6
            jnz         LABEL_ASYNC_RS_71H, r0, 0
            sets        0, 5, 0
            reti        0, 0, 0, LABEL_ASYNC_RS_71H
            incptr.cmd  1      
            end         
            nop         


LABEL_SYNC_HD_RST_ENTRY:
           sets 0, 5, 1
           yield
LABEL_SYNC_HD_RST_CHK_LUN:
           #setpr.pg   16, 26
           #setpr.blk  27, 38
           #setpr.lun  39, 39
           offst.im     0
           setp.noca    0, 0 
           wk           I_CL_SYNC_RS_78H, 5, LABEL_SYNC_HD_RST_CHK_LUN
           stacp        r0, 1, 6  # copy bit6 of return data and invert, 1 means not ready
           jnz          LABEL_SYNC_HD_RST_CHK_LUN, r0, 0
           #stacp        r0, 1, 5  # copy bit5 of return data and invert, 1 means not ready
           #jnz          LABEL_SYNC_HD_RST_CHK_LUN, r0, 0
LABEL_SYNC_HD_RST_ISSUE_CMD:
           sbyt         0, 253    # GR[0] = 8'hFD
           setpr.gr     r0, 0, 7
           wk           I_CL_SYNC_ISSUE_CMD, 0, LABEL_SYNC_HD_RST_ISSUE_CMD
LABEL_SYNC_HD_RST_CHK_DONE:
           yield   
           offst.im    0
           setpr.lun   0, 7        ## copy lun to itfc_param 0
           wk          I_CL_ASYNC_RS, C_WK_CTRL_5, LABEL_SYNC_HD_RST_CHK_DONE
           stacp       r0, 1, 6
           jnz         LABEL_SYNC_HD_RST_CHK_DONE, r0, 0
LABEL_SYNC_HD_RST_RETI:
           reti        0, 0, 0, LABEL_SYNC_HD_RST_RETI
           sets        0, 5, 0
           #reti        0, 0, 0, LABEL_0
           incptr.cmd  1      
           end


## SYNC Read ID 90h
LABEL_SYNC_RDID_ENTRY:   
            ##reti        0, 0, 0, LABEL_0
            sets        0, 5, 1
            mlctl       0
LABEL_SYNC_RDID_MLIDL_CHK:
            mlidl       r0
            jnz.nfc     LABEL_SYNC_RDID_MLIDL_CHK_BUSY, r0
            jnz.fc      LABEL_SYNC_RDID_MLIDL_CHK_PASS 
 LABEL_SYNC_RDID_MLIDL_CHK_BUSY:
            yield
LABEL_SYNC_RDID_MLIDL_CHK_PASS:
            offst.im    0
            setpc       B15, 0, 7
            wk          I_CL_SYNC_RDID, C_WK_CTRL_2, LABEL_SYNC_RDID_MLIDL_CHK_PASS
            incptr.cpl  1
LABEL_SYNC_RDID_RETI:
            reti        4, 0, 0, LABEL_SYNC_RDID_RETI
            mlctl       1
            incptr.cmd  1   
            sets        0, 5, 0
            end         
            nop         

LABEL_SYNC_SETF_BY_ADDR_ENTRY:
            sets        0, 5, 1
            mlctl       0
LABEL_SYNC_SETF_BY_ADDR_MLIDL_CHK:
            mlidl       r0
            jnz.nfc     LABEL_SYNC_SETF_BY_ADDR_MLIDL_CHK_BUSY, r0
            jnz.fc      LABEL_SYNC_SETF_BY_ADDR_MLIDL_CHK_PASS 
 LABEL_SYNC_SETF_BY_ADDR_MLIDL_CHK_BUSY:
            yield
            jnz.fc      LABEL_SYNC_SETF_BY_ADDR_MLIDL_CHK
LABEL_SYNC_SETF_BY_ADDR_MLIDL_CHK_PASS:
            setpc       11, 0, 7
    	    setpc       12, 8, 15
 	        setpc       13, 16, 23
            setpc       14, 24, 31
            setpc       15, 32, 39
            wk          I_CL_SETF_BY_ADDR, 2, LABEL_SYNC_SETF_BY_ADDR_MLIDL_CHK_PASS
LABEL_SYNC_SETF_BY_ADDR_WAIT_TFEAT:
            ## using 70H need to discussed here, since 70 selected last lun
            wk          I_CL_SYNC_RS_70H, C_WK_CTRL_5, LABEL_SYNC_SETF_BY_ADDR_WAIT_TFEAT  
            stacp.ni    r0, 6       
            jnz.nfc     LABEL_SYNC_SETF_BY_ADDR_WAIT_TFEAT, r0  
LABEL_SYNC_SETF_BY_ADDR_RETI:
	        reti        0, 0, 0, LABEL_SYNC_SETF_BY_ADDR_RETI
            mlctl       1
            sets        0, 5, 0
            incptr.cmd  1
            end



LABEL_SYNC_SETF_BY_LUN_ENTRY:
            sets        0, 5, 1
            mlctl       0
LABEL_SYNC_SETF_BY_LUN_MLIDL_CHK:
            mlidl       r0
            jnz.nfc     LABEL_SYNC_SETF_BY_LUN_MLIDL_CHK_BUSY, r0
            jnz.fc      LABEL_SYNC_SETF_BY_LUN_MLIDL_CHK_PASS
LABEL_SYNC_SETF_BY_LUN_MLIDL_CHK_BUSY:
            yield
            jnz.fc      LABEL_SYNC_SETF_BY_LUN_MLIDL_CHK
LABEL_SYNC_SETF_BY_LUN_MLIDL_CHK_PASS:
            offst.im    0
            #wk          I_CL_SYNC_RS_78H, C_WK_CTRL_4, LABEL_SYNC_SETF_BY_LUN_MLIDL_CHK_PASS        // only on-busy-yield=1, no data/status return
            setpr.lun   32, 39        ## copy lun to itfc_param byte 4
            setpc       11, 40, 47    ## copy FA to itfc_param byte 5
    	    setpc       12, 0, 7
    	    setpc       13, 8, 15
 	        setpc       14, 16, 23
            setpc       15, 24, 31
            wk          I_CL_SETF_BY_LUN, 2, LABEL_SYNC_SETF_BY_LUN_MLIDL_CHK_PASS
LABEL_SYNC_SETF_BY_LUN_WAIT_TFEAT:
            offst.im    0
            setp.noca   0, 0
            wk          I_CL_SYNC_RS_78H, C_WK_CTRL_5, LABEL_SYNC_SETF_BY_LUN_WAIT_TFEAT  
            stacp.ni    r0, 6
            jnz.nfc     LABEL_SYNC_SETF_BY_LUN_WAIT_TFEAT, r0
LABEL_SYNC_SETF_BY_LUN_RETI:
	        reti        0, 0, 0, LABEL_SYNC_SETF_BY_LUN_RETI
            mlctl       1
            sets        0, 5, 0
            incptr.cmd  1
            end



LABEL_SYNC_GETF_BY_ADDR_ENTRY:
            sets        0, 5, 1
            mlctl       0
LABEL_SYNC_GETF_BY_ADDR_MLIDL_CHK:
            mlidl       r0
            jnz.nfc     LABEL_SYNC_GETF_BY_ADDR_MLIDL_CHK_BUSY, r0
            jnz.fc      LABEL_SYNC_GETF_BY_ADDR_MLIDL_CHK_PASS 
 LABEL_SYNC_GETF_BY_ADDR_MLIDL_CHK_BUSY:
            yield
            jnz.fc      LABEL_SYNC_GETF_BY_ADDR_MLIDL_CHK
LABEL_SYNC_GETF_BY_ADDR_MLIDL_CHK_PASS:
            offst.im    0
            setpc       11, 0, 7   ## copy FA to itfc_param byte 0
            wk          I_CL_GETF_BY_ADDR, C_WK_CTRL_2, LABEL_SYNC_GETF_BY_ADDR_MLIDL_CHK_PASS

#LABEL_SYNC_GETF_BY_ADDR_WK_ISSUE:
#            ## using 70H need to discussed here, since 70 selected last lun
#            wk          I_CL_SYNC_RS_70H, C_WK_CTRL_5, LABEL_SYNC_GETF_BY_ADDR_WK_ISSUE 
#            stacp.ni    r0, 6       
#            jnz.nfc     LABEL_SYNC_GETF_BY_ADDR_WK_ISSUE, r0 
#            wk          I_CL_SYNC_READ_8BYTES, C_WK_CTRL_2, LABEL_0         ## using LABEL_0 means no yield here
            incptr.cpl  1
LABEL_SYNC_GETF_BY_ADDR_RETI:
            reti        4, 0, 0, LABEL_SYNC_GETF_BY_ADDR_RETI
            mlctl       1
            sets        0, 5, 0
            incptr.cmd  1
            end


LABEL_SYNC_GETF_BY_LUN_ENTRY:
            sets        0, 5, 1
            mlctl       0
LABEL_SYNC_GETF_BY_LUN_MLIDL_CHK:
            mlidl       r0
            jnz.nfc     LABEL_SYNC_GETF_BY_LUN_MLIDL_CHK_BUSY, r0
            jnz.fc      LABEL_SYNC_GETF_BY_LUN_MLIDL_CHK_PASS
LABEL_SYNC_GETF_BY_LUN_MLIDL_CHK_BUSY:
            yield
            jnz.fc      LABEL_SYNC_GETF_BY_LUN_MLIDL_CHK
LABEL_SYNC_GETF_BY_LUN_MLIDL_CHK_PASS:
            offst.im    0
            #wk          I_CL_SYNC_RS_78H, C_WK_CTRL_4, LABEL_SYNC_GETF_BY_LUN_WK_ISSUE        // only on-busy-yield=1, no data/status return
            setpr.lun   0, 7        ## copy lun to itfc_param byte 0
            setpc       11, 8, 15   ## copy FA to itfc_param byte 1
            wk          I_CL_GETF_BY_LUN, C_WK_CTRL_2, LABEL_SYNC_GETF_BY_LUN_MLIDL_CHK_PASS  
#LABEL_SYNC_GETF_BY_LUN_WK_ISSUE:
#            offst.im    0
#            setp.noca   0, 0
#            wk          I_CL_SYNC_RS_78H, C_WK_CTRL_5, LABEL_SYNC_GETF_BY_LUN_WK_ISSUE 
#            stacp.ni    r0, 6
#            jnz.nfc     LABEL_SYNC_GETF_BY_LUN_WK_ISSUE, r0
#            wk          I_CL_SYNC_READ_8BYTES, C_WK_CTRL_2, LABEL_0         ## using LABEL_0 means no yield here
            incptr.cpl  1
LABEL_SYNC_GETF_BY_LUN_RETI:
	        reti        0, 0, 0, LABEL_SYNC_GETF_BY_LUN_RETI
            mlctl       1
            sets        0, 5, 0
            incptr.cmd  1
            end



LABEL_SYNC_RDPARAM_ENTRY:
            nop

LABEL_SYNC_MCODE_TEST_ENTRY:
            sets        0, 5, 1
            sbyt.gr     B0, 255
            sbyt.gr     B1, 255
            sbyt.gr     B2, 255
            sbyt.gr     B3, 255
            sets        0, 5, 0
            incptr.cmd  1
            end



## ASYNC Read ID 90h
#LABEL_ASYNC_RDID_ENTRY:
#            wk          I_CL_ASYNC_RDID, C_WK_CTRL_2, LABEL_0
#            incptr.cpl   1
#            reti        4, 0, 0, LABEL_0
#            incptr.cmd      1      
#            end         
#            nop         
## ASYNC Set Feature 01h
#LABEL_SETF01_ENTRY:
#            wk          I_CL_SETF01, C_WK_CTRL_0, LABEL_0
#            reti        0, 0, 0, LABEL_0
#            incptr.cmd  1     
#            end         
#            nop         
## SYNC Set Feature 02h
#LABEL_SETF02_ENTRY:
#            wk          I_CL_SETF02_CMD, C_WK_CTRL_0, LABEL_0
#            reti        0, 0, 0, LABEL_0
#            incptr.cmd  1  
#            end         
#            nop         
## SYNC Get Feature 01h
# FIXME: general get feature with feature address as an parameter to the function
#LABEL_GETF:
#            wk          I_CL_GETF, C_WK_CTRL_2, LABEL_0
#            incptr.cpl   1
#            reti        4, 0, 0, LABEL_0
#            incptr.cmd      1   
#            end         
#            nop         


## SYNC ERASE
## SLC Flow: DAh --> 60h-D0h --> 78h --> DFh
## TLC Flow: 60h-D0h --> 78h
LABEL_SYNC_ERASE_XLC_ENTRY:
            matcl.nofst r0, C_ERASE_CTRL_TLC, 207       ## 207d=11001111b
            jnz.nfc     LABEL_SYNC_ERASE_TLC_ENTRY, r0  ## ctrl[5:6] decide SLC/TLC
            sbyt.gr     R3, 0                           ## make GR3=0 as SLC flag
            jnz.fc      LABEL_SYNC_ERASE_FUNC 
LABEL_SYNC_ERASE_TLC_ENTRY:
            sbyt.gr     R3, 1                           ## make GR3=1 as TLC flag
LABEL_SYNC_ERASE_FUNC:
            sets        0, 5, 1
            matcl.nofst r0, C_MP_DIS, 252               # 252d=FCh 
            jnz.nfc     LABEL_SYNC_SP1_ERASE, r0        ## ctrl[1:0] decide Multi-Plane
            sbyt.v0     0

LABEL_SYNC_MP2_ERASE:            
            matcl.nofst r0, C_MP_FOR2, 252              # 252d=FCh 
            jnz.nfc     LABEL_SYNC_MP2_ERASE_SET, r0    
            setb        r7, 1                           ## make GR7=1 as 4Plane flag
            jnz.fc      LABEL_SYNC_MP2_ERASE_ENTER
LABEL_SYNC_MP2_ERASE_SET:            
            setb        r7, 0                           ## 4Plane=2*2Plane 
LABEL_SYNC_MP2_ERASE_ENTER:            
            gclvl       r0, 1                           ## should wait 2-cmd for MP erase
            jnz.nfc     LABEL_SYNC_MP2_ERASE_NEXT_CMD_CHK, r0
            yield
            jnz.fc      LABEL_SYNC_MP2_ERASE 
LABEL_SYNC_MP2_ERASE_NEXT_CMD_CHK:
            sbyt.gr     R2, 0                                          
            cmbyt       r0, R3, R2                      ## op==SLC flag ?
            jnz.nfc     LABEL_SYNC_MP2_SLC_2ED_CMD_CHK, r0
LABEL_SYNC_MP2_TLC_2ED_CMD_CHK:
            matop       r0, C_ERASE, 1, 1               ## check next cmd if is TLC ERASE, ensure atomic
            jnz.nfc     LABEL_SYNC_MP2_ERASE_FUNC, r0 
LABEL_SYNC_MP2_ERASE_ERROR:
            jnz.fc      LABEL_SYNC_MP2_ERASE_ERROR      ## MP2 erase ATOMIC not satisfy
LABEL_SYNC_MP2_SLC_2ED_CMD_CHK:
            matop       r0, C_ERASE, 1, 1               ## check next cmd if is SLC ERASE, ensure atomic
            jnz.nfc     LABEL_SYNC_MP2_SLC_ERASE_SET, r0 
            jnz.fc      LABEL_SYNC_MP2_ERASE_ERROR

LABEL_SYNC_MP2_SLC_ERASE_SET:
            sbyt.gr     B2, 218                         # 218d=DAh
            setpr.gr    B2, 0, 7
            wk.ndsyld   I_CL_SYNC_ISSUE_CMD, LABEL_0
            jnz.fc      LABEL_SYNC_MP2_ERASE_FUNC
LABEL_SYNC_MP2_ERASE_FUNC:
            offst.im    0
            setpr.pg    0, 10        
            setpr.blk   11, 22                           
            setpr.lun   23, 25        
            offst.im    1                               ## offset change to 2nd cmd
            setpr.pg    32, 42        
            setpr.blk   43, 54                           
            setpr.lun   55, 57        
            sbyt.gr     R2, 0                                          
            cmbyt       r0, R3, R2                      ## op==SLC flag ?
            jnz.nfc     LABEL_SYNC_MP2_ERASE_WK, r0
LABEL_SYNC_MP2_ERASE_TLC_WK:
            wk          I_CL_MP2_ERASE, C_WK_CTRL_C, LABEL_SYNC_MP2_ERASE_FUNC 
            jnz.fc      LABEL_SYNC_MP2_ERASE_WK_END
LABEL_SYNC_MP2_ERASE_WK:
            wk          I_CL_MP2_ERASE, C_WK_CTRL_C, LABEL_SYNC_MP2_ERASE_FUNC  
LABEL_SYNC_MP2_ERASE_WK_END:
            offst.im    0       
            tmrst

LABEL_SYNC_MP2_ERASE_RS_7XH_TLC_YIELD:
            yield
LABEL_SYNC_MP2_ERASE_RS_7XH_CHK:
            nop
LABEL_SYNC_MP2_ERASE_TLC_CPL_WK:
            offst.im    0
            setpr.lun   0, 7
            setp        SETP_ID_NO_CA, 0, 0
            wk          I_CL_SYNC_RS_78H, C_WK_CTRL_5, LABEL_SYNC_MP2_ERASE_RS_7XH_CHK
            jnz.fc      LABEL_SYNC_MP2_ERASE_XPL_WK_DONE 
LABEL_SYNC_MP2_ERASE_XPL_WK_DONE:
            stacp       r0, 1, 6
            jnz.nfc     LABEL_SYNC_MP2_ERASE_RS_7XH_TLC_YIELD, r0
            stacp       r0, 1, 5
            jnz.nfc     LABEL_SYNC_MP2_ERASE_RS_7XH_TLC_YIELD, r0
LABEL_RS_7XH_MP2_STATUS_CHK:
            setcpl.tm   68, 83          ## return timer cnt for debug
            #sbyt.gr     R2, 1
            #cmbyt       r0, R2, R3
            #jnz.nfc     LABEL_RS_7XH_MP2_TLC_BIT0_STATUS_CHK, r0 

#LABEL_RS_7XH_MP2_SLC_BIT2_STATUS_CHK:
#            stacp.n     r0, 1
#            jnz.nfc     LABEL_RS_7XH_MP2_SLC_BIT2_FAIL, r0
#LABEL_RS_7XH_MP2_SLC_BIT2_PASS:
#            reti        0, 0, 0, LABEL_RS_7XH_MP2_SLC_BIT2_PASS
#            incptr.cmd  1
#            jne.v0epc   LABEL_SYNC_MP2_ERASE_CPL_CHK_FIN, 0
#            adar.addv0  1
#            jnz.fc      LABEL_SYNC_MP2_ERASE_RS_7XH_CHK
#LABEL_RS_7XH_MP2_SLC_BIT2_FAIL:
#            reti        0, 1, 0, LABEL_RS_7XH_MP2_SLC_BIT2_FAIL
#            incptr.cmd  1
#            jne.v0epc   LABEL_SYNC_MP2_ERASE_CPL_CHK_FIN, 0
#            adar.addv0  1
#            jnz.fc      LABEL_SYNC_MP2_ERASE_RS_7XH_CHK

LABEL_RS_7XH_MP2_TLC_BIT0_STATUS_CHK:
            stacp.n     r0, 0
            jnz.nfc     LABEL_RS_7XH_MP2_TLC_BIT0_FAIL, r0
LABEL_RS_7XH_MP2_TLC_BIT0_PASS:
            reti        0, 0, 0, LABEL_RS_7XH_MP2_TLC_BIT0_PASS
            incptr.cmd  1
            jne.v0epc   LABEL_SYNC_MP2_ERASE_CPL_CHK_FIN, 0
            adar.addv0  1
            jnz.fc      LABEL_SYNC_MP2_ERASE_RS_7XH_CHK
LABEL_RS_7XH_MP2_TLC_BIT0_FAIL:
            reti        0, 1, 0, LABEL_RS_7XH_MP2_TLC_BIT0_FAIL
            incptr.cmd  1
            jne.v0epc   LABEL_SYNC_MP2_ERASE_CPL_CHK_FIN, 0
            adar.addv0  1
            jnz.fc      LABEL_SYNC_MP2_ERASE_RS_7XH_CHK

LABEL_SYNC_MP2_ERASE_CPL_CHK_FIN:
            sbyt.gr     B2, 0
            cmbyt       r0, R3, R2
            jnz.nfc     LABEL_SYNC_MP2_ERASE_CPL_CHK_SLC, r0
            jnz.fc      LABEL_SYNC_MP2_ERASE_CPL_DONE
LABEL_SYNC_MP2_ERASE_CPL_CHK_SLC:
            sbyt.gr     B2, 223         ## 223d=DFh
            setpr.gr    B2, 0, 7
            wk.ndsyld   I_CL_SYNC_ISSUE_CMD, LABEL_0
LABEL_SYNC_MP2_ERASE_CPL_DONE:
            #incptr.cmd  1
            jnz.nfc     LABEL_SYNC_MP2_ERASE_SET, r7    ## 4plane
            sets        0, 5, 0
            end  ## End operation for MP2 ERASE

LABEL_SYNC_SP1_ERASE:
            setp        SETP_ID_NO_CA, 0, 0
            sbyt.gr     R2, 0           
            cmbyt       r0, R3, R2      ## op==SLC flag ?
            jnz.nfc     LABEL_SYNC_SP1_ERASE_SLC_WK, r0
LABEL_SYNC_SP1_ERASE_TLC_WK:
            wk          I_CL_ERASE, C_WK_CTRL_C, LABEL_SYNC_SP1_ERASE     
            jnz.fc      LABEL_SYNC_SP1_ERASE_WK_END 
LABEL_SYNC_SP1_ERASE_SLC_WK:
            sbyt.gr     B1, 218         ## 218d=DAh
            setpr.gr    B1, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_STK_NYLD_NDS, LABEL_NA
            wk          I_CL_ERASE, C_WK_CTRL_C, LABEL_SYNC_SP1_ERASE  
LABEL_SYNC_SP1_ERASE_WK_END:
            tmrst
LABEL_SYNC_RS_78H_YIELD:
            yield       
LABEL_SYNC_RS_78H_SETP:
            setp        SETP_ID_NO_CA, 0, 0
            wk          I_CL_SYNC_RS_78H, C_WK_CTRL_5, LABEL_SYNC_RS_78H_SETP
            stacp       r0, 1, 6
            jnz.nfc     LABEL_SYNC_RS_78H_YIELD, r0
            stacp       r0, 1, 5
            jnz.nfc     LABEL_SYNC_RS_78H_YIELD, r0
            stacp.n     r1, 0,          ## ERASE pass/fail
            sbyt.gr     R2, 0                                          
            cmbyt       r0, R3, R2      ## op==SLC flag ?
            jnz.nfc     LABEL_SYNC_ERASE_SLC_RESULT, r0
LABEL_SYNC_ERASE_TLC_RESULT:
            #stacp.n     r1, 0,          ## ERASE pass/fail
            jnz.fc      LABEL_SYNC_ERASE_CPL_TIME
LABEL_SYNC_ERASE_SLC_RESULT:
            sbyt.gr     B1, 223         ## 223d=DFh
            setpr.gr    B1, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_STK_NYLD_NDS, LABEL_NA
            #stacp.n     r1, 0,          ## ERASE pass/fail
            #jnz.fc      LABEL_SYNC_ERASE_CPL_TIME
LABEL_SYNC_ERASE_CPL_TIME:
            setcpl.tm   68, 83          ## return timer counter for debug
            jnz         LABEL_SYNC_ERASE_CPL_CHK_FAIL, r1, 0
LABEL_SYNC_ERASE_CPL_CHK_OK:  
            reti        0, 0, 0, LABEL_SYNC_ERASE_CPL_CHK_OK
            jnz.fc      LABEL_SYNC_ERASE_CPL_CHK_FIN
LABEL_SYNC_ERASE_CPL_CHK_FAIL:
            reti        0, 1, 0, LABEL_SYNC_ERASE_CPL_CHK_FAIL
LABEL_SYNC_ERASE_CPL_CHK_FIN:            
            incptr.cmd  1     
            sets        0, 5, 0
            end  ## End operation for SP1 ERASE


LABEL_PROG_DUMMY_ENTRY:
## GR1/GR2 reserved
## r9 for buffer lock
## GR2 for gpo

            sets        0, 5, 1
            setb        r9, 0
            sbyt.gr     R2, 0       ## set GR2=0
LABEL_PROG_DUMMY_YIELD_BUF_LOCK:
            jnz.nfc     LABEL_PROG_DUMMY_MAIN, r9
            pbulc.lck   r0          ## 1=busy; 0=success
            not         r0
            jnz.nfc     LABEL_PROG_DUMMY_MAIN, r0
            yield
            jnz.fc      LABEL_PROG_DUMMY_YIELD_BUF_LOCK
LABEL_PROG_DUMMY_MAIN:
            cklvl.prol  r0, 64              ## 1=<64; 0=>64
            jnz.nfc     LABEL_PROG_DUMMY_INGRESS_LOW_CHK, r0
            yield
            jnz.fc      LABEL_PROG_DUMMY_MAIN
LABEL_PROG_DUMMY_INGRESS_LOW_CHK:
            setgpo.gr   R2 
            adbyt.imm   R2, R2, 1           ## GR2=GR2+1 
            pbreq.nofst C_PROG_ON
            setgpo.gr   R2 
            adbyt.imm   R2, R2, 1           ## GR2=GR2+1 
            pbreq.nofst C_PROG_ON
LABEL_PROG_DUMMY_CHK_LVL1_YIELD:
            cklvl.prol  r0, level_l0
            jnz.nfc     LABEL_PROG_DUMMY_CHK_LVL1_YIELD, r0
            wk.ndsyld   I_CL_PROG_DUMMY, LABEL_PROG_DUMMY_CHK_LVL1_YIELD    ## yield=disable
            calre.cal   LABEL_ONE_SHOT_PROG_ISSUE_CHK_SEC_2K_CHK_LVL        ## call to finish left 2k program
LABEL_PROG_DUMMY_RETI:
            reti        2, 0, 0, LABEL_PROG_DUMMY_RETI
LABEL_PROG_DUMMY_RELASE_BUF:
            pbulc.ulck  r0, 20
            setb        r9, 0
            incptr.cmd  1
            sets        0, 5, 0
            end

###########################################################
#
# TLC Program Function 
# (1cmd-2plane, reuse TLC native program function)
#
# 1cmd-2plane info:
# 1st Block address: bit[23] - bit[12]
# 2nd Block address: bit[79] - bit[72] (occupy origin high bit for exec-time)
###########################################################
LABEL_PROG_NATIVE_ENTRY_1CMD_2PLANE:
    sbyt.gr     R0, 0
    sbyt.gr     R3, 0
    setb        r2, 1    ##(mark as 1cmd-2plane flag)
    sbyt.v0     0
    jnz.fc      LABEL_PROG_XLC_REUSE_ENTRY


###########################################################
#
# TLC Program Function
#
###########################################################
LABEL_PROG_NATIVE_ENTRY:
    sbyt.gr     R0, 0
    sbyt.gr     R1, 0
    sbyt.gr     R2, 0
    sbyt.gr     R3, 0
    sbyt.v0     0
    LABEL_PROG_XLC_REUSE_ENTRY:
    # below no need check cmd>=2, since every TLC_CALL_FUNC_DATA_80 will check cmd>0
    # matcl.nofst     r0, C_MP_FOR2, 252, 0            ## 252d=1111_1100b => bit[1:0]
    # jnz.nfc         LABEL_PROG_TLC_MP2_CMD_NUM_CHK, r0
    # jnz.fc          LABEL_PROG_TLC_PRIORITY_SET

    # LABEL_PROG_TLC_MP2_CMD_NUM_CHK:
    # gclvl       r0, 1, 0   ##(check cmd num>=2)
    # jnz.nfc     LABEL_PROG_TLC_PRIORITY_SET, r0
    # end

    # LABEL_PROG_TLC_PRIORITY_SET:
    sets        0, 5, 1
    LABEL_PROG_TLC_PBUF_CHK_LCK:
    ##=COMPILER_L0 (pbuf lck)
        pbulc.lck   r0
        jnz.nfc     LABEL_PROG_TLC_PBUF_CHK_LCK_DONE, r0
        yield
        jnz.fc      LABEL_PROG_TLC_PBUF_CHK_LCK
    LABEL_PROG_TLC_PBUF_CHK_LCK_DONE:


    ##=COMPILER_L0 (request data)
    setgpo.breg     0
    #adbyt.imm       R3, R3, 1
    pbreq.nofst     C_PROG_ON
    
    LABEL_PROG_TLC_PLANE_NUM_SET:
    ##=COMPILER_L0 (set plane num)
        #cmcmd       r0, 2, C_CMD_CTR_MP_START_BIT, 1
        matcl.nofst     r0, C_MP_DIS, 252, 0            ## 252d=1111_1100b => bit[1:0]
        jnz.nfc         LABEL_PROG_TLC_PLANE_NUM_1, r0
        #cmcmd           r0, 2, C_CMD_CTR_MP_START_BIT, 2
        matcl.nofst     r0, C_MP_FOR2, 252, 0            ## 252d=1111_1100b => bit[1:0]
        jnz.nfc         LABEL_PROG_TLC_PLANE_NUM_2, r0
        LABEL_PROG_TLC_PLANE_NUM_UNKOWN:
            jnz.fc  LABEL_PROG_TLC_PLANE_NUM_UNKOWN

        LABEL_PROG_TLC_PLANE_NUM_1:
            sbyt.v1     0    ## v1 counting start from 0
            jnz.fc      LABEL_PROG_TLC_PLANE_NUM_SET_END

        LABEL_PROG_TLC_PLANE_NUM_2:
            sbyt.v1     1    ## v1 counting start from 0
            jnz.fc      LABEL_PROG_TLC_PLANE_NUM_SET_END
    LABEL_PROG_TLC_PLANE_NUM_SET_END:
        nop

    LABEL_PROG_TLC_CALL_FUNC_DATA_80:
    setb        r4, 0    ##(1st plane for 1cmd-2plane, setting r4=0 mark for initial plane)
    LABEL_PROG_TLC_CALL_FUNC_CHK_CMD_AVAILBLE:
    gclvl       r0, 0, 0  ##(check cmd level >=1)
    jne.grepc   LABEL_PROG_TLC_CALL_FUNC_CHK_CMD_AVAILBLE, r0, 1    
    ##=COMPILER_L0 (call 80-ADDR-DATA func)
    calre.cal   LABEL_PROG_TLC_INGRESS_DATA_80_DATA_FUNC  #discard LABEL_PROG_TLC_PROG_DATA_FUNC_80_DATA

    ##=COMPILER_L0 (call 10h/11h/15h POSFIX func)
    calre.cal   LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_FUNC


    jnz.nfc     LABEL_PROG_TLC_FOR_1CMD_2ND_PROGRAM, r2
    jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_PBUF_CHK

    LABEL_PROG_TLC_FOR_1CMD_2ND_PROGRAM:

        LABEL_PROG_TLC_PRORITY_FOR_CHK_STATUS_1CMD_2PLANE_MIDDLE_CHK: 
        ##=COMPILER_L0 (check read status)
            #offst.im        0
            sets            0, 5, 0
            sets            0, 0, 1
        LABEL_PROG_TLC_PRORITY_FOR_CHK_STATUS_DONE_1CMD_2PLANE_MIDDLE_CHK:
        calre.cal   LABEL_PROG_TLC_CHK_STATUS_RETI_FUNC

        setb        r4, 1    ##(2nd plane for 1cmd-2plane, setting r4=1 mark for 2nd plane)

        ##=COMPILER_L0 (call 80-ADDR-DATA func)
        calre.cal   LABEL_PROG_TLC_INGRESS_DATA_80_DATA_FUNC  #discard LABEL_PROG_TLC_PROG_DATA_FUNC_80_DATA
        ##=COMPILER_L0 (call 10h/11h/15h POSFIX func)
        calre.cal   LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_FUNC


    LABEL_PROG_TLC_INGRESS_DATA_PBUF_CHK:
    ##=COMPILER_L0 (if ignore/lck/unlck pbuf)
        #setb        r1, 0
        #cmcmd       r0, 1, C_CMD_CTR_CACHE_START, 0
        #matcl.nofst  r0, C_CMD_CTR_CACHE_START, 32, 0            ## 252d=0010_0000b => bit[1:0]
        #jnz.nfc     LABEL_PROG_TLC_INGRESS_DATA_UNCACHE, r0
        jnz.fc         LABEL_PROG_TLC_INGRESS_DATA_UNCACHE        ## no cache feature support
        LABEL_PROG_TLC_INGRESS_DATA_CACHE:
            ##(only support SLC cache operation)
            ##(cache hit, then NOT buf unlock, and NOT yield)
            jnz.nfc     LABEL_PROG_TLC_INGRESS_DATA_PBUF_CACHE_SET_REQ_CLR, r5
            jnz.nfc     LABEL_PROG_TLC_INGRESS_DATA_PBUF_CACHE_SET_REQ_DO, r4
            jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_UNCACHE      ##(if nothing happen, do as uncache)
            LABEL_PROG_TLC_INGRESS_DATA_PBUF_CACHE_SET_REQ_CLR:
                setb        r1, 1  ##make r1=1 as not req next cmd
                jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_PBUF_CHK_DONE
            LABEL_PROG_TLC_INGRESS_DATA_PBUF_CACHE_SET_REQ_DO:
                setb        r1, 0  ##make r1=0 as DO req next cmd
                jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_PBUF_CHK_DONE

        LABEL_PROG_TLC_INGRESS_DATA_UNCACHE:
            jne.grepc  LABEL_PROG_TLC_INGRESS_DATA_UNCHACHE_V0_V1_CHK, r2, 1  ##(if r2=0, jump to legacy check)
            jne.grepc  LABEL_PROG_TLC_INGRESS_DATA_UNCHACHE_FIRST_PLANE, r4, 1  ##(if r2=1, r4=0, means first plane, no buf unlock, jump)
            LABEL_PROG_TLC_INGRESS_DATA_UNCHACHE_V0_V1_CHK:
            jne.v1epc  LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE, 1
            jne.v0epc  LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE, 0
            LABEL_PROG_TLC_INGRESS_DATA_UNCHACHE_FIRST_PLANE:
            ## (1st-plane of mp, ignore pbuf unlock)
                jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_PBUF_CHK_DONE
    
            LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE:
            jnz.nfc         LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_OTHER_UNLOCK, r7
            ## (check if R1=2(sp1 prog) or R1=5(mp2 prog) , then r1=1, prog done, release buffer)
            jne.v1epc  LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_SP1_CNT_CHK, 1
            LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_MP2_CNT_CHK:
                #(if r0=compare(r1,5), true goto LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_OTHER_UNLOCK)
                #(else goto LABEL_PROG_TLC_INGRESS_DATA_PBUF_CHK_DONE)
                sbyt.gr     B2, 5
                cmbyt       r0, B2, B1 
                jnz.nfc     LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_OTHER_UNLOCK, r0
                jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_PBUF_CHK_DONE
            LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_SP1_CNT_CHK:
                #(if r0=compare(r1,2), true goto LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_OTHER_UNLOCK)
                sbyt.gr     B2, 2
                cmbyt       r0, B2, B1 
                jnz.nfc     LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_OTHER_UNLOCK, r0
                jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_PBUF_CHK_DONE
`ifdef  YMTC_64L_ATOMIC_PROGRAM
            #nop
`else            
                ## (1st-page of MLC page and 1st-page of Second-Pass ignore pbuf unlock)
                #cmcmd       r0, 2, C_CMD_CTR_SHARED_TYPE_START, 1
                LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_SHARED_PAGE_CHK:
                matcl.nofst     r0, C_CMD_CTR_SHARED_TYPE_START, 48, 0            ## 48d=0011_0000b => bit[5:4]
                jnz.nfc         LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_MLC_PAGE, r0
                jnz.nfc         LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_SHARED_PAGE_CHK, r0
                #cmcmd           r0, 2, C_CMD_CTR_SHARED_TYPE_START, 2
                #jnz.nfc         LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_TLC_PAGE, r0
`endif
                #LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_SLC_PAGE:
                LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_OTHER_UNLOCK:
                ## (left: SLC-lp/MLC-up/TLC-1pass-lp/TLC-2pss-up are do pbuf unlock)
                    pbulc.ulck  r0, 20
                    setb        r1, 1
                    tmrst
                    jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_PBUF_CHK_DONE

                LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_MLC_PAGE:
                    #cmcmd       r0, 2, C_CMD_CTR_PAGE_TYPE_START, C_UPPER_PAGE
                    matcl.nofst     r0, C_UPPER_PAGE, 12, 0            ## 12d=0000_1100b => bit[3:2]
                    jnz.nfc         LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_OTHER_UNLOCK, r0
                    ## (MLC-lp ignore pbuf unlock)
                    jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_PBUF_CHK_DONE


                LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_TLC_PAGE:
                    #cmcmd       r0, 2, C_CMD_CTR_PAGE_TYPE_START, C_UPPER_PAGE
                    matcl.nofst     r0, C_UPPER_PAGE, 12, 0            ## 12d=0000_1100b => bit[3:2]
                    jnz.nfc     LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_OTHER_UNLOCK, r0
                    #cmcmd       r0, 2, C_CMD_CTR_PAGE_TYPE_START, C_LOWER_PAGE
                    matcl.nofst     r0, C_LOWER_PAGE, 12, 0            ## 12d=0000_1100b => bit[3:2]
                    jnz.nfc     LABEL_PROG_TLC_INGRESS_DATA_UNCACHE_LAST_PLANE_OTHER_UNLOCK, r0
                    ## (TLC-ep ignore pbuf unlock)
                    jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_PBUF_CHK_DONE
                    
    LABEL_PROG_TLC_INGRESS_DATA_PBUF_CHK_DONE:
        nop


    LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST:
    ##=COMPILER_L0 (request next data for optimzation)
        jnz.nfc         LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_DONE, r1
        jnz.nfc         LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_DONE, r5  ##(r5 has already impact to r1,this line could be useless)
        jnz.nfc         LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_CACHE, r6  ##(r6 now as cached flag)
        LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_UNCACHE:     
            gclvl           r0, 1     ##(if in this line, means mp2, and check if next cmd is avail, if not, loop)
            jne.grepc       LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_UNCACHE, r0, 1
            offst.im        1
            setgpo.breg     0
            pbreq.nofst     C_PROG_ON
            offst.im        0
            jnz.fc          LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_DONE

        LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_CACHE:
            jne.v1epc       LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_CACHE_SP1, 1
            LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_CACHE_MP2:
                jne.v0epc       LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_CACHE_MP2_PLANE1, 0
                LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_CACHE_MP2_PLANE0:
                ##(if plane0 and is cache flag assert, the cmd before is last plane1 cmd, thus, this current req next cmd. and offset is 2. last plane cmd1 is base offset=0, this current cmd offset=1, req next cmd offset=2)
                   offst.im        2
                   setgpo.breg     0
                   pbreq.nofst     C_PROG_ON
                   offst.im        1
                   jnz.fc          LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_DONE

                LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_CACHE_MP2_PLANE1:
                    jnz.nfc     LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_CACHE_MP2_INIT, r3
                    LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_CACHE_MP2_INIT:
                    ##(only plane1 chk cache hit, and if init, means plane0 no chk, and do as uncache, and reti cpl, thus this req next cmd, hence offset=1)
                        offst.im        1
                        setgpo.breg     0
                        pbreq.nofst     C_PROG_ON
                        offst.im        0
                        jnz.fc          LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_DONE
                    LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_CACHE_MP2_NOT_INIT:
                    ##(if cache hit before, means this plane0, and previous plane1 not reti cpl, thus base offset is previous plane1, current plane0 is offset=1, this current plane1 is offset=2, will req next cmd offset=3)
                        offst.im        3
                        setgpo.breg     0
                        pbreq.nofst     C_PROG_ON
                        offst.im        2
                        jnz.fc          LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_DONE



            LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_CACHE_SP1:
                jnz.nfc     LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_CACHE_SP1_INIT, r3
                LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_CACHE_SP1_NOT_INIT:
                    offst.im        2
                    setgpo.breg     0
                    pbreq.nofst     C_PROG_ON
                    offst.im        1
                    jnz.fc          LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_DONE
                LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_CACHE_SP1_INIT:
                    offst.im        1
                    setgpo.breg     0
                    pbreq.nofst     C_PROG_ON
                    jnz.fc          LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_DONE
                    



    LABEL_PROG_TLC_NEXT_DATA_PRE_REQUEST_DONE:

  
    LABEL_PROG_TLC_PRORITY_FOR_CHK_STATUS: 
    ##=COMPILER_L0 (check read status)
        #offst.im        0
        sets            0, 5, 0
        sets            0, 0, 1
    LABEL_PROG_TLC_PRORITY_FOR_CHK_STATUS_DONE:
    
    calre.cal   LABEL_PROG_TLC_CHK_STATUS_RETI_FUNC


    
    LABEL_PROG_TLC_PLANE_NUM_INCR_CHK:
    ##=COMPILER_L0 (plane and loop check)
        ## (automic cnt increase by1)
        adbyt.imm       R1, R1, 1
        ## (if r1=1, prog-10h is done, and we pass tProg time, and finish)
        jnz.nfc         LABEL_PROG_TLC_DONE, r1
        ## (multiplane need to incr v0 add)
        jne.veqpc       LABEL_PROG_TLC_PLANE_NUM_INCR_BEGIN
        ## (if "r1=0,v0=v1" means mlc/tlc page, finish 1-page multiplane-loop, do 2-page multiplane-loop)
        jnz.fc          LABEL_PROG_TLC_ALL_PLANE_CHK_DONE
        LABEL_PROG_TLC_PLANE_NUM_INCR_BEGIN:
            adar.addv0      1
            sets            0, 0, 0
            sets            0, 5, 1
            #setgpo modification ?
            sbyt.gr         R3, 0
            jnz.fc          LABEL_PROG_TLC_CALL_FUNC_DATA_80 

        LABEL_PROG_TLC_ALL_PLANE_CHK_DONE:
        ## (if "r1=0,v0=v1" means mlc/tlc page, finish 1-page multiplane-loop, do 2-page multiplane-loop)
            sbyt.v0         0   ##(v0 need to re-start)
            sets            0, 0, 0
            sets            0, 5, 1
            jnz.fc          LABEL_PROG_TLC_PLANE_NUM_SET 



    LABEL_PROG_TLC_LOOP_CHK:
    ##=COMPILER_L0
        jnz.fc          LABEL_PROG_TLC_CALL_FUNC_DATA_80


    LABEL_PROG_TLC_DONE:
        ##=(if SLC flag assert, go back SLC entry and issue DFh)
        jnz.nfc LABEL_PROG_SLC_ISSUE_DF, r7 
        sets    0, 0, 0
        end
        nop




    ##########################################################
    ##                 Program Data--Addr--80               ##
    ##                                                      ##   
    ##########################################################
    LABEL_PROG_TLC_INGRESS_DATA_80_DATA_FUNC:
    ##=COMPILER_L1 (prog data wk without postfix)
        cklvl.prol      r0, tlc_prog_low_thrs 
        jnz.nfc         LABEL_PROG_TLC_INGRESS_DATA_80_DATA_FUNC, r0
        jnz.nfc         LABEL_PROG_TLC_INGRESS_DATA_80_WK_2ND_ADDR, r4
        LABEL_PROG_TLC_INGRESS_DATA_80_WK_1ST_ADDR:
            setp.all        0, 0
            wk.ndsyld       I_CL_PROG, LABEL_PROG_TLC_INGRESS_DATA_80_DATA_FUNC  #LABEL_PROG_TLC_INGRESS_DATA_FUNC_80_DATA
            jnz.fc          LABEL_PROG_TLC_INGRESS_DATA_ARRIVE_CHK
        LABEL_PROG_TLC_INGRESS_DATA_80_WK_2ND_ADDR:  ##(YMTC_64L has no 1cmd-2plane, ignore here)
            setp            4, 0, 0
            setpc           9, C_ITFC_PARAM_BLK_START, C_ITFC_PARAM_BLK_END  ## (setpc bit, l, h)
            wk.ndsyld       I_CL_PROG, LABEL_PROG_TLC_INGRESS_DATA_80_DATA_FUNC  #LABEL_PROG_TLC_INGRESS_DATA_FUNC_80_DATA


        LABEL_PROG_TLC_INGRESS_DATA_ARRIVE_CHK:
            ##( before prog first chk level)
            cklvl.reqh      r0, level_2k_ingress_low
            jnz.nfc         LABEL_PROG_TLC_INGRESS_DATA_ARRIVE_CHK, r0

        LABEL_ONE_SHOT_PROG_ISSUE_CHK_FIR_2K_CHK_LVL:
        ###credit_cnt bigger than level_2k, then wait
            cklvl.reqh      r0, level_2k
            jnz.nfc         LABEL_ONE_SHOT_PROG_ISSUE_CHK_FIR_2K_CHK_LVL, r0 
            adbyt.imm       R3, R3, 1 
            setgpo.gr       R3
            ##setgpo.breg     1
            pbreq.nofst     C_PROG_ON
        
        LABEL_ONE_SHOT_PROG_ISSUE_CHK_SEC_2K_CHK_LVL:
        ###credit_cnt bigger than level_2k, then wait
            cklvl.reqh      r0, level_2k
            jnz.nfc         LABEL_ONE_SHOT_PROG_ISSUE_CHK_SEC_2K_CHK_LVL, r0  
            adbyt.imm       R3, R3, 1 
            setgpo.gr       R3
            ##setgpo.breg     2
            pbreq.nofst     C_PROG_ON
        LABEL_ONE_SHOT_PROG_ISSUE_CHK_THR_2K_CHK_LVL:
            cklvl.reqh      r0, level_2k 
            jnz.nfc         LABEL_ONE_SHOT_PROG_ISSUE_CHK_THR_2K_CHK_LVL, r0
            adbyt.imm       R3, R3, 1 
            setgpo.gr       R3
            ##setgpo.breg     3
            pbreq.nofst     C_PROG_ON
        LABEL_ONE_SHOT_PROG_ISSUE_CHK_FOUR_2K_CHK_LVL:
            cklvl.reqh      r0, level_2k
            jnz.nfc         LABEL_ONE_SHOT_PROG_ISSUE_CHK_FOUR_2K_CHK_LVL, r0
            adbyt.imm       R3, R3, 1 
            setgpo.gr       R3
            ##setgpo.breg     4
            pbreq.nofst     C_PROG_ON 
        LABEL_ONE_SHOT_PROG_ISSUE_CHK_FIFTH_2K_CHK_LVL:
            cklvl.reqh      r0, level_2k
            jnz.nfc         LABEL_ONE_SHOT_PROG_ISSUE_CHK_FIFTH_2K_CHK_LVL, r0 
            adbyt.imm       R3, R3, 1 
            setgpo.gr       R3
            ##setgpo.breg     5
            pbreq.nofst     C_PROG_ON
        LABEL_ONE_SHOT_PROG_ISSUE_CHK_SIXTH_2K_CHK_LVL:
            cklvl.reqh      r0, level_2k
            jnz.nfc         LABEL_ONE_SHOT_PROG_ISSUE_CHK_SIXTH_2K_CHK_LVL,r0
            adbyt.imm       R3, R3, 1 
            setgpo.gr       R3
            ##setgpo.breg     6
            pbreq.nofst     C_PROG_ON
        LABEL_ONE_SHOT_PROG_ISSUE_CHK_SEVENTH_2K_CHK_LVL:
            cklvl.reqh      r0, level_2k
            jnz.nfc         LABEL_ONE_SHOT_PROG_ISSUE_CHK_SEVENTH_2K_CHK_LVL, r0   
            adbyt.imm       R3, R3, 1 
            setgpo.gr       R3
            ##setgpo.breg     7
            jnz.nfc         LABEL_ONE_SHOT_PROG_ISSUE_CHK_SEVENTH_2K_REQ_1CMD_2PLANE_CHK, r2  ##(only 1cmd-2plane, and last-plane , could set pbreq=end)
            pbreq.nofst     C_PROG_END
            jnz.fc          LABEL_ONE_SHOT_PROG_ISSUE_CHK_EIGHT_2K_LOW_LVL ##(if no 1cmd-2plane go normal)

            LABEL_ONE_SHOT_PROG_ISSUE_CHK_SEVENTH_2K_REQ_1CMD_2PLANE_CHK: ##(only 1cmd-2plane, and last-plane , could set pbreq=end)
            jnz.nfc         LABEL_ONE_SHOT_PROG_ISSUE_CHK_SEVENTH_2K_REQ_END_CHK, r4
                    pbreq.nofst     C_PROG_ON
                    jnz.fc          LABEL_ONE_SHOT_PROG_ISSUE_CHK_EIGHT_2K_LOW_LVL_REQ_NEXT  
                LABEL_ONE_SHOT_PROG_ISSUE_CHK_SEVENTH_2K_REQ_END_CHK: 
                    pbreq.nofst     C_PROG_END
                    

            LABEL_ONE_SHOT_PROG_ISSUE_CHK_EIGHT_2K_LOW_LVL:
                sbyt.gr         R3, 0
                cklvl.reqh      r0, level_h0
                jnz.nfc         LABEL_ONE_SHOT_PROG_ISSUE_CHK_EIGHT_2K_LOW_LVL, r0
                calre.rt    #LABEL_PROG_TLC_INGRESS_DATA_80_DATA_FUNC

            LABEL_ONE_SHOT_PROG_ISSUE_CHK_EIGHT_2K_LOW_LVL_REQ_NEXT:
                ##offst.im      0   ##(1cmd-2plane ,so offset=0 is ok)
                LABEL_ONE_SHOT_PROG_ISSUE_CHK_EIGHT_2K_LOW_LVL_CHK:
                cklvl.reqh      r0, level_2k
                jnz.nfc         LABEL_ONE_SHOT_PROG_ISSUE_CHK_EIGHT_2K_LOW_LVL_CHK, r0
                adbyt.imm       R3, R3, 9    ## previous is 8'bxxxx_0111, need add 9 to increase
                setgpo.gr       R3
                pbreq.nofst     C_PROG_ON
                calre.rt    #LABEL_PROG_TLC_INGRESS_DATA_80_DATA_FUNC



    ##########################################################
    ##                 Program Postfix 1xH (10H/11H/15H)    ##
    ##                                                      ##   
    ##########################################################
    LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_FUNC:
    ##=COMPILER_L1 (determine prog postfix)
        #cmcmd           r0, 1, C_CMD_CTR_CACHE_START, 0 
        #jnz.nfc         LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE, r0
        ##(no cache feature support)
        jnz.fc         LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE, r0
        LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_CACHE:
            jne.v1epc  LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK, 1
                LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_CHK:
                ## (in mp2, only check in last plane against next 2 cmds, since first plane always 11h)
                    jnz.nfc     LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_IS_HIT_BEFORE, r4
                    jne.v0epc   LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE, 1
                    LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_NOT_HIT_BEFORE:
                    ## If mp2 no-hit-before, sequence gclvl>2 -->> slc_prog -->> cache_en -->> mp2 -->> pba_lun_pln_blk -->> not_last_wl(could not use since pba has the same function) -->> cache hit (current block)
                        ##(gclvl>2)
                        gclvl       r0, 2 , 0      
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_CHK_UNCACHE, r0
                        cpphy.nofst
                        offst.im    1
                        ##(slc_prog)
                        #cmcmd       r0, 4, C_CMD_OP_START, C_PROG_SLC
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_CHK_UNCACHE, r0
                        ##(nxt cmd cache_en)
                        #cmcmd       r0, 1, C_CMD_CTR_CACHE_START, 0 
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_CHK_UNCACHE, r0
                        ##(nxt cmd mp2)
                        #cmcmd       r0, 2, C_CMD_CTR_START, 2
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_CHK_UNCACHE, r0
                        ##(pba_lun_blk compare)
                        ckphy.ofst  r0, 2, 9, 0   ## check block and plane, no check page
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_CHK_UNCACHE, r0
                        ##(cache hit, offset to 0)
                        offst.im    0
                        setb        r3, 1
                        jnz.fc      LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_CHK_HIT_FINISH, r0


                    LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_IS_HIT_BEFORE:
                    ## If mp2 hit-before, sequence gclvl>2 -->> slc_prog -->> cache_en -->> mp2 -->> pba_lun_pln_blk -->> not_last_wl(could not use since pba has the same function) -->> cache hit (current block)
                        gclvl       r0, 3 , 0      
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_CHK_UNCACHE, r0
                        offst.im    1  ##(copy phy info from prev pair plane0, then cmp next pair plane0)
                        cpphy.nofst
                        offst.im    3
                        ##(slc_prog)
                        #cmcmd       r0, 4, C_CMD_OP_START, C_PROG_SLC
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_CHK_UNCACHE, r0
                        ##(nxt cmd cache_en)
                        #cmcmd       r0, 1, C_CMD_CTR_CACHE_START, 0 
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_CHK_UNCACHE, r0
                        ##(nxt cmd mp2)
                        #cmcmd       r0, 2, C_CMD_CTR_START, 2
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_CHK_UNCACHE, r0
                        ##(pba_lun_blk compare)
                        ckphy.ofst  r0, 1, 9, 0   ## check block and plane, no check page
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_CHK_UNCACHE, r0
                        ##(cache hit, offset to 0)
                        offst.im    2
                        setb        r3, 0
                        jnz.fc      LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_CHK_HIT_FINISH, r0



                    LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_CHK_HIT_FINISH:
                        setb        r4, 1
                        sbyt.gr     R2, 21 # 21=15H  
                        jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_SET

                    LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_MP2_CACHE_CHK_UNCACHE:
                        setb        r5, 1
                        sbyt.gr     R2, 16 # 16=10H
                        jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_SET


                LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_MP2_FIR_PLANE:
                    setb        r3, 0                ##(r3 init, only last for one page)
                    jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE 


                LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK:
                ## (check the next one is cachable, then do cache)
                    jnz.nfc     LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_IS_HIT_BEFORE, r4
                    LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_NOT_HIT_BEFORE:
                    ## (If sp1 no-hit-before, sequence gclvl>1 -->> slc_prog -->> cache_en -->> sp1 -->> pba_lun_pln_blk -->> not_last_page(could not use since pba has the same function) -->> cache hit (current block))
                        ##(gclvl>1)
                        gclvl       r0, 1 , 0      
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK_UNCACHE, r0
                        cpphy.nofst
                        ##(slc_prog)
                        offst.im    1
                        #cmcmd       r0, 4, C_CMD_OP_START, C_PROG_SLC
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK_UNCACHE, r0
                        ##(nxt cmd cache_en)
                        #cmcmd       r0, 1, C_CMD_CTR_CACHE_START, 0                       
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK_UNCACHE, r0
                        ##(nxt cmd sp1)
                        #cmcmd       r0, 2, C_CMD_CTR_START, 1
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK_UNCACHE, r0
                        ##(pba_lun_blk compare)
                        ckphy.ofst  r0, 1, 9, 0   ## check block and plane, no check page
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK_UNCACHE, r0
                        ##(cache hit, offset to 0)
                        offst.im    0
                        setb        r3, 1
                        jnz.fc      LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK_HIT_FINISH, r0

                    LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_IS_HIT_BEFORE:
                    ## (If sp1 hit-before, sequence gclvl>2 -->> slc_prog -->> cache_en -->> sp1 -->> pba_lun_pln_blk -->> not_last_page(could not use since pba has the same function) -->> cache hit (current block))
                        ##(gclvl>1)
                        gclvl       r0, 2 , 0      
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK_UNCACHE, r0
                        cpphy.nofst
                        ##(slc_prog)
                        offst.im    2
                        #cmcmd       r0, 4, C_CMD_OP_START, C_PROG_SLC
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK_UNCACHE, r0
                        ##(nxt cmd cache_en)
                        #cmcmd       r0, 1, C_CMD_CTR_CACHE_START, 0                       
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK_UNCACHE, r0
                        ##(nxt cmd sp1)
                        #cmcmd       r0, 2, C_CMD_CTR_START, 1
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK_UNCACHE, r0
                        ##(pba_lun_blk compare)
                        ckphy.ofst  r0, 1, 9, 0   ## check block and plane, no check page
                        not         r0
                        jnz.nfc     LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK_UNCACHE, r0
                        ##(cache hit, offset to 0)
                        offst.im    1
                        setb        r3, 0
                        jnz.fc      LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK_HIT_FINISH, r0



                    LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK_HIT_FINISH:
                    ##(cache hit this cmd)
                        setb        r4, 1
                        sbyt.gr     R2, 21 # 21=15H  
                        jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_SET
                    
                    LABEL_RPOG_TLC_INGRESS_DATA_POSTFIX_SP1_CACHE_CHK_UNCACHE:
                    ##(cache NO hit)
                        setb        r5, 1 
                        sbyt.gr     R2, 16 # 16=10H
                        jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_SET



        LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE:
        ##(r4 is enable for 1cmd-2plane, detail see total introduction)
            jne.v1epc   LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_SP , 1
            jne.v0epc   LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_MP_11H, 1
            LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_ALL_OTHER: ##(v0=1, v1=1, mp2)
                jne.grepc   LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_MP2_ONE_SHOT_CHK, r2, 1 
                jne.grepc   LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_MP_11H, r4, 1  ##(v0=1, v1=1, mp2, r4=1 go next and last 1cmd2plane)
                LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_MP2_ONE_SHOT_CHK:
                        jnz.nfc     LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_MP2_10H, r7
                        sbyt.gr     R2, 5
                        cmbyt       r0, R1, R2
                        jnz.nfc     LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_MP2_10H, r0
                LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_MP2_1AH:
                    sbyt.gr     R2, 26 # 26=1AH   #(except v0=1,v1=1, atomic cnt <5)
                    jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_SET
                LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_MP2_10H:
                    sbyt.gr     R2, 16 # 16=10H   #(except v0=0,v1=1, all other=>10H)
                    jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_SET
            LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_SP:   ##(v0=0, v1=0, sp1)
                jne.grepc   LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_SP1_ONE_SHOT_CHK, r2, 1 
                jne.grepc   LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_MP_11H, r4, 1  ##(v0=0,v1=0,sp1,r4=0, postfix=11h; r4=1, postfix=10h)
                    ##(for YMTC ONE SHOT PROG)
                    LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_SP1_ONE_SHOT_CHK:
                        jnz.nfc     LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_SP1_10H, r7
                        sbyt.gr     R2, 2
                        cmbyt       r0, R1, R2
                        jnz.nfc     LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_SP1_10H, r0
                    LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_SP1_1AH:
                        sbyt.gr     R2, 26 # 26=1AH   #(uncache sp =>1AH)
                        jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_SET
                    LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_SP1_10H:
                        sbyt.gr     R2, 16 # 16=10H   #(uncache sp =>10H)
                        jnz.fc      LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_SET
            LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_UNCACHE_MP_11H: ##([ v0=0, v1=1, mp2 | v0=0,v1=1, mp2, r4=0/1 | v0=1,v1=1,mp2, r4=1 ])
                sbyt.gr     R2, 17 # 17=11H   #(only v0=0, v1=1 =>11H)


            LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_SET:
            setpr.gr    R2, 0, 7
            wk.ndsyld       I_CL_PROG_POST, LABEL_0
            
        calre.rt  #LABEL_PROG_TLC_INGRESS_DATA_POSTFIX_FUNC



    ##########################################################
    ##              Return CPL and Incr cmd                 ##
    ##                                                      ##   
    ##########################################################
    LABEL_RETURN_CPL_INCPTR_CMD_FUNC:
    ##=COMPILER_2 (based on r0+offset input value, decide return pass/fail)
        jnz.nfc     LABEL_RETURN_CPL_FAIL_INCPTR_CMD, r0     
        LABEL_RETURN_CPL_PASS_INCPTR_CMD:
            reti            8, 0, 0, LABEL_RETURN_CPL_PASS_INCPTR_CMD
            incptr.cmd      1
            calre.rt        #LABEL_RETURN_CPL_INCPTR_CMD_FUNC
        LABEL_RETURN_CPL_FAIL_INCPTR_CMD:
            reti            8, 1, 0, LABEL_RETURN_CPL_FAIL_INCPTR_CMD
            incptr.cmd      1
            calre.rt        #LABEL_RETURN_CPL_INCPTR_CMD_FUNC

    ##########################################################
    ##              Program Check Status RETI               ##
    ##                                                      ##   
    ##########################################################
    LABEL_PROG_TLC_CHK_STATUS_RETI_FUNC:
    ##=COMPILER_1 (after each 16k prog, read status and if ready, reti cmd)
        jnz.fc      LABEL_PROG_TLC_CHK_STATUS_RETI_UNCACHE  ##(no cache this revision)
        jnz.nfc     LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_HIT, r4  ##(r4=init+middle)
        jnz.nfc     LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_HIT, r5  ##(r5=last)
        LABEL_PROG_TLC_CHK_STATUS_RETI_UNCACHE:
            ccbit       C_CMD_CTR_ATOMIC_EN_START, 0, 0     ## (cpy cmd[c_cache_en]=r[0])
            jne.grepc   LABEL_PROG_TLC_CHK_STATUS_ATOMIC_CHECKED_DONE, r0, 1
            ccbit       C_CMD_CTR_ATOMIC_ACTIVE_START, 0, 0     ## (cpy cmd[c_cache_active]=r[0]. or else bit[7]=1'b1 )
            jne.grepc   LABEL_PROG_TLC_CHK_STATUS_YIELD_OFF, r0, 0  ##(if bit[7]=1,bit[6]=1, jump addr)
            ##(if pc next: bit[7]=1, bit[6]=0)
            jnz.nfc     LABEL_PROG_TLC_CHK_STATUS_YIELD_ON, r4 ##(if r4=1, jump addr, means last plane and last atomic; if r4=0, pc next, means although last atomic, but in middle of 1cmd-2plane)
            jnz.fc      LABEL_PROG_TLC_CHK_STATUS_YIELD_OFF 
            #ccbit       C_CMD_PBA_LUN_START, 24, 24     ## (cpy cmd[lun]=r[24:24])
            #setpr.gr    R3, 0, 7                        ## (cpy r[31:24]=itfc[7:0])
            LABEL_PROG_TLC_CHK_STATUS_ATOMIC_CHECKED_DONE:
            jnz.nfc     LABEL_PROG_TLC_CHK_STATUS_YIELD_ON, r1  ##(r1 buflock logical should be same as r2/r4 judge logical)

            LABEL_PROG_TLC_CHK_STATUS_YIELD_OFF:
                #setpr.lun       0, 7                        ## (cpy cmd[lun]=>itfc[7:0])
                #wk.snstkyld   I_CL_SYNC_RS_71H, LABEL_PROG_TLC_CHK_STATUS_YIELD_OFF
                #setpr.gr       R3, 0, 7                        ## (cpy r[31:24]=itfc[7:0])
                setp           SETP_ID_NO_CA, 0, 0
                wk             I_CL_SYNC_RS_78H, C_WK_CTRL_1, LABEL_0
                stacp.n         r0, 6   ##(for MLC/TLC, need to check tDBSY, and RDY(bit6) is used for this check per to spec)
                #jnz.nfc         LABEL_PROG_TLC_CHK_STATUS_FOR_RETI, r0
                jnz.nfc         LABEL_PROG_TLC_CHK_STATUS_YIELD_OFF_1CMD_2PLANE_CHK, r0
                #yield
                jnz.fc          LABEL_PROG_TLC_CHK_STATUS_YIELD_OFF

            LABEL_PROG_TLC_CHK_STATUS_YIELD_OFF_1CMD_2PLANE_CHK:
                jne.grepc      LABEL_PROG_TLC_CHK_STATUS_FOR_RETI, r2, 1  ##(if r2=1, pc next, else r2=0, jump addr, original flow) 
                jne.grepc      LABEL_PROG_TLC_CHK_STATUS_FOR_RETI, r4, 0  ##(if r4=0, pc next means 1st-plane of 1cmd-2plane, no incptr)
                calre.rt    #LABEL_PROG_TLC_CHK_STATUS_RETI_FUNC 

            LABEL_PROG_TLC_CHK_STATUS_YIELD_ON:
                #setpr.gr    R3, 0, 7                        ## (cpy r[31:24]=itfc[7:0])
                #setpr.lun    0, 7                        ## (cpy cmd[lun]=itfc[7:0])
                #wk.snstk    I_CL_SYNC_RS_71H, LABEL_PROG_TLC_CHK_STATUS_YIELD_ON
                setp        SETP_ID_NO_CA, 0, 0
                wk          I_CL_SYNC_RS_78H, C_WK_CTRL_5, LABEL_PROG_TLC_CHK_STATUS_YIELD_ON
                #stacp.ni    r0, 5
                #jnz.nfc     LABEL_PROG_TLC_CHK_STATUS_YIELD_ON, r0
                stacp.ni    r0, 6
                jnz.nfc     LABEL_PROG_TLC_CHK_STATUS_YIELD_ON, r0
                jnz.fc      LABEL_PROG_TLC_CHK_STATUS_FOR_RETI
                ##(feature not support: Suspend not implemented here)
                jnz.fc      LABEL_PROG_TLC_CHK_STATUS_FOR_SUSPEND
                #yield
                LABEL_PROG_TLC_CHK_STATUS_FOR_SUSPEND_DONE:
                ##(after suspend, begin restore all context)
                jnz.fc      LABEL_PROG_TLC_CHK_STATUS_YIELD_ON

            LABEL_PROG_TLC_CHK_STATUS_FOR_RETI:
                setcpl.tm   68, 83           ## add debug timer for return cpl
                stacp.n     r0, 0
                jnz.nfc     LABEL_PROG_TLC_CHK_STATUS_RETI_FAIL, r0

                LABEL_PROG_TLC_CHK_STATUS_RETI_PASS:
                    reti        8, 0, 0, LABEL_PROG_TLC_CHK_STATUS_RETI_PASS
                    incptr.cmd  1
                    calre.rt    #LABEL_PROG_TLC_CHK_STATUS_RETI_FUNC  
                    
                LABEL_PROG_TLC_CHK_STATUS_RETI_FAIL:
                    reti        8, 1, 0, LABEL_PROG_TLC_CHK_STATUS_RETI_FAIL
                    incptr.cmd  1
                    calre.rt    #LABEL_PROG_TLC_CHK_STATUS_RETI_FUNC  

            ##( label for program suspend, add suspend code here)
            LABEL_PROG_TLC_CHK_STATUS_FOR_SUSPEND:
                yield
                jnz.fc  LABEL_PROG_TLC_CHK_STATUS_FOR_SUSPEND_DONE

        
        LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_HIT:
        ##(when slc sp1/mp2 cache hit, use begin status & reti, if 1CE 1LUN always yield. Since 1CE multi-lun, then cache will not allowed in interleaving opertion, thus FW only send cache operation in 1CE-1LUN, thus it is safe when always hit )
            #ccbit       C_CMD_PBA_LUN_START, 24, 24     ## (cpy cmd[lun]=r[24:24])
            #setpr.gr    R3, 0, 7                        ## (cpy r[31:24]=itfc[7:0])
            LABEL_PROG_TLC_CHK_STATUS_CACHE_HIT_YIELD_OFF:
                ##yield  ##(prog slc cache hit, to get cache advantage, should not yield)
                #setpr.gr    R3, 0, 7                        ## (cpy r[31:24]=itfc[7:0])
                #setpr.lun   0, 7                        ## (cpy r[31:24]=itfc[7:0])
                #wk.snstkyld I_CL_SYNC_RS_71H, LABEL_PROG_TLC_CHK_STATUS_CACHE_HIT_YIELD_OFF
                setp        SETP_ID_NO_CA, 0, 0
                wk.snstkyld I_CL_SYNC_RS_78H, LABEL_PROG_TLC_CHK_STATUS_CACHE_HIT_YIELD_OFF 
                stacp.ni    r0, 5
                jnz.nfc     LABEL_PROG_TLC_CHK_STATUS_CACHE_HIT_YIELD_OFF, r0

            LABEL_PROG_TLC_CHK_STATUS_CACHE_HIT_RETI:
            ##(in cache, current opertion done, check if init-cache or middle-cache or last-cache, then decide how to reti)
                jnz.nfc     LABEL_PROG_TLC_CHK_STATUS_RETI_INIT_CACHE_HIT, r3
                jne.v1epc   LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_MP2, 0
                LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_SP1:
                ##(if cache is already hit at previous)
                    jnz.nfc     LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_IS_LAST_SP1, r5
                    LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_NOT_LAST_SP1:
                    ##(if cache is already hit and current is not last cache ending)
                        stacp.n     r0, 6
                        jnz.nfc     LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_NOT_LAST_SP1_RDY, r0
                        yield
                        jnz.fc      LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_NOT_LAST_SP1

                        LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_NOT_LAST_SP1_RDY:
                            offst.im    0
                            setcpl.tm   68, 83           ## add debug timer for return cpl
                            stacp.n     r0, 1
                            calre.cal   LABEL_RETURN_CPL_INCPTR_CMD_FUNC
                            offst.im    1                ## the current cache prog done, for next cache operation,need offset to 1
                            calre.rt    #LABEL_PROG_TLC_CHK_STATUS_RETI_FUNC  

                    LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_IS_LAST_SP1:
                    ##(if cache is already hit and current is the last cache hit)
                        stacp.n     r0, 6
                        jnz.nfc     LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_IS_LAST_SP1_RDY, r0
                        yield
                        jnz.fc      LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_IS_LAST_SP1

                        LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_IS_LAST_SP1_RDY:
                            offst.im    0
                            setcpl.tm   68, 83           ## add debug timer for return cpl
                            stacp.n     r0, 1
                            calre.cal   LABEL_RETURN_CPL_INCPTR_CMD_FUNC
                            setcpl.tm   68, 83           ## add debug timer for return cpl
                            stacp.n     r0, 0
                            calre.cal   LABEL_RETURN_CPL_INCPTR_CMD_FUNC
                            calre.rt    #LABEL_PROG_TLC_CHK_STATUS_RETI_FUNC   


                LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_MP2:
                ##(if cache is already hit at previous, mp2 in first plane is mark as cache already)
                    jnz.nfc     LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_IS_LAST_MP2, r5
                    LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_NOT_LAST_MP2:
                    ##(if cache is already hit and current is not last cache ending)
                        stacp.n     r0, 6
                        jnz.nfc     LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_NOT_LAST_MP2_RDY, r0
                        yield
                        jnz.fc      LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_NOT_LAST_MP2

                        LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_NOT_LAST_MP2_RDY:
                        jne.v0epc       LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_IS_LAST_MP2_V1_CHK, 0
                        LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_IS_LAST_MP2_V0_RT:
                        ##(if mp2, and not init not last, v0=0 will not return cpl, since previous stuck cpl, need wait v0=1, or final to return)
                            offst.im    2
                            calre.rt    #LABEL_PROG_TLC_CHK_STATUS_RETI_FUNC   
                        LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_IS_LAST_MP2_V1_CHK:
                        ##(if mp2, and not init not last, v0=1 will return two cpl, since previous stuck cpl could return, and v0=0 could also return cpl)
                                offst.im    0
                                setcpl.tm   68, 83           ## add debug timer for return cpl
                                stacp.n     r0, 1
                                calre.cal   LABEL_RETURN_CPL_INCPTR_CMD_FUNC
                                setcpl.tm   68, 83           ## add debug timer for return cpl
                                stacp.n     r0, 0
                                calre.cal   LABEL_RETURN_CPL_INCPTR_CMD_FUNC
                                offst.im    1                ##(point to next mp2 new cmd)
                                calre.rt    #LABEL_PROG_TLC_CHK_STATUS_RETI_FUNC   


                    LABEL_PROG_TLC_CHK_STATUS_RETI_CACHE_NOT_INIT_IS_LAST_MP2:
                    ##(if cache is already hit and current is last cache ending, in this senario, previous has 2-cmd, and plus this cmd need 3cpl return)
                        offst.im    0
                        setcpl.tm   68, 83           ## add debug timer for return cpl
                        stacp.n     r0, 1
                        calre.cal   LABEL_RETURN_CPL_INCPTR_CMD_FUNC  ##(offst=0 return pre-plane1)
                        setcpl.tm   68, 83           ## add debug timer for return cpl
                        stacp.n     r0, 0
                        calre.cal   LABEL_RETURN_CPL_INCPTR_CMD_FUNC  ##(offst=0 return current mp2's plane0)
                        setcpl.tm   68, 83           ## add debug timer for return cpl
                        stacp.n     r0, 0
                        calre.cal   LABEL_RETURN_CPL_INCPTR_CMD_FUNC  ##(offst=0 return current mp2's plane1, or last cache hit plane1)
                        calre.rt    #LABEL_PROG_TLC_CHK_STATUS_RETI_FUNC   


            LABEL_PROG_TLC_CHK_STATUS_RETI_INIT_CACHE_HIT:
                jne.v1epc   LABEL_PROG_TCL_CHK_STATUS_RETI_INIT_CACHE_HIT_MP2, 0
                calre.rt    #LABEL_PROG_TLC_CHK_STATUS_RETI_FUNC  

                LABEL_PROG_TCL_CHK_STATUS_RETI_INIT_CACHE_HIT_MP2:
                    offst.im    1
                    calre.rt    #LABEL_PROG_TLC_CHK_STATUS_RETI_FUNC  

###########################################################
#
# SLC Program Function (1cmd for 2plane)
#
###########################################################
LABEL_PROG_SLC_ENTRY_1CMD_2PLANE: 
    ##=(mark r7 as SLC flag, bit=1)
    sbyt.gr     B1, 218   ##218=DAh
    setpr.gr    B1, 0, 7
    wk.ndsyld   I_CL_SYNC_ISSUE_CMD, LABEL_0 
     
    sbyt.v0     0
    sbyt.gr     R0, 0
    sbyt.gr     R3, 0
    setb        r7, 1 
    setb        r2, 1    ##(mark as 1cmd-2plane flag)
    jnz.fc      LABEL_PROG_XLC_REUSE_ENTRY
       

###########################################################
#
# SLC Program Function (1cmd for 1plane)
#
###########################################################
LABEL_PROG_SLC_ENTRY: 
        sbyt.v0     0
        sbyt.gr     R0, 0
        sbyt.gr     R3, 0
        ##=(mark r7 as SLC flag, bit=1)
        sbyt.gr     B2, 218   ##218=DAh
        setpr.gr    B2, 0, 7
        wk.ndsyld   I_CL_SYNC_ISSUE_CMD, LABEL_0  
        
        setb        r7, 1 
        ##=(jump to TLC prog core for use)
        jnz.fc      LABEL_PROG_XLC_REUSE_ENTRY

        LABEL_PROG_SLC_ISSUE_DF:   ##(entry for 1cmd-1plane and 1cmd-2plane)
        sbyt.gr     B2, 223   ##223=DFh
        setpr.gr    B2, 0, 7
        wk.ndsyld   I_CL_SYNC_ISSUE_CMD, LABEL_0  
        sets        0, 0, 0
        end




    






































##tlc 4k performance read
#########################################################add read p1/p2 begin#######################
LABEL_READ_TLC_ENTRY:
            setb        r14, 1            ## GR[14]=1 : tlc 4k read
            jnz.fc      LABEL_READ_4K_COMMON_ENTRY
LABEL_READ_SLC_ENTRY:
            setb        r14, 0            ## GR[14]=0 : slc 4k read
LABEL_READ_4K_COMMON_ENTRY:
            sets        0, 5, 1

LABEL_SYNC_SLC_TLC_SINGLE_READ_PRE:
            offst.im    0                                          ## else single 4k slc or tlc read
            jnz.nfc     LABEL_SINGLE_4K_TLC_WK_COMMON, r14    ## jump to tlc 
            sbyt        B0, 218                          ## DA cmd set
            setpr.gr    B0, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_NSTK_NYLD_NDS, LABEL_0
LABEL_SINGLE_4K_TLC_WK_COMMON:
            
            setp        SETP_ID_ALL, 0, 0
LABEL_SINGLE_4K_SLC_TLC_WK:
            sbyt        B0, 48
            setpr.gr    B0, 48, 55                                         ## set last cmd 30H
            wk          I_CL_SLC_TLC_READ_COMMON, C_WK_CTRL_8, LABEL_SINGLE_4K_SLC_TLC_WK 
            tmrst

#################################################################################################

## Read status for read opearation
LABEL_SYNC_TLC_READBACK_YIELD:
            yield       
LABEL_SYNC_TLC_READBACK_MAIN:
            offst       0, 0
            setp        SETP_ID_ALL, 0, 0
            wk          I_CL_SYNC_RS_70H, C_WK_CTRL_5, LABEL_SYNC_TLC_READBACK_MAIN
            cklvl       r0, 1, level_empty
            jnz         LABEL_SYNC_TLC_READBACK_YIELD, r0, 0
            tmrea       r0, 500
            jnz.nfc     LABEL_SYNC_TLC_ISSUE_05_E0, r0
            stacp       r0, 1, 6
            jnz         LABEL_SYNC_TLC_READBACK_YIELD, r0, 0


LABEL_SYNC_TLC_ISSUE_05_E0:
            setp        SETP_ID_ALL, 0, 0
            wk          I_CL_READ_P1, C_WK_CTRL_A, LABEL_0
            

LABEL_SYNC_TLC_READBACK_CPL_CHK_READY_YIELD:
            cklvl       r0, 1, 150
            jne         LABEL_SYNC_TLC_READBACK_CPL_CHK_READY_YIELD, r0, 0 , 1

            offst       0, 0
            setcpl      15, 0, 220, 223
            incptr      1, 144
LABEL_TLC_FIRST_2K_RETI_ADDR:         
            reti        7, 0, 8, LABEL_TLC_FIRST_2K_RETI_ADDR 


             
###################################single read cmd#########################
LABEL_SYNC_TLC_SINGLE_READ_CHK_LVL:
            cklvl       r0, 1, 266
            jne         LABEL_SYNC_TLC_SINGLE_READ_CHK_LVL, r0, 0 , 1
            offst       0, 0
            

            setcpl      15, 1, 220, 223
            setcpl      13, 0, 68, 83
            incptr      1, 144
LABEL_SYNC_TLC_READBACK_RETURN_START:            
            reti        7, 0, 0, LABEL_SYNC_TLC_READBACK_RETURN_START          
            incptr      0, 0
            jnz.nfc     LABEL_4K_TO_END, r14
            sbyt        B0, 223                          ## DF cmd set
            setpr.gr    B0, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_STK_NYLD_NDS, LABEL_0
LABEL_4K_TO_END:
            sets        0, 5, 0
            end           


##tlc page read and cache read
#########################################################################################################
#########################################################################################################
#########################################################################################################
###########################################################multi_plane cache read  and no cache read ##################

LABEL_PAGE_READ_TLC_ENTRY:
            setb        r14, 1            ## GR[14]=1 : tlc 4k read
            jnz.fc      LABEL_MULTI_PAGE_READ_COMMON_ENTRY
LABEL_PAGE_READ_SLC_ENTRY:
            setb        r14, 0            ## GR[14]=0 : slc 4k read
LABEL_MULTI_PAGE_READ_COMMON_ENTRY:
            sets        0, 5, 1
#########multi-plane match##################################
            matcl       r8, C_MP_FOR2, 252, 0, 0
            jnz         LABEL_MULTI_READ_MP2_FUNC, r8, 0
LABEL_MULTI_READ_MP1_FUNC:
            ## set v1 to 1 as loop limit, set v0 to 0 as loop limit
            sar         1, 1
            sar         0, 0
            jnz         LABEL_MULTI_READ_MATCH_PAGE_FUNC, r0, 1            
LABEL_MULTI_READ_MP2_FUNC:
            ## wait for second cmd for mp2
            gclvl       r0, 1  
            jnz         LABEL_MULTI_READ_MUL_CTRL, r0, 0
            end
LABEL_MULTI_READ_MUL_CTRL:
            ## set v1 to 2 as loop limit, set v0 to 0 as loop limit
            sar         1, 2
            sar         0, 0
 
 
LABEL_MULTI_READ_MATCH_PAGE_FUNC:
            offst.im    0
            jnz.fc      LABEL_MULTI_READ_PAGE_ALL
LABEL_MULTI_READ_FETCH_NEXT_CMD:
            offst.im    1 

            
#######################################################################
LABEL_MULTI_READ_PAGE_ALL:
            adar        0, 1
##            setp        SETP_ID_ALL, 0, 0
            jne         LABEL_MULTI_READ_PAGE_ALL_PL0, 2, 1, 0              ## v0 != v1 then jump    first read of multi-plane
            jne         LABEL_MULTI_READ_PAGE_ALL_SIN, 1, 1, 2              ## v1 != 2 then jump,    single read
                                                                            ## else                  second read of multi-plane
LABEL_MULTI_READ_PAGE_ALL_PL1:
            nop
            nop
            nop                                                           ## add a nop for 440MT
`ifdef MODE8
            nop
            nop
            nop
`endif
            sbyt        B0, 48
            setpr.gr    B0, 48, 55                                         ## set last cmd 30H
            setp        SETP_ID_ALL, 0, 0
            wk          I_CL_SLC_TLC_READ_COMMON, C_WK_CTRL_8, LABEL_MULTI_READ_PAGE_ALL_PL1
            tmrst
            jnz         LABEL_MULTI_READ_PAGE_LUN0_LUN1_MATCH, r0, 1

LABEL_MULTI_READ_PAGE_ALL_SIN:
            jnz.nfc     LABEL_MULTI_READ_PAGE_ALL_SIN_WK_COMMON, r14    ## jump to tlc 
            sbyt.gr     B0, 218             ## 218d=DAh
            setpr.gr    B0, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_NSTK_NYLD_NDS, LABEL_0
LABEL_MULTI_READ_PAGE_ALL_SIN_WK_COMMON:
            sbyt        B0, 48
            setpr.gr    B0, 48, 55                                         ## set last cmd 30H
            setp        SETP_ID_ALL, 0, 0
            wk          I_CL_SLC_TLC_READ_COMMON, C_WK_CTRL_8, LABEL_MULTI_READ_PAGE_ALL_SIN_WK_COMMON
            tmrst
            jnz         LABEL_MULTI_READ_PAGE_LUN0_LUN1_MATCH, r0, 1

LABEL_MULTI_READ_PAGE_ALL_PL0:
            jnz.nfc     LABEL_MULTI_READ_PAGE_ALL_PL0_WK_COMMON, r14    ## jump to tlc 
            sbyt.gr     B0, 218             ## 218d=DAh
            setpr.gr    B0, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_NSTK_NYLD_NDS, LABEL_0
LABEL_MULTI_READ_PAGE_ALL_PL0_WK_COMMON:
            sbyt        B0, 50
            setpr.gr    B0, 48, 55                                         ## set last cmd 32H
            setp        SETP_ID_ALL, 0, 0
            wk          I_CL_SLC_TLC_READ_COMMON, C_WK_CTRL_8, LABEL_MULTI_READ_PAGE_ALL_PL0_WK_COMMON  
            tmrst
            jnz         LABEL_MULTI_READ_PAGE_NOYE_LUN0_LUN1_MATCH, r0, 1  

########################################################################################
LABEL_MULTI_READ_PAGE_LUN0_LUN1_MATCH:
            
            matcl       r0, C_CACHED_EN, 127, 0, 0                        ## cache read enable
            jnz         LABEL_MULTI_READ_CACHE_ENTRY, r0, 0
            jne         LABEL_SINGLE_PAGE_READ_YIELD, 1, 1, 2              ## v1 != 2 , then jump to single page read 
            jnz.fc      LABEL_MUL_PLANE_PAGE_READ_YIELD                    ## else go to multi-plane cache match, except cache disable, then jump to multi-plane no cache branch
LABEL_MULTI_READ_CACHE_ENTRY:
            jne         LABEL_READ_SIG_CACHE_MAT, 1, 1, 2                  ## jump to single cache page read
            jnz.fc      LABEL_READ_MUL_CACHE_MAT                           ## jump to multi-plane cache page read
###########################################

LABEL_MULTI_READ_PAGE_NOYE_LUN0_LUN1_MATCH:
#####pre return a dummy cpl without data for the forth cmd issue        
            setcpl      15, 7, 85, 87
            setcpl      15, 0, 36, 37
            reti        0, 0, 0, LABEL_MULTI_READ_PAGE_NOYE_LUN0_LUN1_MATCH

            jnz.fc      LABEL_MULTI_READ_FETCH_NEXT_CMD



###############################################################################################################################################
####################################multi-plane no cache read begin ###########################################################################

LABEL_MUL_PLANE_PAGE_READ_YIELD:
            setb        r12, 0            ## multi-plane read , then set r12=0
            jnz.fc      LABEL_MULTI_READ_NO_CACHE_BEGIN_YIELD
LABEL_SINGLE_PAGE_READ_YIELD:
            setb        r12, 1            ## single read, then set r12=1


LABEL_MULTI_READ_NO_CACHE_BEGIN_YIELD:
            yield 
LABEL_MULTI_READ_NO_CACHE_BEGIN:
            offst       0, 0
            setp        SETP_ID_ALL, 0, 0
            wk          I_CL_SYNC_RS_70H, C_WK_CTRL_5, LABEL_MULTI_READ_NO_CACHE_BEGIN
##            setpr       0, r2, 40, 47
##            wk          I_CL_F1_F2_RS, C_WK_CTRL_D, LABEL_MULTI_READ_NO_CACHE_BEGIN
            cklvl       r0, 1, 144
            jnz         LABEL_MULTI_READ_NO_CACHE_BEGIN_YIELD, r0, 0
            stacp       r0, 1, 6
            jnz         LABEL_MULTI_READ_NO_CACHE_BEGIN_YIELD, r0, 0
            
 
            jnz.nfc     LABEL_SINGLE_PAGE_READ_05_E0, r12            ## single page read? then jump to single 05-e0
            wk          I_CL_READ_P1, C_WK_CTRL_A, LABEL_0
###call a common three 4k function
            calre       0, LABLE_PAGE_READ_THREE_4K_CONTROL_FUNC
LABEL_MULTI_READ_NO_CACHE_CHK_LVL:
            cklvl       r0, 1, 238
            jne         LABEL_MULTI_READ_NO_CACHE_CHK_LVL, r0, 0 , 1
            sbyt        B0, 0
            ccbit       122, 2, 6
            adbyt       0, 0, 3, 3, 0
            setcpl      14, 3, 88, 95
            setcpl      15, 0, 220, 223
            setcpl      15, 3, 0, 1
            incptr      1, 144
LABEL_MULTI_READ_NO_CACHE_FOUR4K_1ST_RETI:         
            reti        7, 0, 8, LABEL_MULTI_READ_NO_CACHE_FOUR4K_1ST_RETI   
            setcpl      14, 3, 88, 95          
            setcpl      15, 1, 220, 223
            setcpl      15, 3, 0, 1
            setcpl      15, 15, 39, 42
            setcpl      15, 3, 253, 254
            setcpl      13, 0, 68, 83
            incptr      1, 144
LABEL_MULTI_READ_NO_CACHE_FOUR4K_2ST_RETI:            
            reti        7, 0, 0, LABEL_MULTI_READ_NO_CACHE_FOUR4K_2ST_RETI 
            incptr      0, 0
 
 
###################following is 05-e0 the second plane data#################### 
 
 
LABEL_MULTI_READ_NO_CACHE_CHK_FORTH_4K_BUF_EMPTY:
            cklvl       r0, 1, level_empty
            jnz         LABEL_MULTI_READ_NO_CACHE_CHK_FORTH_4K_BUF_EMPTY, r0, 0
LABEL_SINGLE_PAGE_READ_05_E0:
            setp        SETP_ID_ALL, 0, 0
            wk          I_CL_READ_P1, C_WK_CTRL_A, LABEL_0

LABEL_MULTI_READ_NO_CACHE_DUMMY_CPL_RETI_2:                       ## single page read, the cpl return
            setcpl      15, 7, 85, 87
            setcpl      15, 0, 36, 37
            reti        0, 0, 0, LABEL_MULTI_READ_NO_CACHE_DUMMY_CPL_RETI_2
###call a common three 4k function
            calre       0, LABLE_PAGE_READ_THREE_4K_CONTROL_FUNC
LABEL_MULTI_READ_NO_CACHE_CHK_SEC_PL_LVL:
            cklvl       r0, 1, 167
            jne         LABEL_MULTI_READ_NO_CACHE_CHK_SEC_PL_LVL, r0, 0 , 1
            sbyt        B0, 0
            ccbit       122, 2, 6
            adbyt       0, 0, 3, 3, 0
            setcpl      14, 3, 88, 95
            setcpl      15, 0, 220, 223
            setcpl      15, 3, 0, 1
            incptr      1, 144
LABEL_MULTI_READ_NO_CACHE_SEC_PL_FOUR4K_1ST_RETI:         
            reti        7, 0, 8, LABEL_MULTI_READ_NO_CACHE_SEC_PL_FOUR4K_1ST_RETI   
            
#####match second and third command is multi-plane read , or match second cmd is single-plane read, or second cmd is 4k read #####
            jnz.nfc     LABEL_PAGE_READ_FIRST_SET_R11, r14
            setb        r11, 0
            jnz.fc      LABEL_MULTI_READ_NO_CACHE_CHK_CMD_LVL
LABEL_PAGE_READ_FIRST_SET_R11:
            setb        r11, 1
LABEL_MULTI_READ_NO_CACHE_CHK_CMD_LVL:
            gclvl       r0, 2  
            jnz         LABEL_MULTI_READ_NO_CACHE_CHK_OP, r0, 0
            gclvl       r0, 1
            jnz         LABEL_MULTI_READ_NO_CACHE_CHK_4K_OP, r0, 0
            jnz         LABEL_MULTI_READ_NO_CACHE_CHK258, r0, 1

LABEL_MULTI_READ_NO_CACHE_CHK_OP:
            matop       r9, C_16K_READ_DDR, 1, 1                        ## match tlc page read op
            jnz         LABEL_MULTI_READ_NO_CACHE_TLC_CHK_CTRL, r9, 0
            matop       r9, C_16K_SLC_READ_DDR, 1, 1                    ## match slc page read op
            jnz         LABEL_MULTI_READ_NO_CACHE_SLC_CHK_CTRL, r9, 0
LABEL_MULTI_READ_NO_CACHE_CHK_4K_OP:
            matop       r0, C_READ_DDR, 1, 1      
            jnz         LABEL_MULTI_READ_NO_CACHE_CHA_4K_READ_TLC_PRE, r0, 0    ## match tlc 4k read, then jump to 4k read branch              NEED to mark r14 to differentiate tlc or slc
            matop       r0, C_READ_SLC, 1, 1                            ## match slc 4k read, then jump to 4k read branch
            jnz         LABEL_MULTI_READ_NO_CACHE_CHA_4K_READ_SLC_PRE, r0, 0    
            jnz         LABEL_MULTI_READ_NO_CACHE_CHK_NO_MAT_OP, r0, 1
LABEL_MULTI_READ_NO_CACHE_TLC_CHK_CTRL:
            setb        r14, 1                                          ## r14=1 mark tlc 
            jnz.fc      LABEL_MULTI_READ_NO_CACHE_CHK_CTRL_MP
LABEL_MULTI_READ_NO_CACHE_SLC_CHK_CTRL:
            setb        r14, 0                                          ## r14=0 mark slc 
LABEL_MULTI_READ_NO_CACHE_CHK_CTRL_MP:
            matcl       r9, C_MP_FOR2, 252, 0, 0
            jnz         LABEL_MULTI_READ_MATCH_MULTI_PLANE, r9, 0       ## jump to multi-plane page read
            jnz.fc      LABEL_SINGLE_PAGE_READ_MATCH_SINGLE_PLANE       ## jump to single plane page read
LABEL_MULTI_READ_NO_CACHE_CHK_NO_MAT_OP:
            offst       0, 0
            jnz.fc      LABEL_MULTI_READ_NO_CACHE_CHK258
 
 
LABEL_MULTI_READ_NO_CACHE_CHK258:
            cklvl       r0, 1, 256
            jne         LABEL_MULTI_READ_NO_CACHE_CHK258, r0, 0 , 1
    
            setcpl      14, 3, 88, 95          
            setcpl      15, 1, 220, 223
            setcpl      15, 3, 0, 1
            setcpl      15, 15, 39, 42
            setcpl      15, 3, 253, 254
            setcpl      13, 0, 68, 83
            incptr      1, 144
LABEL_MULTI_READ_NO_CACHE_FOUR4K_2ST_RETI_AG:            
            reti        7, 0, 0, LABEL_MULTI_READ_NO_CACHE_FOUR4K_2ST_RETI_AG 

            incptr      0, 0
            jnz.nfc     LABEL_MULTI_READ_NO_CACHE_END, r14
            sbyt.gr     B0, 223             ## 223d=DFh
            setpr.gr    B0, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_STK_NYLD_NDS, LABEL_0            
LABEL_MULTI_READ_NO_CACHE_END:
            sets        0, 5, 0
            end

####################################################add multi-plane page read change to 4k read branch  ########
LABEL_MULTI_READ_NO_CACHE_CHA_4K_READ_TLC_PRE:
            setb        r14, 1                                          ## r14=1 mark tlc 
            gclvl       r0, 2  
            jnz         LABEL_MULTI_READ_NO_CACHE_TLC_4K_OP_CHK, r0, 0
            jnz.fc      LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ
 
LABEL_MULTI_READ_NO_CACHE_TLC_4K_OP_CHK:
            matcl       r0, C_MP_DIS, 252, 1, 1                           ## match 4k read is single plane?
            jnz.nfc     LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ, r0  ## jump to page read following single 4k read
                                                                          ## else continue to check

            matop       r0, C_READ_DDR, 2, 1      
            jnz.nfc     LABEL_MULTI_READ_NO_CACHE_SLC_TLC_MUL_4K_PB_CHK, r0
            jnz.fc      LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ

LABEL_MULTI_READ_NO_CACHE_CHA_4K_READ_SLC_PRE:
            setb        r14, 0                                          ## r14=0 mark slc 
            gclvl       r0, 2  
            jnz         LABEL_MULTI_READ_NO_CACHE_SLC_4K_OP_CHK, r0, 0
            jnz.fc      LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ

LABEL_MULTI_READ_NO_CACHE_SLC_4K_OP_CHK:
            matcl       r0, C_MP_DIS, 252, 1, 1                           ## match 4k read is single plane?
            jnz.nfc     LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ, r0  ## jump to page read following single 4k read
                                                                          ## else continue to check

            matop       r0, C_READ_SLC, 2, 1      
            jnz.nfc     LABEL_MULTI_READ_NO_CACHE_SLC_TLC_MUL_4K_PB_CHK, r0
##            jnz.fc      LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ


LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ:
            offst.im    1
            jnz.nfc     LABEL_MULTI_READ_TO_4K_TLC_WK_COMMON, r14    ## jump to tlc 
            jnz.nfc     LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ_NEXT_IS_SLC, r11
            jnz.fc      LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ_NEXT_IS_TLC
LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ_NEXT_IS_SLC:
            sbyt.gr     B0, 218             ## 218d=DAh
            setpr.gr    B0, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_NSTK_NYLD_NDS, LABEL_0
            jnz.fc      LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ_NEXT_IS_TLC
LABEL_MULTI_READ_TO_4K_TLC_WK_COMMON:
            jnz.nfc     LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ_NEXT_IS_TLC, r11
            sbyt.gr     B0, 223             ## 223d=DFh
            setpr.gr    B0, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_STK_NYLD_NDS, LABEL_0
LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ_NEXT_IS_TLC:
            setp        SETP_ID_ALL, 0, 0
LABEL_MULTI_READ_TO_4K_SLC_TLC_WK:
            sbyt        B0, 48
            setpr.gr    B0, 48, 55                                         ## set last cmd 30H
            setb        r13, 1                                              ## set GR[13] to 1 mark single read
            wk          I_CL_SLC_TLC_READ_COMMON, C_WK_CTRL_8, LABEL_MULTI_READ_TO_4K_SLC_TLC_WK 
 
LABEL_MULTI_READ_NO_CACHE_CHA_4K_READ_SETCPL_FOURTH:
            offst       0, 0                                     ## reti page read cpl, store current cmd lun info, then jump to 4k yield
            setcpl      14, 3, 88, 95          
            setcpl      15, 1, 220, 223
            setcpl      15, 3, 0, 1
            setcpl      15, 15, 39, 42
            setcpl      15, 3, 253, 254
            setcpl      13, 0, 68, 83
            incptr      1, 144
LABEL_MULTI_READ_NO_CACHE_CHA_4K_READ_RETI_FOURTH:            
            reti        7, 0, 0, LABEL_MULTI_READ_NO_CACHE_CHA_4K_READ_RETI_FOURTH 
            tmrst
            incptr      0, 0
            ccbit       24, 0, 0
            jnz         LABEL_MULTI_READ_NO_CACHE_CHA_4K_READ_F2_IN_GRB0, r0, 0
            sbyt        B2, 241
            jnz         LABEL_SYNC_TLC_READBACK_YIELD, r0, 1                           ## jump to 4k read yield
LABEL_MULTI_READ_NO_CACHE_CHA_4K_READ_F2_IN_GRB0:
            sbyt        B2, 242
            jnz         LABEL_SYNC_TLC_READBACK_YIELD, r0, 1                           ## jump to 4k read yield

##################################################################
LABEL_MULTI_READ_NO_CACHE_SLC_TLC_MUL_4K_PB_CHK:
            offst       1, 0                                        ##first entry auto multi-4k read
            cpphy.ofst  1
`ifdef  INDEPENDENT_MULTI
            ckphy.ofst  r0, 2, 13, 0                                          ## check plane address equal?
            jnz.nfc     LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ, r0      ## jump to single 4k read
`endif

`ifdef  NON_INDEPENDENT_MULTI
            ckphy.ofsti r0, 2, 12, 2                                         ## check plane address non-equal and page address equal, and invert result?
            jnz.nfc     LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ, r0     ## jump to single 4k read
`endif

            matcl       r0, C_MP_AUTO, 252, 1, SET_OFFSET_DIRECT    ## else to match auto mp enable?
            jnz.nfc     LABEL_MULTI_READ_NO_CACHE_AUTO_MULTI_4K_READ_ENTRY, r0
            jnz.fc      LABEL_MULTI_READ_NO_CACHE_CHA_4K_SINGLE_READ

#### The first two cmd match multi-plane 4k read 
LABEL_MULTI_READ_NO_CACHE_AUTO_MULTI_4K_READ_ENTRY:
##            offst.im    0                                                       ## use matcl offset value
            jnz.nfc     LABEL_MULTI_PAGE_AUTO_MULTI_4K_READ_TLC_WK_COMMON, r14    ## jump to tlc 
            jnz.nfc     LABEL_MULTI_READ_NO_CACHE_AUTO_MULTI_4K_READ_NEXT_IS_SLC, r11
            jnz.fc      LABEL_MULTI_READ_NO_CACHE_AUTO_MULTI_4K_READ_NEXT_IS_TLC
LABEL_MULTI_READ_NO_CACHE_AUTO_MULTI_4K_READ_NEXT_IS_SLC:
            sbyt.gr     B0, 218             ## 218d=DAh
            setpr.gr    B0, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_NSTK_NYLD_NDS, LABEL_0
            jnz.fc      LABEL_MULTI_READ_NO_CACHE_AUTO_MULTI_4K_READ_NEXT_IS_TLC
LABEL_MULTI_PAGE_AUTO_MULTI_4K_READ_TLC_WK_COMMON:
            jnz.nfc     LABEL_MULTI_READ_NO_CACHE_AUTO_MULTI_4K_READ_NEXT_IS_TLC, r11
            sbyt.gr     B0, 223             ## 223d=DFh
            setpr.gr    B0, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_STK_NYLD_NDS, LABEL_0
LABEL_MULTI_READ_NO_CACHE_AUTO_MULTI_4K_READ_NEXT_IS_TLC:
            setp        SETP_ID_ALL, 0, 0
            sbyt        B0, 50
            setpr.gr    B0, 48, 55                                         ## set last cmd 32H
            wk          I_CL_SLC_TLC_READ_COMMON, C_WK_CTRL_8, LABEL_MULTI_PAGE_AUTO_MULTI_4K_READ_TLC_WK_COMMON 
            setb        r13, 0                                          ## r13=0 mark multi-plane 4k read 
            

            offst       0, 0                                     ## reti page read cpl, store current cmd lun info, then jump to 4k yield
            setcpl      14, 3, 88, 95          
            setcpl      15, 1, 220, 223
            setcpl      15, 3, 0, 1
            setcpl      15, 15, 39, 42
            setcpl      15, 3, 253, 254
            setcpl      13, 0, 68, 83
            incptr      1, 144
LABEL_MULTI_READ_NO_CACHE_BTW_4K_MUL_RETI_FOURTH:            
            reti        7, 0, 0, LABEL_MULTI_READ_NO_CACHE_BTW_4K_MUL_RETI_FOURTH 
##            tmrst
            incptr      0, 0
#############################################################################
LABEL_MULTI_PAGE_FOW_AUTO_MULTI_4K_READ_SECOND_MULTI_PLANE:
            offst.im    1
LABEL_MULTI_PAGE_FOW_AUTO_MULTI_4K_READ_SEC_TLC_WK_COMMON:
           
`ifdef MODE8
            nop
            nop
            nop
            nop
`endif
            setp        SETP_ID_ALL, 0, 0
            sbyt        B0, 48
            setpr.gr    B0, 48, 55                                         ## set last cmd 30H
            
            wk          I_CL_SLC_TLC_READ_COMMON, C_WK_CTRL_8, LABEL_MULTI_PAGE_FOW_AUTO_MULTI_4K_READ_SEC_TLC_WK_COMMON
LABEL_MULTI_PAGE_FOW_AUTO_MULTI_4K_READ_SEC_SLC_TLC_TMRST: 
            tmrst
 
            nop
            nop
            nop
            jnz.fc      LABEL_SYNC_TLC_READBACK_YIELD

 ####################################################end multi-plane page read change to 4k read branch  ########
 
#### next cmd is multi-plane page read entry
LABEL_MULTI_READ_MATCH_MULTI_PLANE:
            setb        r12, 0                                          ## r12=0 mark multi-plane page read 
            offst.im    1
            jnz.nfc     LABEL_MULTI_READ_TO_MULTI_TLC_WK_COMMON, r14    ## jump to tlc 
            jnz.nfc     LABEL_MULTI_READ_MATCH_MULTI_PLANE_NEXT_IS_SLC, r11
            jnz.fc      LABEL_MULTI_READ_MATCH_MULTI_PLANE_NEXT_IS_TLC
LABEL_MULTI_READ_MATCH_MULTI_PLANE_NEXT_IS_SLC:
            sbyt.gr     B0, 218             ## 218d=DAh
            setpr.gr    B0, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_NSTK_NYLD_NDS, LABEL_0
            jnz.fc      LABEL_MULTI_READ_MATCH_MULTI_PLANE_NEXT_IS_TLC
LABEL_MULTI_READ_TO_MULTI_TLC_WK_COMMON:
            jnz.nfc     LABEL_MULTI_READ_MATCH_MULTI_PLANE_NEXT_IS_TLC, r11
            sbyt.gr     B0, 223             ## 223d=DFh
            setpr.gr    B0, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_STK_NYLD_NDS, LABEL_0
LABEL_MULTI_READ_MATCH_MULTI_PLANE_NEXT_IS_TLC:
            setp        SETP_ID_ALL, 0, 0
LABEL_MULTI_READ_TO_MULTI_SLC_TLC_WK:
            sbyt        B0, 50
            setpr.gr    B0, 48, 55                                         ## set last cmd 32H
            wk          I_CL_SLC_TLC_READ_COMMON, C_WK_CTRL_8, LABEL_MULTI_READ_TO_MULTI_SLC_TLC_WK 
####################################################################################

LABEL_MULTI_READ_MUL_LOOP:
            offst       0, 0
   
            setcpl      14, 3, 88, 95          
            setcpl      15, 1, 220, 223
            setcpl      15, 3, 0, 1
            setcpl      15, 15, 39, 42
            setcpl      15, 3, 253, 254
            setcpl      13, 0, 68, 83
            incptr      1, 144
LABEL_MULTI_READ_PL1_FORTH4K_RETI_UN_0032:            
            reti        7, 0, 0, LABEL_MULTI_READ_PL1_FORTH4K_RETI_UN_0032 

LABEL_MULTI_READ_PL0_DUMMY_RETI:
            setcpl      15, 7, 85, 87
            setcpl      15, 0, 36, 37
            reti        0, 0, 0, LABEL_MULTI_READ_PL0_DUMMY_RETI
            incptr      0, 0
            jnz.fc      LABEL_MULTI_READ_SECOND_MULTI_PLANE
#############################################################################
LABEL_SINGLE_PAGE_READ_MATCH_SINGLE_PLANE:
            setb        r12, 1                                          ## r12=1 mark single page read 
            jnz.nfc     LABEL_MULTI_READ_TO_MULTI_SEC_OR_SINGLE_TLC_WK_COMMON, r14    ## jump to tlc 
            jnz.nfc     LABEL_SINGLE_PAGE_READ_MATCH_SINGLE_PLANE_NEXT_IS_SLC, r11
            jnz.fc      LABEL_MULTI_READ_SECOND_MULTI_PLANE
LABEL_SINGLE_PAGE_READ_MATCH_SINGLE_PLANE_NEXT_IS_SLC:
            sbyt.gr     B0, 218             ## 218d=DAh
            setpr.gr    B0, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_NSTK_NYLD_NDS, LABEL_0
            jnz.fc      LABEL_MULTI_READ_SECOND_MULTI_PLANE
LABEL_MULTI_READ_TO_MULTI_SEC_OR_SINGLE_TLC_WK_COMMON:   
            jnz.nfc     LABEL_MULTI_READ_SECOND_MULTI_PLANE, r11
            sbyt.gr     B0, 223             ## 223d=DFh
            setpr.gr    B0, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_STK_NYLD_NDS, LABEL_0
LABEL_MULTI_READ_SECOND_MULTI_PLANE:
            offst.im    1        

            setp        SETP_ID_ALL, 0, 0
LABEL_MULTI_READ_TO_MULTI_SEC_OR_SINGLE_SLC_TLC_WK:
            sbyt        B0, 48
            setpr.gr    B0, 48, 55                                         ## set last cmd 30H

LABEL_MULTI_READ_TO_MULTI_SEC_OR_SINGLE_ONLY_TLC_WK:
            wk          I_CL_SLC_TLC_READ_COMMON, C_WK_CTRL_8, LABEL_MULTI_READ_TO_MULTI_SEC_OR_SINGLE_SLC_TLC_WK 
LABEL_POWER_LOSS_SIN_OR_MULTI_PAGE_END_ENTRY:
            jnz.nfc     LABEL_SINGLE_READ_FORTH4K_RETI_UN_0030, r12
            jnz.fc      LABEL_MULTI_READ_GOTO_YIELD
LABEL_SINGLE_READ_FORTH4K_RETI_UN_0030:
            offst       0, 0                                           ## for single read the current cpl return
            setcpl      14, 3, 88, 95          
            setcpl      15, 1, 220, 223
            setcpl      15, 3, 0, 1
            setcpl      15, 15, 39, 42
            setcpl      15, 3, 253, 254
            setcpl      13, 0, 68, 83
            incptr      1, 144
LABEL_MULTI_READ_PL1_FORTH4K_RETI_UN_0030:            
            reti        7, 0, 0, LABEL_MULTI_READ_PL1_FORTH4K_RETI_UN_0030
            incptr      0, 0 
LABEL_MULTI_READ_GOTO_YIELD:
            tmrst
            jnz.nfc     LABEL_SINGLE_PAGE_READ_YIELD, r12
            nop
            nop                                                              ## two nop add for mp read early yield issue
            jnz.fc      LABEL_MUL_PLANE_PAGE_READ_YIELD                      ## same lun continue to read, no need to set lun info


####################################multi-plane no cache read end   ###########################################################################
###############################################################################################################################################

###############################################################################################################################################
####################################multi-plane cache read begin   ############################################################################


############match second command is single read cache read######################
LABEL_READ_SIG_CACHE_MAT:
            gclvl       r0, 1
            jnz         LABEL_READ_SIG_CACHE_CHK_OP, r0, 0
            jnz         LABEL_READ_NOR_BEGIN, r0, 1
LABEL_READ_SIG_CACHE_CHK_OP:
            jnz.nfc     LABEL_CACHE_READ_SINGLE_TLC_OP_CHK, r14
            matop       r10, C_16K_SLC_READ_DDR, 1, 1      
            jnz         LABEL_READ_CACHE_PAGE_FIR_TR, r10, 0
            jnz.fc      LABEL_CACHE_SINGLE_OP_CHK_FAIL
LABEL_CACHE_READ_SINGLE_TLC_OP_CHK:
            matop       r10, C_16K_READ_DDR, 1, 1      
            jnz         LABEL_READ_CACHE_PAGE_FIR_TR, r10, 0
LABEL_CACHE_SINGLE_OP_CHK_FAIL:
            offst       0, 0
            jnz         LABEL_READ_NOR_BEGIN, r0, 1
            
############match third and forth command is multi-plane cache read######################
LABEL_READ_MUL_CACHE_MAT:
            gclvl       r0, 3  
            jnz         LABEL_READ_MUL_CACHE_CHK_OP, r0, 0
            jnz         LABEL_READ_NOR_BEGIN, r0, 1
LABEL_READ_MUL_CACHE_CHK_OP:
            jnz.nfc     LABEL_CACHE_READ_MUL_TLC_OP_CHK, r14
            matop       r9, C_16K_SLC_READ_DDR, 2, 1      
            jnz         LABEL_READ_MUL_CACHE_CHK_MUL, r9, 0
            jnz.fc      LABEL_CACHE_MUL_OP_CHK_FAIL
LABEL_CACHE_READ_MUL_TLC_OP_CHK:
            matop       r9, C_16K_READ_DDR, 2, 1      
            jnz         LABEL_READ_MUL_CACHE_CHK_MUL, r9, 0
LABEL_CACHE_MUL_OP_CHK_FAIL:
            jnz         LABEL_READ_MUL_CACHE_NO_MAT, r9, 1
LABEL_READ_MUL_CACHE_CHK_MUL:
            setb        r10, 0
            matcl       r9, C_MP_FOR2, 252, 0, 0
            jnz         LABEL_READ_CACHE_PAGE_FIR_TR, r9, 0
LABEL_READ_MUL_CACHE_NO_MAT:
            offst       0, 0
            jnz         LABEL_READ_NOR_BEGIN, r0, 1


##############################LABEL_READ_SIG_CACHE/LABEL_READ_MUL_CACHE###########################################################
#####r8 =0 -> single read,                       r8 =1 -> multi read
#####r9 =0 -> multi-read + no cached following,  r9 =1 -> multi-read + multi-read cached
#####r10=0 -> single read + no cached,           r10=1 -> single read+ single cached read


LABEL_READ_CACHE_FETCH_NEXT_CMD:
           offst        3, 0
           jnz          LABEL_READ_CACHE_MATCH_PAGE_FUNC, r0, 1

LABEL_READ_CACHE_PAGE_FIR_TR:
            yield
            setp        SETP_ID_ALL, 0, 0
            wk          I_CL_SYNC_RS_70H, C_WK_CTRL_5, LABEL_READ_CACHE_PAGE_FIR_TR
##            setpr       0, r2, 40, 47
##            wk          I_CL_F1_F2_RS, C_WK_CTRL_1, LABEL_READ_CACHE_PAGE_FIR_TR                    ## change to stack rs and delete 4 nop for cache read debug
#            nop
#            nop
#            nop
#            nop
            stacp       r0, 1, 6
            jnz         LABEL_READ_CACHE_PAGE_FIR_TR, r0, 0 

LABEL_READ_SIG_MUL_CACHE_ENTRY:
            ## v1 hold original value, clear v0 to 0
            sar         0, 0
            jnz         LABEL_SET_SIG_OFFSET_1, r10, 0
LABEL_SET_MUL_OFFSET_2:
           offst        2, 0
           jnz          LABEL_READ_CACHE_MATCH_PAGE_FUNC, r0, 1
LABEL_SET_SIG_OFFSET_1:
            offst       1, 0

LABEL_READ_CACHE_MATCH_PAGE_FUNC:
##            offst.im    0
LABEL_SYNC_CACHE_TLC_WK_COMMON:
           
###################################################################################################
            adar        0, 1
            setp        SETP_ID_ALL, 0, 0
            jne         LABEL_READ_CACHE_PAGE_MSB_PL0, 2, 1, 0
            jne         LABEL_READ_CACHE_PAGE_MSB_CACHE, 0, 1, 1

LABEL_READ_CACHE_PAGE_MSB_CACHE_WK_CAH_SINGLE:
            sbyt        B0, 49
            setpr.gr    B0, 48, 55                                         ## set last cmd 31H
            wk          I_CL_SLC_TLC_READ_COMMON, C_WK_CTRL_8, LABEL_READ_CACHE_PAGE_MSB_CACHE_WK_CAH_SINGLE
            tmrst
            jnz         LABEL_READ_CAH_FIR_SINGLE_BEGIN, r0, 1

LABEL_READ_CACHE_PAGE_MSB_CACHE:
#            setpr       0, r2, 40, 47
#            wk          I_CL_F1_F2_RS, C_WK_CTRL_9, LABEL_READ_CACHE_PAGE_MSB_CACHE
            nop
            nop
            nop
            nop
            nop
            nop
            nop                                                     ## add a nop for 440MT
`ifdef MODE8
            nop
            nop
            nop
`endif
#            stacp       r0, 1, 6
 #           jnz         LABEL_READ_CACHE_PAGE_MSB_CACHE, r0, 0
LABEL_READ_CACHE_PAGE_MSB_CACHE_WK_CAH:
            sbyt        B0, 49
            setpr.gr    B0, 48, 55                                         ## set last cmd 31H
            
LABEL_READ_CACHE_PAGE_MSB_CACHE_TLC_WK_CAH:
            wk          I_CL_SLC_TLC_READ_COMMON, C_WK_CTRL_8, LABEL_READ_CACHE_PAGE_MSB_CACHE_WK_CAH
            tmrst
            jnz         LABEL_READ_CAH_FIR_MUL_BEGIN, r0, 1
############

LABEL_READ_CACHE_PAGE_MSB_PL0:
            sbyt        B0, 50
            setpr.gr    B0, 48, 55                                         ## set last cmd 32H
            wk          I_CL_SLC_TLC_READ_COMMON, C_WK_CTRL_8, LABEL_READ_CACHE_PAGE_MSB_PL0  
            tmrst
            jnz         LABEL_READ_CACHE_FETCH_NEXT_CMD, r0, 1  
###################################################################################################
###################################################################################################
LABEL_READ_CACHE_LAST_BEGIN:
            jnz.nfc     LABEL_READ_CACHE_LAST_TLC_3F_ISSUE, r14    ## jump to tlc 
            wk          I_CL_SLC_READ_3F, C_WK_CTRL_8, LABEL_0                        
            jnz.fc      LABEL_READ_NOR_BEGIN_YIELD
LABEL_READ_CACHE_LAST_TLC_3F_ISSUE:
            wk          I_CL_READ_3F, C_WK_CTRL_8, LABEL_0

LABEL_READ_NOR_BEGIN_YIELD:
            yield       
LABEL_READ_NOR_BEGIN:
            offst       0, 0
            setp        SETP_ID_ALL, 0, 0
            wk          I_CL_SYNC_RS_70H, C_WK_CTRL_5, LABEL_READ_NOR_BEGIN
##            setpr       0, r2, 40, 47
##            wk          I_CL_F1_F2_RS, C_WK_CTRL_D, LABEL_READ_NOR_BEGIN
            cklvl       r0, 1, level_empty
            jnz         LABEL_READ_NOR_BEGIN_YIELD, r0, 0

            stacp       r0, 1, 6
            jnz         LABEL_READ_NOR_BEGIN_YIELD, r0, 0
            calre       0, LABEL_READ_NOR_FUNC_BEGIN
LABEL_DUMMY_CPL_RETI_2:
            setcpl      15, 7, 85, 87
            setcpl      15, 0, 36, 37
            reti        0, 0, 0, LABEL_DUMMY_CPL_RETI_2
            incptr      0, 0
#### v1 != 1 then jump to multi-plane read
            jne         LABEL_READ_NOR_MUL_BEGIN, 1, 1, 1
            jnz.nfc     LABEL_TLC_CACHE_SING_END, r14
            sbyt.gr     B0, 223             ## 223d=DFh
            setpr.gr    B0, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_STK_NYLD_NDS, LABEL_0            
LABEL_TLC_CACHE_SING_END:
            sets        0, 5, 0	
            end
LABEL_READ_NOR_MUL_BEGIN:
            setp        SETP_ID_ALL, 0, 0
LABEL_READ_NOR_FIRST_16K_BUF_EMPTY:
            cklvl       r0, 1, level_empty
            jnz         LABEL_READ_NOR_FIRST_16K_BUF_EMPTY, r0, 0
            calre       0, LABEL_READ_NOR_FUNC_BEGIN
            incptr      0, 0
            jnz.nfc     LABEL_TLC_CACHE_MUL_END, r14
            sbyt.gr     B0, 223             ## 223d=DFh
            setpr.gr    B0, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, C_WK_CTRL_STK_NYLD_NDS, LABEL_0            
LABEL_TLC_CACHE_MUL_END:
            sets        0, 5, 0
            end


####################################cache read following normal read dataout#####################################################

LABEL_READ_NOR_FUNC_BEGIN:
            wk          I_CL_READ_P1, C_WK_CTRL_A, LABEL_0

###call a common three 4k function
            calre       0, LABLE_PAGE_READ_THREE_4K_CONTROL_FUNC

LABEL_CACHE_PAGE_READBACK_FOUR4K_CPL_CHK_READY_YIELD:
            cklvl       r0, 1, 238
            jne         LABEL_CACHE_PAGE_READBACK_FOUR4K_CPL_CHK_READY_YIELD, r0, 0 , 1
            sbyt        B0, 0
            ccbit       122, 2, 6
            adbyt       0, 0, 3, 3, 0
            setcpl      14, 3, 88, 95
            setcpl      15, 0, 220, 223
            setcpl      15, 3, 0, 1
            incptr      1, 144
LABEL_CACHE_PAGE_READBACK_FOUR4K_RETURN_2K:         
            reti        7, 0, 8, LABEL_CACHE_PAGE_READBACK_FOUR4K_RETURN_2K   
            setcpl      14, 3, 88, 95          
            setcpl      15, 1, 220, 223
            setcpl      15, 3, 0, 1
            setcpl      15, 15, 39, 42
            setcpl      15, 3, 253, 254
            setcpl      13, 0, 68, 83
##            setcpl      15, 1, 63, 63                 ## cache page read the forth cpl set cache flag
            incptr      1, 144
LABEL_CACHE_PAGE_READBACK_FOUR4K_RETURN_START:            
            reti        7, 8, 0, LABEL_CACHE_PAGE_READBACK_FOUR4K_RETURN_START 


            calre       1, LABEL_0

####################################################################################


LABEL_READ_CACHE_MUL_LOOP:
            offst       0, 0
    

            setcpl      14, 3, 88, 95          
            setcpl      15, 1, 220, 223
            setcpl      15, 3, 0, 1
            setcpl      15, 15, 39, 42
            setcpl      15, 3, 253, 254
            setcpl      13, 0, 68, 83
##            setcpl      15, 1, 63, 63                 ## cache page read the forth cpl set cache flag
            incptr      1, 144
LABEL_CACHE_PAGE_READBACK_FOUR4K_MUL_UND_0030:            
            reti        7, 8, 0, LABEL_CACHE_PAGE_READBACK_FOUR4K_MUL_UND_0030 
LABEL_DUMMY_CPL_RETI_MUL_UND_0030:
            setcpl      15, 7, 85, 87
            setcpl      15, 0, 36, 37
            reti        0, 0, 0, LABEL_DUMMY_CPL_RETI_MUL_UND_0030
            incptr      0, 0

LABEL_READ_CACHE_PAGE_WAIT_MUL_CMD:
            gclvl       r0, 3  
            not         r0
            jnz         LABEL_READ_CACHE_PAGE_WAIT_MUL_CMD, r0, 0

 
            offst.im    3

LABEL_READ_CACHE_PAGE_TLC_MUL_LOOP:
            
            setp        SETP_ID_ALL, 0, 0
            sbyt        B0, 49
            setpr.gr    B0, 48, 55                                         ## set last cmd 31H
LABEL_READ_CACHE_PAGE_MSB_CACHE_WK_CAH_MUL:
            
            wk          I_CL_SLC_TLC_READ_COMMON, C_WK_CTRL_8, LABEL_READ_CACHE_PAGE_MSB_CACHE_WK_CAH_MUL
            tmrst
            jnz.fc      LABEL_READ_CAH_FIR_MUL_BEGIN
 
 
###################################################################################################


LABEL_READ_CAH_FIR_MUL_BEGIN_YIELD:
            yield
LABEL_READ_CAH_FIR_MUL_BEGIN:
            offst       0, 0
            setp        SETP_ID_ALL, 0, 0
            wk          I_CL_SYNC_RS_70H, C_WK_CTRL_5, LABEL_READ_CAH_FIR_MUL_BEGIN
##            setpr       0, r2, 40, 47
##            wk          I_CL_F1_F2_RS, C_WK_CTRL_D, LABEL_READ_CAH_FIR_MUL_BEGIN
            cklvl       r0, 1, level_empty
            jnz         LABEL_READ_CAH_FIR_MUL_BEGIN_YIELD, r0, 0
            stacp       r0, 1, 6
            jnz         LABEL_READ_CAH_FIR_MUL_BEGIN_YIELD, r0, 0
            calre       0, LABEL_READ_NOR_FUNC_BEGIN 
LABEL_DUMMY_CPL_RETI_0:
            setcpl      15, 7, 85, 87
            setcpl      15, 0, 36, 37
            reti        0, 0, 0, LABEL_DUMMY_CPL_RETI_0
            incptr      0, 0
##            calre       0, LABEL_READ_NOR_FUNC_BEGIN_MUL
 
###########################################################
LABEL_READ_NOR_FUNC_BEGIN_MUL:
            offst       0, 0
            setp        SETP_ID_ALL, 0, 0
LABEL_READ_CAH_FIR_16K_BUF_EMPTY:
            cklvl       r0, 1, level_empty
            jnz         LABEL_READ_CAH_FIR_16K_BUF_EMPTY, r0, 0
            wk          I_CL_READ_P1, C_WK_CTRL_A, LABEL_0

###call a common three 4k function
            calre       0, LABLE_PAGE_READ_THREE_4K_CONTROL_FUNC
 
LABEL_CACHE_PAGE_READBACK_CPL_FOUR4K_MUL:
            cklvl       r0, 1, 196
            jne         LABEL_CACHE_PAGE_READBACK_CPL_FOUR4K_MUL, r0, 0 , 1
            sbyt        B0, 0
            ccbit       122, 2, 6
            adbyt       0, 0, 3, 3, 0
            setcpl      14, 3, 88, 95
            setcpl      15, 0, 220, 223
            setcpl      15, 3, 0, 1
            incptr      1, 144
LABEL_CACHE_PAGE_READBACK_FOUR4K_RETURN_2K_MUL:         
            reti        7, 0, 8, LABEL_CACHE_PAGE_READBACK_FOUR4K_RETURN_2K_MUL   
 
############match third and forth command is multi-plane cache read######################
LABEL_READ_CACHE_CONTI_MUL_CACHE_MAT:
            gclvl       r0, 3  
            jnz         LABEL_READ_CACHE_CONTI_MUL_CACHE_CHK_OP, r0, 0
            jnz         LABEL_CACHE_PAGE_READBACK_CPL_FOUR4K_MUL_CHK260, r0, 1
LABEL_READ_CACHE_CONTI_MUL_CACHE_CHK_OP:
            jnz.nfc     LABEL_READ_CACHE_CONTI_MUL_TLC_CHK_OP, r14
            matop       r9, C_16K_SLC_READ_DDR, 3, 1      
            jnz         LABEL_READ_CACHE_CONTI_MUL_CACHE_CHK_MUL, r9, 0
            jnz         LABEL_READ_CACHE_CONTI_MUL_CACHE_NO_MAT, r9, 1
LABEL_READ_CACHE_CONTI_MUL_TLC_CHK_OP:
            matop       r9, C_16K_READ_DDR, 3, 1      
            jnz         LABEL_READ_CACHE_CONTI_MUL_CACHE_CHK_MUL, r9, 0
            jnz         LABEL_READ_CACHE_CONTI_MUL_CACHE_NO_MAT, r9, 1
LABEL_READ_CACHE_CONTI_MUL_CACHE_CHK_MUL:
            matcl       r9, C_MP_FOR2, 252, 0, 0
            jnz         LABEL_READ_CACHE_MATCH_PAGE_FUNC_MUL, r9, 0
LABEL_READ_CACHE_CONTI_MUL_CACHE_NO_MAT:
            offst       0, 0
            
LABEL_CACHE_PAGE_READBACK_CPL_FOUR4K_MUL_CHK260:
            cklvl       r0, 1, 256
            jne         LABEL_CACHE_PAGE_READBACK_CPL_FOUR4K_MUL_CHK260, r0, 0 , 1
 
 
            setcpl      14, 3, 88, 95          
            setcpl      15, 1, 220, 223
            setcpl      15, 3, 0, 1
            setcpl      15, 15, 39, 42
            setcpl      15, 3, 253, 254
            setcpl      13, 0, 68, 83
##            setcpl      15, 1, 63, 63                 ## cache page read the forth cpl set cache flag
            incptr      1, 144
LABEL_CACHE_PAGE_READBACK_FOUR4K_RETURN_START_MUL:            
            reti        7, 8, 0, LABEL_CACHE_PAGE_READBACK_FOUR4K_RETURN_START_MUL 
    
LABEL_DUMMY_CPL_RETI_1:
            setcpl      15, 7, 85, 87
            setcpl      15, 0, 36, 37
            reti        0, 0, 0, LABEL_DUMMY_CPL_RETI_1

            incptr      0, 0
            jnz         LABEL_READ_CACHE_LAST_BEGIN, r0, 1  

LABEL_READ_CACHE_MATCH_PAGE_FUNC_MUL:
            offst.im    3
LABEL_READ_CACHE_MATCH_PAGE_FUNC_MUL_TLC_WK_COMMON:
           
            sbyt        B0, 50
            setpr.gr    B0, 48, 55                                         ## set last cmd 32H

            setp        SETP_ID_ALL, 0, 0
LABEL_READ_CACHE_PAGE_MSB_MUL:
            wk          I_CL_SLC_TLC_READ_COMMON, C_WK_CTRL_8, LABEL_READ_CACHE_PAGE_MSB_MUL  
#            tmrst
            jnz         LABEL_READ_CACHE_MUL_LOOP, r0, 1  

 
 
#######################################################################################
LABEL_CACHE_PAGE_READBACK_FOUR4K_RECPL_UND_0030:
            offst       0, 0
            setcpl      14, 3, 88, 95          
            setcpl      15, 1, 220, 223
            setcpl      15, 3, 0, 1
            setcpl      15, 15, 39, 42
            setcpl      15, 3, 253, 254
            setcpl      13, 0, 68, 83
##            setcpl      15, 1, 63, 63                 ## cache page read the forth cpl set cache flag
            incptr      1, 144
LABEL_CACHE_PAGE_READBACK_FOUR4K_RETURN_UND_0030:            
            reti        7, 8, 0, LABEL_CACHE_PAGE_READBACK_FOUR4K_RETURN_UND_0030 
            tmrst
LABEL_DUMMY_CPL_RETI_UND_0030:
            setcpl      15, 7, 85, 87
            setcpl      15, 0, 36, 37
            reti        0, 0, 0, LABEL_DUMMY_CPL_RETI_UND_0030
 
            incptr      0, 0
            jnz         LABEL_READ_CAH_FIR_SINGLE_BEGIN, r0, 1


 
LABEL_READ_CAH_FIR_SINGLE_BEGIN_YIELD:
            yield
LABEL_READ_CAH_FIR_SINGLE_BEGIN:
            offst       0, 0
            setp        SETP_ID_ALL, 0, 0
            wk          I_CL_SYNC_RS_70H, C_WK_CTRL_5, LABEL_READ_CAH_FIR_SINGLE_BEGIN
##            setpr       0, r2, 40, 47
##            wk          I_CL_F1_F2_RS, C_WK_CTRL_D, LABEL_READ_CAH_FIR_SINGLE_BEGIN
            cklvl       r0, 1, level_empty
            jnz         LABEL_READ_CAH_FIR_SINGLE_BEGIN_YIELD, r0, 0

            stacp       r0, 1, 6
            jnz         LABEL_READ_CAH_FIR_SINGLE_BEGIN_YIELD, r0, 0
            
###############################################################################################################	
            
            wk          I_CL_READ_P1, C_WK_CTRL_A, LABEL_0

###call a common three 4k function
            calre       0, LABLE_PAGE_READ_THREE_4K_CONTROL_FUNC
 
LABEL_CACHE_PAGE_READBACK_CPL_FOUR4K_SINGLE:
            cklvl       r0, 1, 196
            jne         LABEL_CACHE_PAGE_READBACK_CPL_FOUR4K_SINGLE, r0, 0 , 1
            sbyt        B0, 0
            ccbit       122, 2, 6
            adbyt       0, 0, 3, 3, 0
            setcpl      14, 3, 88, 95
            setcpl      15, 0, 220, 223
            setcpl      15, 3, 0, 1
            incptr      1, 144
LABEL_CACHE_PAGE_READBACK_FOUR4K_RETURN_2K_SINGLE:         
            reti        7, 0, 8, LABEL_CACHE_PAGE_READBACK_FOUR4K_RETURN_2K_SINGLE   

############match second command is single read cache read######################
LABEL_READ_CACHE_CONTI_SIG_CACHE_MAT:
            gclvl       r0, 2
            jnz         LABEL_READ_CACHE_CONTI_SIG_CACHE_CHK_OP, r0, 0
            jnz         LABEL_CACHE_PAGE_READBACK_CPL_FOUR4K_SINGLE_CHK260, r0, 1
LABEL_READ_CACHE_CONTI_SIG_CACHE_CHK_OP:
            jnz.nfc     LABEL_READ_CACHE_CONTI_TLC_CHK_OP, r14
            matop       r10, C_16K_SLC_READ_DDR, 2, 1      
            jnz         LABEL_READ_CACHE_MATCH_PAGE_FUNC_SINGLE, r10, 0
            jnz.fc      LABEL_READ_CACHE_CONTI_SLC_CHK_OP_END
LABEL_READ_CACHE_CONTI_TLC_CHK_OP:
            matop       r10, C_16K_READ_DDR, 2, 1      
            jnz         LABEL_READ_CACHE_MATCH_PAGE_FUNC_SINGLE, r10, 0
LABEL_READ_CACHE_CONTI_SLC_CHK_OP_END:
            offst       0, 0

LABEL_CACHE_PAGE_READBACK_CPL_FOUR4K_SINGLE_CHK260:
            cklvl       r0, 1, 254
            jne         LABEL_CACHE_PAGE_READBACK_CPL_FOUR4K_SINGLE_CHK260, r0, 0 , 1
            setcpl      14, 3, 88, 95          
            setcpl      15, 1, 220, 223
            setcpl      15, 3, 0, 1
            setcpl      15, 15, 39, 42
            setcpl      15, 3, 253, 254
            setcpl      13, 0, 68, 83
##            setcpl      15, 1, 63, 63                 ## cache page read the forth cpl set cache flag
            incptr      1, 144
LABEL_CACHE_PAGE_READBACK_FOUR4K_RETURN_START_SINGLE:            
            reti        7, 8, 0, LABEL_CACHE_PAGE_READBACK_FOUR4K_RETURN_START_SINGLE 
    
LABEL_DUMMY_CPL_RETI_UND_SINGLE_TRANS:
            setcpl      15, 7, 85, 87
            setcpl      15, 0, 36, 37
            reti        0, 0, 0, LABEL_DUMMY_CPL_RETI_UND_SINGLE_TRANS
 
            incptr      0, 0
            jnz         LABEL_READ_CACHE_LAST_BEGIN, r0, 1

LABEL_READ_CACHE_MATCH_PAGE_FUNC_SINGLE:
            offst.im    2

LABEL_READ_CACHE_MATCH_PAGE_FUNC_SINGLE_TLC_WK_COMMON:
            
            sbyt        B0, 49
            setpr.gr    B0, 48, 55                                         ## set last cmd 31H

            setp        SETP_ID_ALL, 0, 0

LABEL_READ_CACHE_PAGE_MSB_SINGLE:
            wk          I_CL_SLC_TLC_READ_COMMON, C_WK_CTRL_8, LABEL_READ_CACHE_PAGE_MSB_SINGLE
#            tmrst
            jnz         LABEL_CACHE_PAGE_READBACK_FOUR4K_RECPL_UND_0030, r0, 1

####################################multi-plane cache read end ################################################################################
###############################################################################################################################################

##########################################################################################
################################ page read three 4k control function######################
####can be call by tlc page read or slc page read

LABLE_PAGE_READ_THREE_4K_CONTROL_FUNC:

            cklvl       r0, 1, 250
            jne         LABLE_PAGE_READ_THREE_4K_CONTROL_FUNC, r0, 0 , 1
            setcpl      15, 0, 220, 223
            setcpl      15, 0, 0, 1
            incptr      1, 144
LABEL_PAGE_READ_1ST_RETI_FIRST_4K:         
            reti        7, 0, 8, LABEL_PAGE_READ_1ST_RETI_FIRST_4K                      
            setcpl      15, 1, 220, 223
            setcpl      15, 0, 0, 1
            setcpl      15, 15, 39, 42
            setcpl      15, 0, 253, 254
            setcpl      13, 0, 68, 83
            incptr      1, 144
LABEL_PAGE_READ_2ST_RETI_FIRST_4K:            
            reti        7, 0, 0, LABEL_PAGE_READ_2ST_RETI_FIRST_4K    
LABEL_PAGE_READ_CHK_FIRST_4K_BUF_EMPTY:
            cklvl       r0, 1, level_empty
            jnz         LABEL_PAGE_READ_CHK_FIRST_4K_BUF_EMPTY, r0, 0 
            wk          I_CL_4K_CONT_READ, C_WK_CTRL_A, LABEL_0   
 
LABEL_PAGE_READ_CHK_SECOND_4K_LEVEL:
            cklvl       r0, 1, 236
            jne         LABEL_PAGE_READ_CHK_SECOND_4K_LEVEL, r0, 0 , 1
            sbyt        B0, 0
            ccbit       122, 2, 6
            ccbit       88, 24, 31
            adbyt       0, 0, 3, 3, 0
            setcpl      14, 3, 88, 95
            setcpl      15, 0, 220, 223
            setcpl      15, 1, 0, 1
            incptr      1, 144
LABEL_PAGE_READ_1ST_RETI_SECOND_4K:         
            reti        7, 0, 8, LABEL_PAGE_READ_1ST_RETI_SECOND_4K 
            setcpl      14, 3, 88, 95          
            setcpl      15, 1, 220, 223
            setcpl      15, 1, 0, 1
            setcpl      15, 15, 39, 42
            setcpl      15, 1, 253, 254
            setcpl      13, 0, 68, 83
            incptr      1, 144
LABEL_PAGE_READ_2ST_RETI_SECOND_4K:            
            reti        7, 0, 0, LABEL_PAGE_READ_2ST_RETI_SECOND_4K
LABEL_PAGE_READ_CHK_SECOND_4K_BUF_EMPTY:
            cklvl       r0, 1, level_empty
            jnz         LABEL_PAGE_READ_CHK_SECOND_4K_BUF_EMPTY, r0, 0 
            wk          I_CL_4K_CONT_READ, C_WK_CTRL_A, LABEL_0     
              
LABEL_PAGE_READ_CHK_THIRD_4K_LEVEL:
            cklvl       r0, 1, 238
            jne         LABEL_PAGE_READ_CHK_THIRD_4K_LEVEL, r0, 0 , 1
            sbyt        B0, 0
            ccbit       122, 2, 6
            adbyt       0, 0, 3, 3, 0
            setcpl      14, 3, 88, 95
            setcpl      15, 0, 220, 223
            setcpl      15, 2, 0, 1
            incptr      1, 144
LABEL_PAGE_READ_1ST_RETI_THIRD_4K:         
            reti        7, 0, 8, LABEL_PAGE_READ_1ST_RETI_THIRD_4K 
            setcpl      14, 3, 88, 95          
            setcpl      15, 1, 220, 223
            setcpl      15, 2, 0, 1
            setcpl      15, 15, 39, 42
            setcpl      15, 2, 253, 254
            setcpl      13, 0, 68, 83
            incptr      1, 144
LABEL_PAGE_READ_2ST_RETI_THIRD_4K:            
            reti        7, 0, 0, LABEL_PAGE_READ_2ST_RETI_THIRD_4K
LABEL_PAGE_READ_CHK_THIRD_4K_BUF_EMPTY:
            cklvl       r0, 1, level_empty
            jnz         LABEL_PAGE_READ_CHK_THIRD_4K_BUF_EMPTY, r0, 0 
            wk          I_CL_4K_CONT_READ, C_WK_CTRL_A, LABEL_0 
            calre       1, LABEL_0


#########################################################################################



#########################################################################################


## Read-retry Entry
LABEL_RR_ENTRY:
            sets        0, 5, 1
            mlctl       0
LABEL_RR_SETF_BY_ADDR_MLIDL_CHK:
            mlidl       r0
            jnz.nfc     LABEL_RR_SETF_BY_ADDR_MLIDL_CHK_BUSY, r0
            jnz.fc      LABEL_RR_SETF_BY_ADDR_MLIDL_CHK_PASS
            LABEL_RR_SETF_BY_ADDR_MLIDL_CHK_BUSY:
                yield
                jnz.nfc     LABEL_RR_SETF_BY_ADDR_MLIDL_CHK, r0
            LABEL_RR_SETF_BY_ADDR_MLIDL_CHK_PASS:
            #sbyt.gr       R1, 0
            #modify from D5 to EF
            #setpr.lun   32, 39        ## copy lun to itfc_param byte 4
            matcl       r0, C_RR_DIRECT, 254, 0, SET_OFFSET_DIRECT
            jnz.nfc     LABEL_READ_RETRY_DIRECT, r0


##            setp        SETP_ID_ALL, 0, 0
##            ckrpb       r0, 0, 0
##        ## If get same PBA, directory call return for read
##            jnz         LABEL_TLC_READ_MATCH_PBA_RETURN, r0, 0
## LICHENG: check if RR direct or RR index
##             matcl       r0, 0, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX0, r0 
##             matcl       r0, 16, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX1, r0 
##             matcl       r0, 32, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX2, r0 
##             matcl       r0, 48, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX3, r0 
##             matcl       r0, 64, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX4, r0 
##             matcl       r0, 80, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX5, r0 
##             matcl       r0, 96, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX6, r0 
##             matcl       r0, 112, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX7, r0 
##             matcl       r0, 128, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX8, r0 
##             matcl       r0, 144, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX9, r0 
##             matcl       r0, 160, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX10, r0 
##             matcl       r0, 176, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX11, r0 
##             matcl       r0, 192, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX12, r0 
##             matcl       r0, 209, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX13, r0 
##             matcl       r0, 224, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX14, r0 
##             matcl       r0, 240, 15 , 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX15, r0 
## LABEL_READ_RETRY_INDEX0:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX0_CSB, r0
## LABEL_READ_RETRY_INDEX0_LSB_MSB:
##             sbyt        r0, 6 
##             sbyt        r1, 5 
##             sbyt        r2, 3 
##             sbyt        r3, 250               #FAh
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX0_CSB:
##             sbyt        r0, 5 
##             sbyt        r1, 3 
##             sbyt        r2, 0 
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX1:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX1_CSB, r0
## LABEL_READ_RETRY_INDEX1_LSB_MSB:
##             sbyt        r0, 7 
##             sbyt        r1, 2 
##             sbyt        r2, 4 
##             sbyt        r3, 246               #F6h
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX1_CSB:
##             sbyt        r0, 4 
##             sbyt        r1, 0 
##             sbyt        r2, 252               #FCh
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX2:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX2_CSB, r0
## LABEL_READ_RETRY_INDEX2_LSB_MSB:
##             sbyt        r0, 6 
##             sbyt        r1, 7 
##             sbyt        r2, 5 
##             sbyt        r3, 254               #FEh
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX2_CSB:
##             sbyt        r0, 8 
##             sbyt        r1, 4 
##             sbyt        r2, 252               #FCh
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX3:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX3_CSB, r0
## LABEL_READ_RETRY_INDEX3_LSB_MSB:
##             sbyt        r0, 254               #FEh
##             sbyt        r1, 254               #FEh
##             sbyt        r2, 253               #FDh              
##             sbyt        r3, 250               #FAh
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX3_CSB:
##             sbyt        r0, 6 
##             sbyt        r1, 6 
##             sbyt        r2, 3 
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX4:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX4_CSB, r0
## LABEL_READ_RETRY_INDEX4_LSB_MSB:
##             sbyt        r0, 8 
##             sbyt        r1, 5 
##             sbyt        r2, 7 
##             sbyt        r3, 255               #FFh
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX4_CSB:
##             sbyt        r0, 10
##             sbyt        r1, 7 
##             sbyt        r2, 1 
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX5:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX5_CSB, r0
## LABEL_READ_RETRY_INDEX5_LSB_MSB:
##             sbyt        r0, 9 
##             sbyt        r1, 6 
##             sbyt        r2, 7 
##             sbyt        r3, 251               #FBh
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX5_CSB:
##             sbyt        r0, 5 
##             sbyt        r1, 5 
##             sbyt        r2, 2 
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX6:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX6_CSB, r0
## LABEL_READ_RETRY_INDEX6_LSB_MSB:
##             sbyt        r0, 5 
##             sbyt        r1, 5 
##             sbyt        r2, 2 
##             sbyt        r3, 253               #FDh
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX6_CSB:
##             sbyt        r0, 4 
##             sbyt        r1, 6 
##             sbyt        r2, 0 
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX7:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX7_CSB, r0
## LABEL_READ_RETRY_INDEX7_LSB_MSB:
##             sbyt        r0, 7 
##             sbyt        r1, 8 
##             sbyt        r2, 5 
##             sbyt        r3, 255               #FFh
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX7_CSB:
##             sbyt        r0, 12
##             sbyt        r1, 9 
##             sbyt        r2, 7 
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX8:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX8_CSB, r0
## LABEL_READ_RETRY_INDEX8_LSB_MSB:
##             sbyt        r0, 8 
##             sbyt        r1, 9 
##             sbyt        r2, 8 
##             sbyt        r3, 255               #FFh
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX8_CSB:
##             sbyt        r0, 10
##             sbyt        r1, 10
##             sbyt        r2, 4 
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX9:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX9_CSB, r0
## LABEL_READ_RETRY_INDEX9_LSB_MSB:
##             sbyt        r0, 9 
##             sbyt        r1, 10
##             sbyt        r2, 6 
##             sbyt        r3, 254               #FEh
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX9_CSB:
##             sbyt        r0, 11
##             sbyt        r1, 9 
##             sbyt        r2, 5 
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX10:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX10_CSB, r0
## LABEL_READ_RETRY_INDEX10_LSB_MSB:
##             sbyt        r0, 5 
##             sbyt        r1, 13
##             sbyt        r2, 255               #FFh
##             sbyt        r3, 2  
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX10_CSB:
##             sbyt        r0, 13
##             sbyt        r1, 11
##             sbyt        r2, 7 
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX11:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX11_CSB, r0
## LABEL_READ_RETRY_INDEX11_LSB_MSB:
##             sbyt        r0, 4 
##             sbyt        r1, 10
##             sbyt        r2, 255               #FFh
##             sbyt        r3, 255               #FFh
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX11_CSB:
##             sbyt        r0, 1 
##             sbyt        r1, 6 
##             sbyt        r2, 0 
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX12:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX12_CSB, r0
## LABEL_READ_RETRY_INDEX12_LSB_MSB:
##             sbyt        r0, 4 
##             sbyt        r1, 11
##             sbyt        r2, 1 
##             sbyt        r3, 0
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX12_CSB:
##             sbyt        r0, 5 
##             sbyt        r1, 2 
##             sbyt        r2, 249               #F9h
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX13:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX13_CSB, r0
## LABEL_READ_RETRY_INDEX13_LSB_MSB:
##             sbyt        r0, 5 
##             sbyt        r1, 5 
##             sbyt        r2, 0 
##             sbyt        r3, 243               #F3h
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX13_CSB:
##             sbyt        r0, 4 
##             sbyt        r1, 0 
##             sbyt        r2, 248               #F8h
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX14:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX14_CSB, r0
## LABEL_READ_RETRY_INDEX14_LSB_MSB:
##             sbyt        r0, 4 
##             sbyt        r1, 4 
##             sbyt        r2, 0 
##             sbyt        r3, 244               #F4h
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX14_CSB:
##             sbyt        r0, 3 
##             sbyt        r1, 3 
##             sbyt        r2, 250               #FAh
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX15:
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_INDEX15_CSB, r0
## LABEL_READ_RETRY_INDEX15_LSB_MSB:
##             sbyt        r0, 5 
##             sbyt        r1, 6 
##             sbyt        r2, 1 
##             sbyt        r3, 246               #F6h
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_INDEX15_CSB:
##             sbyt        r0, 8 
##             sbyt        r1, 4 
##             sbyt        r2, 251               #FBh
##             jnz.fc      LABEL_READ_RETRY_PARAMETER_SET
## LABEL_READ_RETRY_PARAMETER_SET:
##             setpr       0,r0, 0, 7
##             setpr       0,r1, 8, 15 
##             setpr       0,r2, 16, 23
##             setpr       0,r3, 24, 31
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_ADDRESS_SETI_CSB, r0
##             matcl       r0, C_PAGE_MSB, 243, 0, SET_OFFSET_DIRECT
##             jnz.nfc     LABEL_READ_RETRY_ADDRESS_SETI_MSB, r0
## LABEL_READ_RETRY_ADDRESS_SETI_LSB:
##             sbyt        r0, 1
##             sbyt        r1, 137
##             setpr       0,r1, 40, 47
##             wk          I_CL_SETF_BY_LUN, C_WK_CTRL_4, LABEL_READ_RETRY_ADDRESS_SETI_LSB
##             wk          I_CL_SETF_BY_LUN, C_WK_CTRL_C, LABEL_READ_RETRY_ADDRESS_SETI_LSB
##             jnz.fc      LABEL_RR_MAIN, r0
## LABEL_READ_RETRY_ADDRESS_SETI_CSB:
##             sbyt        r0, 2
##             sbyt        r1, 138
##             setpr       0,r1, 40, 47
##             wk          I_CL_RR_CSB, C_WK_CTRL_4, LABEL_READ_RETRY_ADDRESS_SETI_CSB
##             wk          I_CL_RR_CSB, C_WK_CTRL_C, LABEL_READ_RETRY_ADDRESS_SETI_CSB
##             jnz.fc      LABEL_RR_MAIN, r0
## LABEL_READ_RETRY_ADDRESS_SETI_MSB:
##             sbyt        r0, 3
##             sbyt        r1, 137
##             setpr       0,r1, 40, 47
##             wk          I_CL_RR_MSB, C_WK_CTRL_4, LABEL_READ_RETRY_ADDRESS_SETI_MSB
##             wk          I_CL_RR_MSB, C_WK_CTRL_C, LABEL_READ_RETRY_ADDRESS_SETI_MSB
##             jnz.fc      LABEL_RR_MAIN, r0
## # LICHENG END
## 
## 
## LABEL_READ_RETRY_DIRECT:
##             matcl       r0, C_PAGE_LSB, 243, 0, SET_OFFSET_DIRECT
##             jnz         LABEL_RR_PAGE_LSB, r0, 0
##             matcl       r0, C_PAGE_CSB, 243, 0, SET_OFFSET_DIRECT
##             jnz         LABEL_RR_PAGE_CSB, r0, 0
## LABEL_RR_PAGE_MSB:
##             #sbyt.gr     B0, 3          ## Prefix=03h
##             sbyt.gr     B1, 137        ## FA=137d=89h
##             setpr.gr    B1, 40, 47     ## copy B1 to itfc5
## 
##             sbyt.gr     B1, 0
##             setpc       24, 0, 7
##             setpr.gr    B1, 8, 15
##             setpr.gr    B1, 16,23
##             setpr.gr    B1, 24,31
##             wk          I_CL_SETF_BY_LUN, C_WK_CTRL_C, LABEL_RR_PAGE_MSB
##             jnz         LABEL_RR_MAIN, r0, 1
## LABEL_RR_PAGE_LSB:
##             #sbyt.gr     B0, 1           ## Prefix=01h
##             sbyt.gr     B1, 137         ## FA=137d=89h
##             setpr.gr    B1, 40, 47      ## copy B1 to itfc5
## 
##             sbyt.gr     B1, 0
##             setpc       24, 0, 7
##             setpr.gr    B1, 8, 15
##             setpr.gr    B1, 16,23
##             setpr.gr    B1, 24,31
##             wk          I_CL_SETF_BY_LUN, C_WK_CTRL_C, LABEL_RR_PAGE_LSB
##             jnz         LABEL_RR_MAIN, r0, 1
## LABEL_RR_PAGE_CSB:
##             #sbyt.gr     B0, 2           ## Prefix=02h
##             sbyt.gr     B1, 137         ## FA=137d=89h
##             setpr.gr    B1, 40, 47      ## copy B1 to itfc5
## 
##             sbyt.gr     B1, 0
##             setpc       24, 0, 7
##             setpr.gr    B1, 8, 15
##             setpr.gr    B1, 16,23
##             setpr.gr    B1, 24,31
##             wk          I_CL_SETF_BY_LUN, C_WK_CTRL_C, LABEL_RR_PAGE_LSB


LABEL_READ_RETRY_DIRECT:
            offst.im    0
            sbyt.gr     B1, 137         ## FA=137d=89h
            setpr.gr    B1, 0, 7      ## copy B1 to itfc0

            ccbit       C_CMD_RETRY_DATA_START, 8, 15       ## cmd[199:192] => B1
            setpr.gr    B1, 8, 15       ## copy B1 to itfc0 (P1)
            
            sbyt.gr     B1, 0           ## clear B0=0
            setpr.gr    B1, 16,23       ## set 00h to itfc1 (P2)
            setpr.gr    B1, 24,31       ## set 00h to itfc2 (P3)
            setpr.gr    B1, 32,39       ## set 00h to itfc1 (P4)
            wk          I_CL_SETF_BY_ADDR, C_WK_CTRL_0, LABEL_0

LABEL_READ_RETRY_CHK_STATUS:
            #setpr.lun   0, 7
            #wk          I_CL_SYNC_RS_71H, C_WK_CTRL_D, LABEL_READ_RETRY_CHK_STATUS  ## this yield could only support 1CE1LUN flash!!
            #setp        SETP_ID_ALL, 0, 0
            #wk          I_CL_SYNC_RS_78H, C_WK_CTRL_1, LABEL_SOFT_BIT_TLC_READBACK_MAIN
            LABEL_READ_RETRY_CHK_STATUS_WAIT_IDLE:
            wk          I_CL_SYNC_RS_70H, C_WK_CTRL_1, LABEL_0
            stacp.ni    r0, 6
            jnz.nfc     LABEL_READ_RETRY_CHK_STATUS_WAIT_IDLE, r0
            mlctl       1

LABEL_RR_MAIN:
            setp        SETP_ID_ALL, 0, 0
            sbyt        B0, 48          ## Byte0 == 30h
            setpr.gr    B0, 40, 47      ## B0 => itfc5
            setpr       0,  r0, 48, 55


            #setp        2, 0, 0
            #setp        13, 2, 0
            #wk          I_CL_READ_COMMON, C_WK_CTRL_C, LABEL_RR_MAIN
            wk          I_CL_SLC_TLC_READ_COMMON,  C_WK_CTRL_C, LABEL_RR_MAIN
            tmrst
            calre       0, LABEL_SOFT_BIT_TLC_READBACK_MAIN
LABEL_CLEAR_RR_SET_FEATURE:
#           #setp        SETP_ID_ALL, 0, 0
            #setpr.lun   32, 39        ## copy lun to itfc_param byte 4
            ## add below read status since in simulation, the model show its still in Rb_n_int busy
            ## and if no 78H check, the following set feature will not get ready
            ## setp        SETP_ID_ALL, 0, 0
            ## wk          I_CL_SYNC_RS_78H, C_WK_CTRL_1, LABEL_0
            mlctl       0
LABEL_CLEAR_RR_SET_FEATURE_MLIDL_CHK:
            mlidl       r0
            jnz.nfc     LABEL_CLEAR_RR_SET_FEATURE_MLIDL_BUSY, r0
            jnz.fc      LABEL_CLEAR_RR_SET_FEATURE_MLIDL_PASS
            LABEL_CLEAR_RR_SET_FEATURE_MLIDL_BUSY:
                yield
                jnz.fc      LABEL_CLEAR_RR_SET_FEATURE_MLIDL_CHK
            LABEL_CLEAR_RR_SET_FEATURE_MLIDL_PASS:
                

            sbyt        r1, 137
            setpr.gr    B1, 0, 7
            sbyt.gr     B0, 0
            setpr.gr    B0, 8, 15
            setpr.gr    B0, 16,23
            setpr.gr    B0, 24,31
            setpr.gr    B0, 32,39
            wk          I_CL_SETF_BY_ADDR, C_WK_CTRL_0, LABEL_0

            ## using 78H to check set feature ready has failed in sim. Using 70H instead since peer lun is locked
            LABEL_CLEAR_RR_SET_FEATURE_WAIT_IDLE:
            wk          I_CL_SYNC_RS_70H, C_WK_CTRL_1, LABEL_0
            stacp.ni    r0, 6
            jnz.nfc     LABEL_CLEAR_RR_SET_FEATURE_WAIT_IDLE, r0
LABEL_CLEAR_RR_SET_FEATURE_CHK_STATUS:
            #setpr.lun   0, 7
            #wk          I_CL_SYNC_RS_71H, C_WK_CTRL_D, LABEL_CLEAR_RR_SET_FEATURE_CHK_STATUS  ## this yield could only support 1CE1LUN flash!!
            #setp        SETP_ID_ALL, 0, 0
            #wk          I_CL_SYNC_RS_78H, C_WK_CTRL_1, LABEL_0
            mlctl       1
            incptr.cmd  1
            sets        0, 5, 0
            end         
            nop       

     
    
###################################################################################################
## SYNC Reset FFh
#LABEL_SYNC_RST_ENTRY:
#            setb        r14,1
#            wk          I_CL_RESET, C_WK_CTRL_8, LABEL_0
#            sets        0, 5, 1
#            jnz         LABEL_SYNC_RS_70H, r0, 1
#            nop         

## SYNC Read Status 70h
LABEL_SYNC_RS_70H:   
            yield       
            wk          I_CL_SYNC_RS_70H, C_WK_CTRL_1, LABEL_0
            stacp       r0, 1, 6
            jnz         LABEL_SYNC_RS_70H, r0, 0
            sets        0, 5, 0
            reti        0, 0, 0, LABEL_0
            incptr.cmd  1
            end         
            nop         


## LABEL_SYNC_SET_FEA_ENTRY
#LABEL_SYNC_SET_FEA_ENTRY:
#            setpc       11, 0, 7
#	    setpc       12, 8, 15
# 	    setpc       13, 16, 23
#            setpc       14, 24, 31
#            setpc       15, 32, 39
#            wk          I_CL_SETF_BY_ADDR, 2, LABEL_0
#	    reti        0, 0, 0, LABEL_0
#            incptr.cmd      1
#            end
#	    nop

#LABEL_SYNC_SET_PAR_ENTRY:
#            setpc       11, 32, 39
#			setpc       12, 40, 47
#			setpc       13, 0, 7
#	        setpc       14, 8, 15
# 	        setpc       15, 16, 23
#            setpc       16, 24, 31
#            wk          I_CL_SYNC_PAR_FEA, 2, LABEL_0
#	        reti        0, 0, 0, LABEL_0
#            incptr.cmd      1
#            end
#	        nop		
		
		
ITFC_ISSUE_CMD:
#            ccbyt       r0, 0, SET_OFFSET_DIRECT
#            setpr       r0, 0, 7
            setpc       r15, 0, 7
            wk          I_CL_SYNC_ISSUE_CMD, 0, LABEL_0
            reti        0, 0, 0, LABEL_0
            incptr.cmd  1  
            end         
            nop  
            
ITFC_ISSUE_ADDR:
#            ccbyt       r0, 0, SET_OFFSET_DIRECT
#            setpr       r0, 0, 7
            setpc       r15, 0, 7
            wk          I_CL_SYNC_ISSUE_ADDR, 0, LABEL_0
            reti        0, 0, 0, LABEL_0
            incptr.cmd  1  
            end         
            nop   

ITFC_ISSUE_DATA:
#            ccbyt       r0, 0, SET_OFFSET_DIRECT
#            setpr       r0, 0, 7
            setpc       r15, 0, 7
            wk          I_CL_SYNC_ISSUE_DATA, 0, LABEL_0
            reti        0, 0, 0, LABEL_0
            incptr.cmd  1  
            end         
            nop
                       
ITFC_ASYNC_READ_BYTE:
            wk          I_CL_ASYNC_READ_1BYTE, 2, LABEL_0
            incptr.cpl  1
            reti        4, 0, 0, LABEL_0
            incptr.cmd  1  
            end         
            nop              

ITFC_ASYNC_READ_4_BYTE:
            wk          I_CL_ASYNC_READ_4BYTES, 2, LABEL_0
            incptr.cpl  1
            reti        4, 0, 0, LABEL_0
            incptr.cmd  1  
            end         
            nop              


ITFC_SYNC_READ_2_BYTE:
            wk          I_CL_SYNC_READ_2BYTES, 2, LABEL_0
            incptr.cpl  1
            reti        4, 0, 0, LABEL_0
            incptr.cmd  1  
            end        
            nop


ITFC_SYNC_READ_8_BYTE:
            wk          I_CL_SYNC_READ_8BYTES, 2, LABEL_0
            incptr.cpl  1
            reti        4, 0, 0, LABEL_0
            incptr.cmd  1    
            end         
            nop              
            
ITFC_SYNC_WRITE_2_BYTE:
#            ccbyt       r0, 0, SET_OFFSET_DIRECT
#            setpr       r0, 0, 7
            setpc       r11, 0, 7
            setpc       r12, 8, 15
            
            wk          I_CL_SYNC_WRITE_2BYTES, 0, LABEL_0
            reti        0, 0, 0, LABEL_0
            incptr.cmd  1  
            end         
            nop

ITFC_SYNC_WRITE_8_BYTE:
            setpc       r11,  0,  7
            setpc       r12,  8, 15
            setpc       r13, 16, 23
            setpc       r14, 24, 31
            setpc       r15, 32, 39
            setpc       r16, 40, 47
            setpc       r17, 48, 55
            setpc       r18, 56, 63 
            
            wk          I_CL_SYNC_WRITE_8BYTES, 0, LABEL_0
            reti        0, 0, 0, LABEL_0
            incptr.cmd  1  
            end         
            nop

ITFC_ASYNC_WRITE_4_BYTE:
            setpc       r11,  0,  7
            setpc       r12,  8, 15
            setpc       r13, 16, 23
            setpc       r14, 24, 31
            wk          I_CL_ASYNC_WRITE_4BYTES,  0, LABEL_0
            reti        0, 0, 0, LABEL_0
            incptr.cmd  1  
            end         
            nop
            

                 
           






## SOFT BIT ENTRY
LABEL_SOFT_READ_ENTRY:
            sets            0, 5, 1
            sbyt.gr         R1, 0


## (0) Check LSB/CSB/MSB           
LABEL_SOFT_READ_LCM_PGAE_CHK:
            ccbit           2, 8, 9         #  GR[15:08] == cmd[2+:32]
            sbyt.gr         R2, 0           #  GR[23:16] == 0
            cmbyt           r0, R1, R2      #  r0=(GR1==GR2) , LSB check 
            sbyt.gr         R2, 1           #  GR2 == 1, for prefix
            sar.v0          1               #  V0  == 01h (LSB)
            jnz             LABEL_SOFT_READ_RETRY_STEP, r0, 0

            sbyt.gr         R2, 1           #  GR[23:16] == 1
            cmbyt           r0, R1, R2      #  r0=(GR1==GR2) , CSB check 
            sbyt.gr         R2, 2           #  GR2 == 2, for prefix
            sar.v0          2               #  V0  == 02h (CSB)
            jnz             LABEL_SOFT_READ_RETRY_STEP, r0, 0

            sbyt.gr         R2, 2           #  GR[23:16] == 1
            cmbyt           r0, R1, R2      #  r0=(GR1==GR2) , MSB check 
            sbyt.gr         R2, 3           #  GR2 == 3, for prefix
            sar.v0          3               #  V0  == 03h (MSB)
            jnz             LABEL_SOFT_READ_RETRY_STEP, r0, 0


## (1) Read retry set feature using D0,D1,D2 value           
LABEL_SOFT_READ_RETRY_STEP:
            nop
        ## RR Set Feature
            sbyt.v1         1       # V1  == 01h (RR)
            calre.cal       LABEL_SOFT_READ_FEATURE_SET     # V0==already set, V1=01h (RR Type)

        ## RR Data Out
            sbyt.gr         R1, 48          ## itfc byte6 == 30h
            setpr           0,  R1, 48, 55   
            calre.cal       LABEL_SOFT_READ_RETRY_READ_DATA # R2==prefix

        ## RR Clear
           sbyt.v1         4       # V1  == 04h (Clear)
           calre.cal       LABEL_SOFT_READ_FEATURE_SET      # V0==already set, V1=04h (Clear Mode)

## (2) Soft bit positive set           
LABEL_SOFT_READ_POS_SHIFT_STEP:
        ## Pos-Shift Set Feature
            sbyt.v1         2       # V1  == 02h (Pos)
            calre.cal       LABEL_SOFT_READ_FEATURE_SET     # V0==already set, V1=02h (Pos Shift)
LABEL_SOFT_READ_POS_SHIFT_READ:
            setp        SETP_ID_ALL, 0, 0
            #setp            2,  0,  0
            #setp            13, 2,  0
            setpr           0,  R2, 40, 47   
            sbyt.gr         R1, 48          ## itfc byte6 == 30h
            setpr           0,  R1, 48, 55   
            wk              I_CL_SOFT_RR_POS, C_WK_CTRL_4, LABEL_SOFT_READ_POS_SHIFT_READ 
#            sets            0, 5, 0
#            sets            0, 4, 1
            calre.cal       LABEL_SOFT_BIT_TLC_CHK_78H_MAIN

## (3) Soft bit negative set 
LABEL_SOFT_READ_NEG_SHIFT_STEP:
        ## Neg-Shift Set Feature
            sbyt.v1         3       # V1  == 03h (Neg)
            calre.cal       LABEL_SOFT_READ_FEATURE_SET     # V0==already set, V1=03h (Neg Shift)
LABEL_SOFT_READ_NEG_SHIFT_READ:
            setp        SETP_ID_ALL, 0, 0
            #setp            2,  0,  0
            #setp            13, 2,  0
            setpr           0,  R2, 40, 47   
            sbyt.gr         R1, 60          ## itfc byte6 == 3Ch
            setpr           0,  R1, 48, 55   
            wk              I_CL_SOFT_RR_NEG, C_WK_CTRL_4, LABEL_SOFT_READ_RETRY_READ_DATA 
#            sets            0, 5, 0
#            sets            0, 4, 1
            calre.cal       LABEL_SOFT_BIT_TLC_CHK_78H_MAIN



## (4) XNOR between SBn and SBp data 
LABEL_SOFT_READ_TLC_XNOR:
           sbyt.gr          R3, 203     ## CB
           setpr.gr         R3, 0,  7
           wk.ndsyld        I_CL_SYNC_ISSUE_CMD, LABEL_SOFT_READ_TLC_XNOR 
           calre.cal        LABEL_SOFT_BIT_TLC_CHK_78H_MAIN 

           sbyt.gr          R3, 63      ## 3F
           setpr.gr         R3, 0,  7
           wk.ndsyld        I_CL_SYNC_ISSUE_CMD, LABEL_SOFT_READ_TLC_XNOR 

#           sets             0, 5, 0
#           sets             0, 4, 1
           calre.cal        LABEL_SOFT_BIT_TLC_READBACK_MAIN




## (5) Clear Soft Bit Mode  
           sbyt.v1         4       # V1  == 04h (Clear)
           calre.cal       LABEL_SOFT_READ_FEATURE_SET     # V0==already set, V1=04h (Clear Mode)


## (6) Finish Soft Bit 
LABEL_SOFT_READ_FINISH:
           incptr           0, 0         
           sar.v0           0
           sar.v1           0
           sets             0, 5, 0
           end




#############################################################
#
# SOFT BIT READ 78H 
#
#############################################################
## Read status for SOFT BIT TLC read opearation
LABEL_SOFT_BIT_TLC_CHK_78H_YIELD:
            yield       
LABEL_SOFT_BIT_TLC_CHK_78H_MAIN:
            #setp        SETP_ID_NO_CA, 0, 0
            setp        SETP_ID_ALL, 0, 0
            #setp        2, 0, 0
            #setp        13, 2, 0
            wk          I_CL_SYNC_RS_70H, C_WK_CTRL_5, LABEL_SOFT_BIT_TLC_CHK_78H_MAIN
            stacp       r0, 1, 6
            jnz         LABEL_SOFT_BIT_TLC_CHK_78H_YIELD, r0, 0
            stacp       r0, 1, 5            ## this bit check flash array status
            jnz         LABEL_SOFT_BIT_TLC_CHK_78H_YIELD, r0, 0
            calre.rt    


#############################################################
#
# SOFT BIT READ DATA BACK
#
#############################################################
LABEL_SOFT_BIT_TLC_READBACK_YIELD:
            yield       
LABEL_SOFT_BIT_TLC_READBACK_MAIN:
            offst.im    0
            setp        SETP_ID_ALL, 0, 0
            wk          I_CL_SYNC_RS_70H, C_WK_CTRL_5, LABEL_SOFT_BIT_TLC_READBACK_YIELD
            #setpr.lun   0, 7
            #wk          I_CL_SYNC_RS_71H, C_WK_CTRL_D, LABEL_SOFT_BIT_TLC_READBACK_MAIN
            cklvl       r0, 1, level_empty
            jnz.nfc     LABEL_SOFT_BIT_TLC_READBACK_YIELD, r0
            nop
            nop
            nop
`ifdef MODE8
            nop
`endif
            stacp       r0, 1, 5
            jnz.nfc     LABEL_SOFT_BIT_TLC_READBACK_YIELD, r0

            stacp       r0, 1, 6
            jnz         LABEL_SOFT_BIT_TLC_READBACK_YIELD, r0, 0

            #stacp       r0, 1, 5
            #jnz         LABEL_SOFT_BIT_TLC_READBACK_YIELD, r0, 0
            jnz         LABEL_SYNC_TLC_SOFT_READBACK_CHK_CPL_START, r0, 1



#############################################################
#
# SOFT BIT READ FEATURE SET FUNCTION 
#
#############################################################
# Since RR set feature need 2 times, using GR3 as counter
LABEL_SOFT_READ_FEATURE_SET:
        sbyt.gr         R3, 0
LABEL_SOFT_READ_FEATURE_LOOP:
        jne.v0epc       LABEL_SOFT_READ_FEA_SET_NOT_LSB, 1
            ## (D5h)+(Lun)+  89h  ----<D0>+<D1>+<D2>+<D3>
                sbyt.gr         R1, 137     # itfc_param byte 5 == 89h
                setpr           0, R1, 40, 47
            
            ## (D5h)+(Lun)+  89h  ----<D0>+<D1>+<D2>+<D3>
                ## <D1>==0
                sbyt.gr         R1, 0
                setpr           0, R1, 8, 15    #  D1 == 0
                ## <D3>==0
                sbyt.gr         R1, 0
                setpr           0, R1, 24, 31   #  D3 == 0
                ## <D0>,<D2> decided by V1
                jne.v1epc       LABEL_SOFT_READ_FEA_SET_LSB_NOT_RR, 1
                    ## RR Type
                    ccbit           68, 8, 15       #  GR1== cmd[ 75 :68]
                    setpr           0,  R1, 0, 7    #  D0 == GR1
                    setpc           19, 16, 23      #  D2 == cmd[159:152]
                    jnz.fc          LABEL_SOFT_READ_FEA_SET_DONE 
LABEL_SOFT_READ_FEA_SET_LSB_NOT_RR:
                jne.v1epc       LABEL_SOFT_READ_FEA_SET_LSB_NOT_POS, 2
                    ## Pos Set
                    setpc           21, 0, 7        #  D0 == cmd[175:168]
                    setpc           22, 16, 23      #  D2 == cmd[183:176]
                    jnz.fc          LABEL_SOFT_READ_FEA_SET_DONE 
LABEL_SOFT_READ_FEA_SET_LSB_NOT_POS:
                jne.v1epc       LABEL_SOFT_READ_FEA_SET_LSB_NOT_NEG, 3
                    ## Neg Set
                    setpc           25, 0, 7        #  D0 == cmd[207:200]
                    setpc           26, 16, 23      #  D2 == cmd[215:208]
                    jnz.fc          LABEL_SOFT_READ_FEA_SET_DONE 
LABEL_SOFT_READ_FEA_SET_LSB_NOT_NEG:
                jne.v1epc       LABEL_SOFT_READ_FEA_SET_LSB_NOT_CLEAR, 4
                    sbyt.gr         R1, 0
                    setpr           0, R1, 0,  7    #  D0 == 0
                    setpr           0, R1, 16, 23   #  D2 == 0
                    jnz.fc          LABEL_SOFT_READ_FEA_SET_DONE 
LABEL_SOFT_READ_FEA_SET_LSB_NOT_CLEAR:
                    nop
                    jnz.fc          LABEL_SOFT_READ_FEA_SET_LSB_NOT_CLEAR     ## Error Debug, Dead Lock


LABEL_SOFT_READ_FEA_SET_NOT_LSB:
        jne.v0epc   LABEL_SOFT_READ_FEA_SET_NOT_CSB, 2
            ## (D5h)+(Lun)+  8Ah  ----<D0>+<D1>+<D2>+<D3>
                sbyt.gr         R1, 138     # itfc_param byte 5 == 8Ah
                setpr           0, R1, 40, 47
            ## (D5h)+(Lun)+  8Ah  ----<D0>+<D1>+<D2>+<D3>
                ## <D3>==0
                sbyt.gr         R1, 0
                setpr           0, R1, 24, 31    #  D3 == 0
                ## <D0>,<D1>,<D2> decided by V1
                jne.v1epc       LABEL_SOFT_READ_FEA_SET_CSB_NOT_RR, 1
                    ## RR Type
                    ccbit           68, 8, 15       #  GR1== cmd[ 75: 68]
                    setpr           0,  R1, 0, 7    #  D0 == GR1
                    setpc           19, 8, 15       #  D1 == cmd[159:152]
                    setpc           20, 16, 23      #  D2 == cmd[167:160]
                    jnz.fc          LABEL_SOFT_READ_FEA_SET_DONE 
LABEL_SOFT_READ_FEA_SET_CSB_NOT_RR:
                jne.v1epc       LABEL_SOFT_READ_FEA_SET_CSB_NOT_POS, 2
                    ## Pos Set
                    setpc           21, 0, 7        #  D0 == cmd[175:168]
                    setpc           22, 8, 15       #  D1 == cmd[183:176]
                    setpc           24, 16, 23      #  D2 == cmd[199:192]
                    jnz.fc          LABEL_SOFT_READ_FEA_SET_DONE 
LABEL_SOFT_READ_FEA_SET_CSB_NOT_POS:
                jne.v1epc       LABEL_SOFT_READ_FEA_SET_CSB_NOT_NEG, 3
                    ## Neg Set
                    setpc           25, 0, 7        #  D0 == cmd[207:200]
                    setpc           26, 8, 15       #  D1 == cmd[215:208]
                    setpc           27, 16, 23      #  D2 == cmd[223:216]
                    jnz.fc          LABEL_SOFT_READ_FEA_SET_DONE 
LABEL_SOFT_READ_FEA_SET_CSB_NOT_NEG:
                jne.v1epc       LABEL_SOFT_READ_FEA_SET_CSB_NOT_CLEAR, 4
                    sbyt.gr         R1, 0
                    setpr           0, R1, 0,  7    #  D0 == 0
                    setpr           0, R1, 8,  15   #  D1 == 0
                    setpr           0, R1, 16, 23   #  D2 == 0
                    jnz.fc          LABEL_SOFT_READ_FEA_SET_DONE 
LABEL_SOFT_READ_FEA_SET_CSB_NOT_CLEAR:
                    nop
                    jnz.fc          LABEL_SOFT_READ_FEA_SET_CSB_NOT_CLEAR   ## Error Debug, Dead Lock



LABEL_SOFT_READ_FEA_SET_NOT_CSB:
        jne.v0epc   LABEL_SOFT_READ_FEA_SET_NOT_MSB, 3
            ## (D5h)+(Lun)+  89h  ----<D0>+<D1>+<D2>+<D3>
                sbyt.gr         R1, 137     # itfc_param byte 5 == 89h
                setpr           0, R1, 40, 47
                ## <D0>==0
                sbyt.gr         R1, 0
                setpr           0, R1, 0, 7     #  D0 == 0
                ## <D2>==0
                sbyt.gr         R1, 0
                setpr           0, R1, 16, 23   #  D2 == 0
                ## <D0>,<D2> decided by V1
                jne.v1epc       LABEL_SOFT_READ_FEA_SET_MSB_NOT_RR, 1
                    ## RR Type
                    ccbit           68, 8, 15       #  GR1== cmd[ 75: 68]
                    setpr           0,  R1, 8, 15   #  D1 == GR1
                    setpc           19, 24, 31      #  D3 == cmd[159:152]
                    jnz.fc          LABEL_SOFT_READ_FEA_SET_DONE 
LABEL_SOFT_READ_FEA_SET_MSB_NOT_RR:
                jne.v1epc       LABEL_SOFT_READ_FEA_SET_MSB_NOT_POS, 2
                    ## Pos Set
                    setpc           21, 8, 15       #  D1 == cmd[175:168]
                    setpc           22, 24, 31      #  D3 == cmd[183:176]
                    jnz.fc          LABEL_SOFT_READ_FEA_SET_DONE 
LABEL_SOFT_READ_FEA_SET_MSB_NOT_POS:
                jne.v1epc       LABEL_SOFT_READ_FEA_SET_MSB_NOT_NEG, 3
                    ## Neg Set
                    setpc           25, 8, 15       #  D1 == cmd[207:200]
                    setpc           26, 24, 31      #  D3 == cmd[215:208]
                    jnz.fc          LABEL_SOFT_READ_FEA_SET_DONE 
                #jne.v1epc       LABEL_SOFT_READ_FEA_SET_NOT_NEG, 3
LABEL_SOFT_READ_FEA_SET_MSB_NOT_NEG:
                jne.v1epc       LABEL_SOFT_READ_FEA_SET_MSB_NOT_CLEAR, 4
                    sbyt.gr         R1, 0
                    setpr           0, R1, 8,  15  #  D1 == 0
                    setpr           0, R1, 24, 31  #  D3 == 0
                    jnz.fc          LABEL_SOFT_READ_FEA_SET_DONE 
LABEL_SOFT_READ_FEA_SET_MSB_NOT_CLEAR:
                    nop
                    jnz.fc          LABEL_SOFT_READ_FEA_SET_MSB_NOT_CLEAR   ## Error Debug, Dead Lock


LABEL_SOFT_READ_FEA_SET_NOT_MSB:
            ## Error Debug, Dead lock
            nop
            jnz.fc      LABEL_SOFT_READ_FEA_SET_NOT_MSB 


LABEL_SOFT_READ_FEA_SET_DONE:
            sbyt.gr       R1, 0
            ccbit         24, 8, 8      ## GR[15:8]= lun in cmd
            setpr.gr      R1, 32, 39    ## itfc byte4 == GR[15:8]
            ##setp        2, 0, 0
            ##setp        13, 2, 0
            jne.v1epc       LABEL_SOFT_READ_FEA_SET_WK_NOT_RR, 1
                wk              I_CL_SOFT_RR, C_WK_CTRL_4, LABEL_SOFT_READ_FEATURE_SET  
                ##calre.cal       LABEL_PROG_B_ONE_PAGE_CHK_RS_78H_START
                calre.cal       LABEL_SOFT_BIT_TLC_CHK_78H_MAIN


                sbyt.gr         R1, 1
                cmbyt           r0, R1, R3
                jnz.nfc         LABEL_SOFT_READ_SET_WK_DONE, r0
                adbyt.imm       R3, R3, 1
                jnz.fc          LABEL_SOFT_READ_FEATURE_LOOP 

LABEL_SOFT_READ_FEA_SET_WK_NOT_RR:
                wk              I_CL_SOFT_RR, C_WK_CTRL_0, LABEL_SOFT_READ_FEATURE_SET  
                calre.cal       LABEL_SOFT_BIT_TLC_CHK_78H_MAIN
LABEL_SOFT_READ_SET_WK_DONE:
            calre.rt        # return to LABEL_SOFT_READ_FEATURE_SET



#############################################################
#
# SOFT BIT READ RETRY DATA OUT FUNCTION
#
#############################################################
LABEL_SOFT_READ_RETRY_READ_DATA:
            # GR2 == prefix in soft bit entry assignment
            setp        SETP_ID_ALL, 0, 0
            #setp            2,  0,  0
            #setp            13, 2,  0
            setpr           0,  R2, 40, 47   
            wk              I_CL_SOFT_RR_POS,C_WK_CTRL_C, LABEL_SOFT_READ_RETRY_READ_DATA 
            calre.cal       LABEL_SOFT_BIT_TLC_READBACK_YIELD
            calre.rt        # return to LABEL_SOFT_READ_RETRY_READ_DATA


#############################################################
#
# SOFT BIT READ 4K DATA FUNCTION (2018_10_15 4K read version)
#
#############################################################
LABEL_SYNC_TLC_SOFT_READBACK_CHK_CPL_START:
            wk          I_CL_READ_P1, C_WK_CTRL_A, LABEL_0
LABEL_SYNC_TLC_SOFT_READBACK_CHK_CPL_YIELD:
            cklvl       r0, 1, 150
            jne         LABEL_SYNC_TLC_SOFT_READBACK_CHK_CPL_YIELD, r0, 0 , 1
            offst.im    0
            setcpl      15, 0, 220, 223
            incptr      1, 144
LABEL_SYNC_TLC_SOFT_READBACK_FIRST_2K_RETI_ADDR:
            reti        7, 0, 8, LABEL_SYNC_TLC_SOFT_READBACK_FIRST_2K_RETI_ADDR
LABEL_SYNC_TLC_SOFT_READBACK_4K_LEVEL_CHK: 
            cklvl       r0, 1, 260
            jne         LABEL_SYNC_TLC_SOFT_READBACK_4K_LEVEL_CHK, r0, 0 , 1
            offst.im    0
            setcpl      15, 1, 220, 223
            setcpl      13, 0, 68, 83
            incptr      1, 144
LABEL_SYNC_TLC_SOFT_READBACK_RETURN_START:
            reti        7, 0, 0, LABEL_SYNC_TLC_READBACK_RETURN_START          
            calre       1, LABEL_0                    

            #incptr      0, 0
            #sets        0, 5, 0
            #end
            

 


#############################################################
#
# SOFT BIT READ 4K DATA FUNCTION (2017_01_16 4K read version)
#
#############################################################
#LABEL_SYNC_TLC_SOFT_READBACK_CHK_CPL_YIELD:
#            yield       
#LABEL_SYNC_TLC_SOFT_READBACK_CHK_CPL_START:
#            cklvl       r0, 1, 24
#            jnz         LABEL_SYNC_TLC_SOFT_READBACK_CHK_CPL_YIELD, r0, 0
#            #stacp       r0, 2, 0
#            #jnz         LABEL_SYNC_TLC_SOFT_READBACK_CHK_CPL_YIELD, r0, 0
#            setp        SETP_ID_ALL, 0, 0
#            #setp        2, 0, 0
#            #setp        13, 2, 0
#            wk          I_CL_READ_COL, C_WK_CTRL_A, LABEL_0
#
#LABEL_SYNC_TLC_SOFT_SINGLE_READ_CHK_LVL:
#            cklvl       r0, 1, 260
#            jne         LABEL_SYNC_TLC_SOFT_SINGLE_READ_CHK_LVL, r0, 0 , 1
#            offst.im    0
#            setcpl.breg   0, 220, 223
#            incptr.cpl  144
#LABEL_SYNC_TLC_SOFT_READBACK_RETURN_2K:         
#            reti        7, 0, 8, LABEL_SYNC_TLC_SOFT_READBACK_RETURN_2K             
#            setcpl.breg   1, 220, 223
#            setcpl.tm     68, 83
#            incptr.cpl  144
#
#LABEL_SYNC_TLC_SOFT_READBACK_RETURN_START:            
#            reti        7, 0, 0, LABEL_SYNC_TLC_SOFT_READBACK_RETURN_START          
##           sets        0, 5, 0
#            calre       1, LABEL_0                    
             


