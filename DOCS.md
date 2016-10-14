# 8-bit Processor

## Updates:
*30.9.2016* - First successfull test of ALU addition  
*8.10.2016* - Added Control Unit , ALU completely working  
*13.10.2016* - Added Ram and more commands to Control Unit  

## ALU    
`alu_input_1` - first ALU input ( 4 bit)  
`alu_input_2` - second ALU input ( 4 bit)  
`alu_output` - output signal of ALU ( 4 bit)  
`busy` - one bit signal that tells us if ALU is busy or not  
`clk` - clock input  

## Control Unit     
`command` - command that we get from RAM  
`alu_command` - command that will be parsed to ALU  
`ram_command` - command that will be parsed to RAM  
`clk` - clock input for Control Unit (will be connected to ALU clock)    

## RAM     
`clk` - clock input    
`ram_data_in` - input data  
`ram_data_out` - output data  
`ram_address` - address in RAM that we want write or read from  
`ram_command` - tells RAM that we  want to read `0` or write `1`

## Registers
### Internal registers
### GPIO Registers
#### ADC
#### DAC

## Program counter

## Memory address register

## Display driver

## Serial protocols
### I2C
### OneWire
### RS232
### USB

## USB controller
