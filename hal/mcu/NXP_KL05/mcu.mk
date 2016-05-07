INC_PATH += \
-I../hal/mcu/$(MCU) \
-I../hal/mcu/$(MCU)/BSP \
-I../hal/mcu/$(MCU)/BSP/include \
-I../hal/mcu/$(MCU)/BSP/startup \
-I../hal/mcu/$(MCU)/include \
-I../hal/mcu/$(MCU)/source

CSRC += \
../hal/mcu/$(MCU)/source/ClockFunc.c \
../hal/mcu/$(MCU)/source/InterruptFunc.c \
../hal/mcu/$(MCU)/source/PortFunc.c \
../hal/mcu/$(MCU)/source/TimerFunc.c \
../hal/mcu/$(MCU)/BSP/startup/system_MKL05Z4.c

ASRC += \
../hal/mcu/$(MCU)/BSP/startup/startup_MKL05Z4.S

OBJS +=  \
./hal/mcu/$(MCU)/source/ClockFunc.o \
./hal/mcu/$(MCU)/source/InterruptFunc.o \
./hal/mcu/$(MCU)/source/PortFunc.o \
./hal/mcu/$(MCU)/source/TimerFunc.o \
./hal/mcu/$(MCU)/BSP/startup/system_MKL05Z4.o \
./hal/mcu/$(MCU)/BSP/startup/startup_MKL05Z4.o


hal/mcu/$(MCU)/BSP/startup/%.o: ../hal/mcu/$(MCU)/BSP/startup/%.S
	@echo 'Building target: $@'
	@echo 'Invoking: $(AS)'
	$(AS) $(CCFLAGS) $(ADEFS) $(INC_PATH) -o $@ -c $<
	@echo 'Done building target: $@'
	@echo ' '
	
hal/mcu/$(MCU)/BSP/startup/%.o: ../hal/mcu/$(MCU)/BSP/startup/%.c
	@echo 'Building target: $@'
	@echo 'Invoking: $(CC)'
	$(CC) $(CCFLAGS) $(COMPFLAGS) $(CDEFS) $(INC_PATH) -o $@ -c $<
	@echo 'Done building target: $@'
	@echo ' '

hal/mcu/$(MCU)/source/%.o: ../hal/mcu/$(MCU)/source/%.c
	@echo 'Building target: $@'
	@echo 'Invoking: $(CC)'
	$(CC) $(CCFLAGS) $(COMPFLAGS) $(CDEFS) $(INC_PATH) -o $@ -c $<
	@echo 'Done building target: $@'
	@echo ' '