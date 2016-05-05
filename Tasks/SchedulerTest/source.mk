INC_PATH += \
-I../Tasks/SchedulerTest

CSRC += \
../Tasks/SchedulerTest/Tasks.c

ASRC +=

OBJS += \
./Tasks/Tasks.o

Tasks/%.o: ../Tasks/SchedulerTest/%.c
	@echo 'Building target: $@'
	@echo 'Invoking: $(CC)'
	$(CC) $(CCFLAGS) $(COMPFLAGS) -std=c99 $(CDEFS) $(INC_PATH) -o $@ -c $<
	@echo 'Done building target: $@'
	@echo ' '