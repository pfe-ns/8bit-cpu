# 8-bit Processor

## Updates:
*30.09.2016.* - First successfull test of ALU addition  
*08.10.2016.* - Added Control Unit , ALU completely working  
*13.10.2016.* - Added Ram and more commands to Control Unit  
*19.10.2016.* - Added Registers ( Only internal)  
*27.10.2016.* - Added Program Counter  
*03.11.2016.* - Added CPU.vhd and finished first successfull CPU test  
*17.11.2016.* - Added USB Controller  

## ALU    
`alu_input_1` - first ALU input ( 8 bit)  
`alu_input_2` - second ALU input ( 8 bit)  
`alu_output` - output signal of ALU ( 8 bit)  
`busy` - one bit signal that tells us if ALU is busy or not  
`clk` - clock input  

## Control Unit     
`command` - command that we get from RAM ( 8 bit)   
`alu_command` - command that will be parsed to ALU ( 8 bit)     
`ram_command` - command that will be parsed to RAM ( 1 bit)   
`clk` - clock input for Control Unit (will be connected to ALU clock)    

## RAM     
`clk` - clock input    
`ram_data_in` - input data (8 bit)  
`ram_data_out` - output data ( 8 bit)    
`ram_address` - address in RAM that we want write or read from ( 8 bit)  
`ram_command` - tells RAM that we  want to read `0` or write `1` ( 1 bit)     

## Registers
### Internal registers
`clk` - clock input  
`register_input` - input data ( 8 bit)  
`register_data` - internal register data ( 8 bit)   
`register_output` - register output ( 8 bit)   
`command`  - for wtiting or reading (1 bit)   

### GPIO Registers
#### ADC
#### DAC

## Program counter
`clk` - clock input     
`pc_input` - Program Counter input (for loading value) ( 8 bit)        
`pc_output` - output value ( 8 bit)   
`pc_internal_state` - internal value ( 8 bit)   
`pc_command` - Program Counter command ( 4 bit)

## Memory address register

## Display driver

## Serial protocols
### I2C
### OneWire
### RS232
### USB

## USB controller
`clk` - clock input  
`rx` - Byte that CPU will receive (8 bit)  
`tx` - Byte that CPU will output (8 bit)  
`data` - Received data or data that CPU will send (8 bit)    
`USB_command` - 4 bit command that tells CPU to send or to receive data (4 bit)
