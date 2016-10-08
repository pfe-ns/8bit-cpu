#8-bit Processor

*9.30.2016* - First successfull test of ALU addition
*8.10.2016* - Added Control Unit

# ALU consists of 6 signals
alu_input_1 - first ALU input ( 4 bit)  
alu_input_2 - second ALU input ( 4 bit)  
alu_output - output signal of ALU ( 4 bit)  
busy - one bit signal that tells us if ALU is busy or not  
clk - clock input  

##Control Unit consistes of 6 signals but more will be added
Ram_Input - command that we get from RAM
alu_command - command that will be parsed to ALU
ram_command - command that will be parsed to RAM
clk - clock input for Control Unit (will be connected to ALU clock)s