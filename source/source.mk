#INC_PATH += \
#-I../source

CSRC += \
../source/main.c 

ASRC +=

OBJS += \
./source/main.o 

source/%.o: ../source/%.c
	@echo 'Building target: $@'
	@echo 'Invoking: $(CC)'
	$(CC) $(CCFLAGS) $(COMPFLAGS) $(CDEFS) $(INC_PATH) -o $@ -c $<
	@echo 'Done building target: $@'
	@echo ' '