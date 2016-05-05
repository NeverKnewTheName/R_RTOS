#Makefile
# Created on: 04.05.2016
#     Author: Christian Neuberger (neubergerch50344@th-nuernberg.de)

# Project name
PROJECT = R_RTOS

MCU := NXP_KL05
PROC := ARM_cortex-m0plus

# Output directory
OUT_DIR := build

LINKER_FILE_PATH := ../hal/mcu/$(MCU)/BSP/linker

# Default C defines
DDEFS =

# Default ASM defines
DADEFS =

# User C defines
UDEFS =

# ASM defines
UADEFS =

CDEFS = $(DDEFS) $(UDEFS)
ADEFS = $(DADEFS) $(UADEFS)

# flags and other settings
ARMCPU := cortex-m0plus
CCFLAGS := -mcpu=$(ARMCPU) -mthumb -g3 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -Wextra -Wmissing-declarations -Wconversion -Wfloat-equal
COMPFLAGS :=  -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" 
LDSCRIPT := $(LINKER_FILE_PATH)/MKL05Z32xxx4_flash.ld
#DEFINES = 

# Complile location
ARMGCC := C:/Freescale/KDS_3.0.0/toolchain/bin
TCPRFX := arm-none-eabi-
# Tools used here
CC      := $(ARMGCC)/$(TCPRFX)gcc
AS      := $(CC) -x assembler-with-cpp
LD      := $(ARMGCC)/$(TCPRFX)g++
OBJCOPY := $(ARMGCC)/$(TCPRFX)objcopy
SZ		:= $(ARMGCC)/$(TCPRFX)size
RM		:= rm -rf
MKDIR   := mkdir

LIBS =
TARGET_EXT = elf
SIZE_EXT = siz
TARGET =  $(PROJECT).$(TARGET_EXT)
SIZE = $(PROJECT).$(SIZE_EXT)

#included makefiles
-include ../source/source.mk
-include ../source/R_RTOS/R_RTOS.mk
-include ../hal/mcu/$(MCU)/mcu.mk
-include ../hal/proc/$(PROC)/proc.mk

#include the task!
#-include ../Tasks/EventTest/source.mk
-include ../Tasks/MessageQueueTest/source.mk
#-include ../Tasks/SchedulerTest/source.mk
#-include ../Tasks/SemTest/source.mk
#-include ../Tasks/SysTickTest/source.mk
#-include ../Tasks/TimerTest/source.mk

all : build_directory_tree $(TARGET) secondary_build
	@echo Target $(TARGET) done

# --- Link and generate elf, map and S-record file ---
$(TARGET):  $(OBJS)
	@echo 'Building target: $@'
	@echo 'Objects: $(OBJS)'
	@echo 'Invoking: $(LD)'
	$(LD) -mcpu=cortex-m0plus -mthumb -g3 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -Wextra -Wmissing-declarations -Wconversion -Wfloat-equal -T$(LDSCRIPT)  -Xlinker --gc-sections -Wl,-Map,$(PROJECT).map  -specs=nano.specs -specs=nosys.specs -o $(TARGET) $(OBJS)
	@echo 'Done building target: $@'
	@echo ' '

$(SIZE): $(TARGET)
	@echo 'Printing size'
	@echo 'Invoking: $(SZ)'
	$(SZ) --format=sysv $(TARGET)
	@echo '$@ done'
	@echo ' '

# Other

build_directory_tree:
	@echo 'Building directory tree'
	$(shell $(MKDIR) source)
	$(shell $(MKDIR) source\R_RTOS)
	$(shell $(MKDIR) Tasks)
	$(shell $(MKDIR) hal)
	$(shell $(MKDIR) hal\mcu)
	$(shell $(MKDIR) hal\mcu\$(MCU))
	$(shell $(MKDIR) hal\mcu\$(MCU)\source)
	$(shell $(MKDIR) hal\mcu\$(MCU)\BSP)
	$(shell $(MKDIR) hal\mcu\$(MCU)\BSP\startup)
	$(shell $(MKDIR) hal\proc)
	$(shell $(MKDIR) hal\proc\$(PROC))

secondary_build : $(SIZE)

clean:
	@echo 'invoking $@'
#	$(RM) $(COBJS) 
#	$(RM) $(AOBJS)
#	$(RM) $(TARGET)
	$(RM) $(SIZE) $(TARGET) $(OBJS)
	@echo '$@ done'
	@echo ' '
	
	
.PHONY: all clean