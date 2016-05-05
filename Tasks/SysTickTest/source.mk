INC_PATH += \
-I../Tasks/SysTickTest

CSRC += \
../Tasks/SysTickTest/Tasks.c

ASRC +=

OBJS += \
./Tasks/Tasks.o

Tasks/%.o: ../Tasks/SysTickTest/%.c
	@echo 'Building target: $@'
	@echo 'Invoking: $(CC)'
	$(CC) $(CCFLAGS) $(COMPFLAGS) -std=c99 $(CDEFS) $(INC_PATH) -o $@ -c $<
	@echo 'Done building target: $@'
	@echo ' '