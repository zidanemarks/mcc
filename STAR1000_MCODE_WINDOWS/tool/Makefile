# This makefile is intended for use with GNU make
TARGET=nvme_ifw

MODEL:=L85A
ITFC:=mode8
BASE:=1024
DEF:=""

PREFIX="../tool"
RM= rm -rf
CP= cp -rf

run: all concat
run_b0kb: all_b0kb concat_b0kb
run_b16a: all_b0kb concat_b0kb
run_b17a: all_b0kb concat_b0kb
run_l85a: all_b0kb concat_b0kb
run_l85c: all_b0kb concat_b0kb
run_t15n: all_b0kb concat_b0kb
run_n18:  all_b0kb concat_b0kb
run_ymtc:  all_b0kb concat_b0kb
all: c_work_program_$(MODEL)_$(ITFC).bin c_mng_program_$(MODEL)_$(ITFC).bin
	$(info Generated all NFI microcodes)

all_b0kb: c_mng_program_$(MODEL)_$(ITFC).bin c_work_program_$(MODEL)_$(ITFC)_wkc.hex
	$(info Generated all NFI microcodes)

c_work_program_$(MODEL)_$(ITFC).bin: c_work_program_$(MODEL)_$(ITFC).svh
	$(info Generating: $@)
	@$(PREFIX)/mcitfc.py c_work_program_$(MODEL)_$(ITFC).svh
	@$(PREFIX)/hex2bin.py c_work_program_$(MODEL)_$(ITFC).hex

c_work_program_$(MODEL)_$(ITFC)_wkc.hex: c_work_program_$(MODEL)_$(ITFC).wkc
	$(info Generating: $@)
	@$(PREFIX)/wkspec2code.py --wkc=c_work_program_$(MODEL)_$(ITFC).wkc --spec=Micron-B0KB_wk.xls
	@$(PREFIX)/hex2bin.py c_work_program_$(MODEL)_$(ITFC)_wkc.hex

c_mng_program_$(MODEL)_$(ITFC).ins: c_mng_program_$(MODEL)_$(ITFC).mc
	$(PREFIX)/mcpmc2as.py c_mng_program_$(MODEL)_$(ITFC).mc --define $(DEF)
	@if [ $$? -eq 1 ] ;              \
	    then 		                 \
	    echo $?                      \
	    echo "Error $? Mcode failed" \
	    exit 0 ;                     \
	fi

c_mng_program_$(MODEL)_$(ITFC).bin: c_mng_program_$(MODEL)_$(ITFC).ins
	$(info Generating: $@)
	@$(PREFIX)/mcas.py c_mng_program_$(MODEL)_$(ITFC).ins
	@$(PREFIX)/hex2bin.py c_mng_program_$(MODEL)_$(ITFC).hex
concat:    
	@$(PREFIX)/concat_ucode.py c_work_program_$(MODEL)_$(ITFC).hex c_mng_program_$(MODEL)_$(ITFC).hex  c_mcode_instruction_$(MODEL)_$(ITFC).hex $(BASE)

concat_b0kb: 
	#$(RM) c_work_program_$(MODEL)_$(ITFC).hex
	$(CP) c_work_program_$(MODEL)_$(ITFC)_wkc.hex c_work_program_$(MODEL)_$(ITFC).hex
	@$(PREFIX)/concat_ucode.py c_work_program_$(MODEL)_$(ITFC)_wkc.hex c_mng_program_$(MODEL)_$(ITFC).hex  c_mcode_instruction_$(MODEL)_$(ITFC).hex $(BASE)


clean:
	# $(RM) *.hex *.bin *.dis
	$(RM) c_work_program_*.hex c_mng_program_*.hex c_mng_program_*.dis c_mcode_instruction_*.hex c_mng_program_*.bin c_mng_program_*.ins c_work_program_*.bin

help:
	@echo "================================================================================================="
	@echo " make MODEL=<model_name>  ITFC=<mode num>               ### Case Sensitive!!!                    "
	@echo "                                                                                                 "
	@echo " Example:                                                                                        "
	@echo "      make MODEL=L85A        ITFC=mode6                                                          "
	@echo " <OR>                                                                                            "
	@echo "      make MODEL=warmup_L85A ITFC=mode6                                                          "
	@echo " <OR>                                                                                            "
	@echo "      make MODEL=L06B        ITFC=mode8                                                          "
	@echo " <OR>                                                                                            "
	@echo "      make MODEL=BICS2       ITFC=mode6   BASE=1024 DEF=+define1+define2   ### 1024=0x400        "
	@echo " <OR>                                                                                            "
	@echo "      make MODEL=3DV4        ITFC=mode6   BASE=1024 DEF=+define1+define2   ### 1024=0x400        "
	@echo " <OR>                                                                                            "
	@echo "      make MODEL=14NM        ITFC=mode7   BASE=1024 DEF=+define1+define2   ### 1024=0x400        "
	@echo " <OR>                                                                                            "
	@echo "      make run_b0kb MODEL=B0KB     ITFC=mode7   BASE=1024 DEF=+define1+define2  ### 1024=0x400   "
	@echo " <OR>                                                                                            "
	@echo "      make run_l85a MODEL=L85A     ITFC=mode6   BASE=1024 DEF=+define1+define2  ### 1024=0x200   "
	@echo " <OR>                                                                                            "
	@echo "      make run_l85c MODEL=L85C     ITFC=mode6   BASE=1024 DEF=+define1+define2  ### 1024=0x400   "
	@echo " <OR>                                                                                            "
	@echo "      make run_t15n MODEL=T15N     ITFC=mode6   BASE=1024 DEF=+define1+define2  ### 1024=0x400   "
	@echo " <OR>                                                                                            "
	@echo "      make run_b16a MODEL=B16A     ITFC=mode8   BASE=1024 DEF=+define1+define2  ### 1024=0x400   "
	@echo " <OR>                                                                                            "
	@echo "      make run_b17a MODEL=B17A     ITFC=mode8   BASE=1024 DEF=+define1+define2  ### 1024=0x400   "
	@echo " <OR>                                                                                            "
	@echo "      make run_n18  MODEL=N18      ITFC=mode8   BASE=1024 DEF=+define1+define2  ### 1024=0x400   "
	@echo " <OR>                                                                                            "
	@echo "      make run_ymtc  MODEL=YMTC    ITFC=mode7   BASE=1024 DEF=+define1+define2  ### 1024=0x400   "
	@echo "================================================================================================="

.PHONY: help
