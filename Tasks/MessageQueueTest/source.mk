INC_PATH += \
-I../Tasks/MessageQueueTest

CSRC += \
../Tasks/MessageQueueTest/Tasks.c

ASRC +=

OBJS += \
./Tasks/Tasks.o

Tasks/%.o: ../Tasks/MessageQueueTest/%.c
	@echo 'Building target: $@'
	@echo 'Invoking: $(CC)'
	$(CC) $(CCFLAGS) $(COMPFLAGS) -std=c99 $(CDEFS) $(INC_PATH) -o $@ -c $<
	@echo 'Done building target: $@'
	@echo ' '