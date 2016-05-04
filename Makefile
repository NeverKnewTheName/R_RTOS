#Makefile
# Created on: 04.05.2016
#     Author: Christian Neuberger (neubergerch50344@th-nuernberg.de)

# Project name
PROJECT = R_RTOS

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

#ROOT_PATH = C:/LabWrk/WorkSpace/R_RTOS_BUILD
#
#R_RTOS_SRC_PATH = $(ROOT_PATH)/Source
#HAL_BOARD_SRC_PATH = $(ROOT_PATH)/Source/include/portable/GCC/NXP_KL05
#HAL_BOARD_INC_PATH = $(ROOT_PATH)/Source/include/portable/GCC/NXP_KL05/include
#HAL_ARCH_INC_PATH = $(ROOT_PATH)/Source/include/portable/GCC/ARM_Cortex_M0+
#BSP_SRC_PATH = $(ROOT_PATH)/Source/include/portable/GCC/NXP_KL05/BSP
#BSP_INC_PATH = $(ROOT_PATH)/Source/include/portable/GCC/NXP_KL05/BSP/include
#BSP_STARTUP_PATH = $(ROOT_PATH)/Source/include/portable/GCC/NXP_KL05/BSP/startup
#BSP_LINKER_PATH = $(ROOT_PATH)/Source/include/portable/GCC/NXP_KL05/BSP/linker

R_RTOS_SRC_PATH = Source
R_RTOS_INC_PATH = Source/include
HAL_BOARD_SRC_PATH = Source/portable/GCC/NXP_KL05
HAL_BOARD_INC_PATH = Source/portable/GCC/NXP_KL05/include
HAL_ARCH_INC_PATH = Source/portable/GCC/ARM_Cortex_M0+
BSP_SRC_PATH = Source/portable/GCC/NXP_KL05/BSP
BSP_INC_PATH = Source/portable/GCC/NXP_KL05/BSP/include
BSP_STARTUP_PATH = Source/portable/GCC/NXP_KL05/BSP/startup
BSP_LINKER_PATH = Source/portable/GCC/NXP_KL05/BSP/linker


# sources
SRC += 	   $(R_RTOS_SRC_PATH)/R_RTOS_BitMagic.c \
		   $(R_RTOS_SRC_PATH)/R_RTOS_events.c \
		   $(R_RTOS_SRC_PATH)/R_RTOS_memMngr.c \
		   $(R_RTOS_SRC_PATH)/R_RTOS_monitor.c \
		   $(R_RTOS_SRC_PATH)/R_RTOS_msgQueuing.c \
		   $(R_RTOS_SRC_PATH)/R_RTOS_scheduler.c \
		   $(R_RTOS_SRC_PATH)/R_RTOS_sem.c \
		   $(R_RTOS_SRC_PATH)/R_RTOS_services.c \
		   $(R_RTOS_SRC_PATH)/R_RTOS_stack.c \
		   $(R_RTOS_SRC_PATH)/R_RTOS_system.c \
		   $(R_RTOS_SRC_PATH)/R_RTOS_SysTickTMR.c \
		   $(R_RTOS_SRC_PATH)/R_RTOS_task.c \
		   $(R_RTOS_SRC_PATH)/R_RTOS_timer.c \
		   main.c \
		   $(BSP_STARTUP_PATH)/system_MKL05Z4.c \
		   $(HAL_BOARD_SRC_PATH)/ClockFunc.c \
		   $(HAL_BOARD_SRC_PATH)/InterruptFunc.c \
		   $(HAL_BOARD_SRC_PATH)/PortFunc.c \
		   $(HAL_BOARD_SRC_PATH)/TimerFunc.c

ASRC += $(R_RTOS_SRC_PATH)/R_RTOS_PendSV.S \
	   	$(R_RTOS_SRC_PATH)/R_RTOS_SVC.S \
		$(BSP_STARTUP_PATH)/startup_MKL05Z4.S

