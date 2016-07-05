INC_PATH += \
-I../source/R_RTOS \
-I../include

CSRC += \
../source/R_RTOS/R_RTOS_BitMagic.c \
../source/R_RTOS/R_RTOS_events.c \
../source/R_RTOS/R_RTOS_memMngr.c \
../source/R_RTOS/R_RTOS_monitor.c \
../source/R_RTOS/R_RTOS_msgQueuing.c \
../source/R_RTOS/R_RTOS_scheduler.c \
../source/R_RTOS/R_RTOS_mtx.c \
../source/R_RTOS/R_RTOS_sem.c \
../source/R_RTOS/R_RTOS_services.c \
../source/R_RTOS/R_RTOS_stack.c \
../source/R_RTOS/R_RTOS_system.c \
../source/R_RTOS/R_RTOS_SysTickTMR.c \
../source/R_RTOS/R_RTOS_task.c \
../source/R_RTOS/R_RTOS_timer.c 

ASRC += \
../source/R_RTOS/R_RTOS_PendSV.S \
../source/R_RTOS/R_RTOS_SVC.S 

OBJS += \
./source/R_RTOS/R_RTOS_BitMagic.o \
./source/R_RTOS/R_RTOS_events.o \
./source/R_RTOS/R_RTOS_memMngr.o \
./source/R_RTOS/R_RTOS_monitor.o \
./source/R_RTOS/R_RTOS_msgQueuing.o \
./source/R_RTOS/R_RTOS_scheduler.o \
./source/R_RTOS/R_RTOS_mtx.o \
./source/R_RTOS/R_RTOS_sem.o \
./source/R_RTOS/R_RTOS_services.o \
./source/R_RTOS/R_RTOS_stack.o \
./source/R_RTOS/R_RTOS_system.o \
./source/R_RTOS/R_RTOS_SysTickTMR.o \
./source/R_RTOS/R_RTOS_task.o \
./source/R_RTOS/R_RTOS_timer.o \
./source/R_RTOS/R_RTOS_PendSV.o \
./source/R_RTOS/R_RTOS_SVC.o 

source/R_RTOS/%.o: ../source/R_RTOS/%.S
	@echo 'Building target: $@'
	@echo 'Invoking: $(AS)'
	$(AS) $(CCFLAGS) $(ADEFS) $(INC_PATH) -o $@ -c $<
	@echo 'Done building target: $@'
	@echo ' '
	
source/R_RTOS/%.o: ../source/R_RTOS/%.c
	@echo 'Building target: $@'
	@echo 'Invoking: $(CC)'
	$(CC) $(CCFLAGS) $(COMPFLAGS) $(CDEFS) $(INC_PATH) -o $@ -c $<
	@echo 'Done building target: $@'
	@echo ' '