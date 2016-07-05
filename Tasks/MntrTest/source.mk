INC_PATH += \
-I../Tasks/MntrTest/RWR \
#-I ../Tasks/MntrTest/RRW

CURCSRC += \
../Tasks/MntrTest/RWR/Tasks.c \
#../Tasks/MntrTest/RRW/Tasks.c \

CSRC += \
$(CURCSRC)

ASRC +=

OBJS += \
./Tasks/Tasks.o

Tasks/%.o: $(CURCSRC)
	@echo 'Building target: $@'
	@echo 'Invoking: $(CC)'
	$(CC) $(CCFLAGS) $(COMPFLAGS) $(CDEFS) $(INC_PATH) -o $@ -c $<
	@echo 'Done building target: $@'
	@echo ' '