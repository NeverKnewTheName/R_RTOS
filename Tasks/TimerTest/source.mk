INC_PATH += \
-I../Tasks/TimerTest

CSRC += \
../Tasks/TimerTest/Tasks.c

ASRC +=

OBJS += \
./Tasks/Tasks.o

Tasks/%.o: ../Tasks/TimerTest/%.c
	@echo 'Building target: $@'
	@echo 'Invoking: $(CC)'
	$(CC) $(CCFLAGS) $(COMPFLAGS) -std=c99 $(CDEFS) $(INC_PATH) -o $@ -c $<
	@echo 'Done building target: $@'
	@echo ' '