# headers
HEADERS += $(R_RTOS_INC_PATH)/R_RTOS_inc.h \
		   $(R_RTOS_INC_PATH)/R_RTOS_BitMagic.h \
		   $(R_RTOS_INC_PATH)/R_RTOS_events.h \
		   $(R_RTOS_INC_PATH)/R_RTOS_memMngr.h \
		   $(R_RTOS_INC_PATH)/R_RTOS_monitor.h \
		   $(R_RTOS_INC_PATH)/R_RTOS_msgQueuing.h \
		   $(R_RTOS_INC_PATH)/R_RTOS_scheduler.h \
		   $(R_RTOS_INC_PATH)/R_RTOS_sem.h \
		   $(R_RTOS_INC_PATH)/R_RTOS_services.h \
		   $(R_RTOS_INC_PATH)/R_RTOS_stack.h \
		   $(R_RTOS_INC_PATH)/R_RTOS_system.h \
		   $(R_RTOS_INC_PATH)/R_RTOS_SysTickTMR.h \
		   $(R_RTOS_INC_PATH)/R_RTOS_task.h \
		   $(R_RTOS_INC_PATH)/R_RTOS_timer.h \
		   $(HAL_ARCH_INC_PATH)/core_cm0Plus.h \
		   $(HAL_ARCH_INC_PATH)/core_cmFunc.h \
		   $(HAL_ARCH_INC_PATH)/core_cmInstr.h \
		   $(BSP_INC_PATH)/MKL05Z4.h \
		   $(BSP_INC_PATH)/system_MKL05Z4.h \
		   $(HAL_BOARD_INC_PATH)/ClockFunc.h \
		   $(HAL_BOARD_INC_PATH)/InterruptFunc.h \
		   $(HAL_BOARD_INC_PATH)/PortFunc.h \
		   $(HAL_BOARD_INC_PATH)/TimerFunc.h

INC_PATH =  -I$(R_RTOS_INC_PATH) -I$(HAL_ARCH_INC_PATH) -I$(BSP_INC_PATH) -I$(HAL_BOARD_INC_PATH)

# flags and other settings
# use -msoft-float for MCU without floating point unit (default)
# use -mhard-float for MCU with floating point unit
ARMCPU = cortex-m0plus
CCFLAGS = -mcpu=$(ARMCPU) -mthumb
LDSCRIPT = $(BSP_LINKER_PATH)/MKL05Z32xxx4_flash.ld
#DEFINES = 

# Complile location
ARMGCC = C:/Freescale/KDS_3.0.0/toolchain/bin

# Tools used here
CC      = $(ARMGCC)/arm-none-eabi-gcc
AS      = $(CC) -x assembler-with-cpp
LD      = $(ARMGCC)/arm-none-eabi-g++
OBJCOPY = $(ARMGCC)/arm-none-eabi-objcopy
RM		= rm -f

CCFLAGS +=  -g -Wall -fmessage-length=0
COBJS = $(SRC:%.c=%.o)
AOBJS = $(ASRC:%.S=%.o)
OBJS =  $(COBJS) $(AOBJS)
LIBS =
TARGET_EXT = elf
TARGET =  $(PROJECT).$(TARGET_EXT)

$(AOBJS): $(ASRC)
	$(AS) $(CCFLAGS) $(ADEFS) -o $@ -c $<

$(COBJS): $(SRC)
	$(CC) $(CCFLAGS) $(CDEFS) $(INC_PATH) -o $@ -c $<

# --- Link and generate elf, map and S-record file ---
# -nodefaultlibs for linking no lib or
# -lm for linking math lib
# -lc for linking libc.a or -L$(ARMLIB) -lc
# -lgcc for linking libgcc.a or -L$(ARMLIB) -lgcc
$(TARGET):  $(OBJS)
	$(LD) -v -g -mcpu=$(ARMCPU) -mthumb -lc -nostartfiles -T$(LDSCRIPT) -o $(@:%.srec=%.elf) $(AOBJS) $(COBJS) -Wl,-Map,$(@:%.srec=%.map)
	$(OBJCOPY) -O srec --srec-forceS3 $(@:%.srec=%.elf) $@

all : $(TARGET)
	@echo Target $(TARGET) done

clean:
	$(RM) $(COBJS) 
	$(RM) $(AOBJS)
	$(RM) $(TARGET)
	$(RM) *.elf *.lst *.map *~ *.bak *.s *.o