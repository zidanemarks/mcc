C_OP_ICD   = 4'h0;         //Issuse Command direct
C_OP_IC    = 4'h1;         //Issuse Command
C_OP_WC    = 4'h2;         //Waite Cycles
C_OP_WI    = 4'h3;         //Write Interface
C_OP_WIDDR = 4'h4;         //Write Interface DDR
C_OP_RI    = 4'h5;         //Read Interface
C_OP_RIDDR = 4'h6;         //Read Interface DDR
C_OP_CL    = 4'h7;         //Change the instruction line
C_OP_IE    = 4'hf;         //Insreuction End
C_PAGE_SIZE = 16'd18432;
C_PROG_SIZE = 16'd9216;
C_ITF_DATA=0
C_ITF_CMD=1
C_ITF_ADDR=2
C_ITF_IDLE=4
C_ITF_PRE_CMD=5
C_ITF_PRE_ADDR=6
//L0 Reset(0xFF)
//L1 Async Read Status (0x70) 
//L2 Async Read ID (0x90)
//L3
//L4 Sync Read Status (0x70)
//L5 SET FEATURE (0xEF-<FA>-<P1>-<P2>-<P3>-<P4>)
//L6 SET FEATURE (Data Part)
//L7 GET FEATURE BY ADDR ( 0xEE - 0xFA)
//L8 Sync Read Status (0x78)
//L9 ERASE (0x60- 0xD0)
//L10 PAGE PROGRAME  (0x80/0x81 - A1-A2-A3-A4-A5 -<DATA> 0x10/0x11)
//L11 RESET LUN (0xFA)
//L12 PAGE READ CMD (0x00 - A1-A2-A3-A4-A5 0x30/0x31/0x32)
//L13 READ COLUMN ENHANCED (0x06 A1-A2-A3-A4-A5 0xE0) (TBD)
//L14 READ OUT PART 2
//L15 SET FEATURE BY LUN (0xD5)
//L16 SET FEATURE BY LUN PART 2(0xD5)
//L17 ASYNC READ STATUS (0x71)
//L18 GET FEATURE BY LUN (0xD4)
//L19 SYNC READ ID (0x90) (PARAM TBD)
//L20
//L21
//L22 READ BACK 4K DATA
//L23
//L24
//L25
//L26
//L27 ISSUE CMD
//L28 ISSUE ADDR
//L29 ASYNC READ 1 BYTE
//L30 SYNC READ 8 BYTES
//L31 SYNC WRITE DATA 2 BYTE
//L32
//L33 RAW ISSUE DATA
//L34
//L35 SYNC READ 2 BYTES
//L36 SYNC WRITE 8 BYTES 1/2
//L37 SYNC WRITE 8 BYTES 2/2
//L38 ASYNC READ 4 BYTE
//L39 ASYNC WRITE 4 BYTE
//L40
//L41
//L42
//L43
//L44
//L45
//L46
//L47 PROGRAM DUMMY
//L48
//L49 SYNC READ STATUS 71H
//L50 MP2 ERASE
//L51
//L52
//L53
//L54 ISSUE CACHE READ LAST 3FH
//L55
//L56 PROGRAM_POST
//L57
//L58
//L59
//L60
//L61
//L62
//L63
