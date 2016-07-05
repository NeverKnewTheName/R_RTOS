INC_PATH += \
-I../Tasks/MtxTest

CSRC += \
../Tasks/MtxTest/Tasks.c

ASRC +=

OBJS += \
./Tasks/Tasks.o

Tasks/%.o: ../Tasks/MtxTest/%.c
	@echo 'Building target: $@'
	@echo 'Invoking: $(CC)'
	$(CC) $(CCFLAGS) $(COMPFLAGS) $(CDEFS) $(INC_PATH) -o $@ -c $<
	@echo 'Done building target: $@'
	@echo ' '