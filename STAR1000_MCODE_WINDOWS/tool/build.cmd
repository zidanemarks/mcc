@echo off
if "%1"=="help" (goto help) else (goto compiler)
:compiler
if "%1"=="no_param" (goto no_param) else (goto compiler_continue)
:compiler_continue
@echo "=================================================="
@echo " build.cmd <model_name>  <mode num>               "
@echo "                                                  "
@echo " Example:                                         "
@echo "      build.cmd L85A       mode6                  "
@echo " <OR>                                             "
@echo "      build.cmd L06B       mode8                  "
@echo " <OR>                                             "
@echo "      build.cmd BICS2      mode7 +define1+define2 "
@echo " <OR>                                             "
@echo "      build.cmd no_param                          "
@echo "=================================================="
@echo "Generate Work Program ..."
..\tool\mcitfc.py c_work_program_%1_%2.svh
..\tool\hex2bin.py c_work_program_%1_%2.hex
@echo "Generate Manager Program ..."
if "%3"=="" (goto nodef) else (goto def)
:def
..\tool\mcpmc2as.py c_mng_program_%1_%2.mc --define %3
goto left
:nodef
..\tool\mcpmc2as.py c_mng_program_%1_%2.mc
:left
..\tool\mcas.py     c_mng_program_%1_%2.ins
..\tool\hex2bin.py c_mng_program_%1_%2.hex
@echo off
goto end
:no_param
@echo "Generate Work Program for no parameter ..."
..\tool\mcitfc.py c_work_program.svh
..\tool\hex2bin.py c_work_program.hex
@echo "Generate Manager Program for no parameter ..."
..\tool\mcpmc2as.py c_mng_program.mc
..\tool\mcas.py     c_mng_program.ins
..\tool\hex2bin.py  c_mng_program.hex
:help
@echo "=================================================="
@echo " build.cmd <model_name>  <mode num>               "
@echo "                                                  "
@echo " Example:                                         "
@echo "      build.cmd L85A       mode6                  "
@echo " <OR>                                             "
@echo "      build.cmd L06B       mode8                  "
@echo " <OR>                                             "
@echo "      build.cmd BICS2      mode7 +define1+define2 "
@echo " <OR>                                             "
@echo "      build.cmd no_param                          "
@echo "=================================================="
:end
@pause
