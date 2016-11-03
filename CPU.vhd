----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:20:36 11/02/2016 
-- Design Name: 
-- Module Name:    CPU - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU is
	
	Port ( alu_input_1 : IN  STD_LOGIC_VECTOR (7 downto 0); -- first ALU input ( 4 bit)
           alu_input_2 : IN STD_LOGIC_VECTOR (7 downto 0); -- second ALU input ( 4 bit)
           alu_output : OUT  STD_LOGIC_VECTOR (7 downto 0); -- output signal of ALU ( 4 bit)
           alu_command : IN STD_LOGIC_VECTOR (7 downto 0); -- one bit signal that tells us if ALU is busy or not
			  busy : INOUT STD_LOGIC; 
			  clk : IN STD_LOGIC; -- clock input		  
	
			 command : IN STD_LOGIC_VECTOR(7 downto 0); -- comamnd that comes from memory
			 alu_command_o : INOUT STD_LOGIC_VECTOR(7 downto 0); -- command that we will parse to ALU
			 ram_command_o : INOUT STD_LOGIC; -- command that we will parse to RAM
			 pc_command_o : INOUT STD_LOGIC_VECTOR (3 downto 0); -- command tat we will parse to Program_Counter
			  
			register_input : IN STD_LOGIC_VECTOR (7 downto 0); -- input data
			register_data : INOUT STD_LOGIC_VECTOR (7 downto 0); -- internal data
			register_output : OUT STD_LOGIC_VECTOR (7 downto 0); -- output data
			register_command : IN STD_LOGIC;
			
			pc_input : IN STD_LOGIC_VECTOR (7 downto 0); -- we use this if we want to jump specified address
			pc_output : OUT STD_LOGIC_VECTOR (7 downto 0); -- counter output
			pc_internal_state : INOUT STD_LOGIC_VECTOR (7 downto 0); -- internal state
			pc_command : IN STD_LOGIC_VECTOR (3 downto 0)
			  
			);

end CPU;

architecture Structural of CPU is

	component ALU
	
		Port ( alu_input_1 : IN  STD_LOGIC_VECTOR (7 downto 0); -- first ALU input ( 4 bit)
           alu_input_2 : IN STD_LOGIC_VECTOR (7 downto 0); -- second ALU input ( 4 bit)
           alu_output : OUT  STD_LOGIC_VECTOR (7 downto 0); -- output signal of ALU ( 4 bit)
           alu_command : IN STD_LOGIC_VECTOR (7 downto 0); -- one bit signal that tells us if ALU is busy or not
			  busy : INOUT STD_LOGIC; 
			  clk : IN STD_LOGIC -- clock input
			  );
	
	end component;
	
	component Control_Unit
	
	port(
	
	command : IN STD_LOGIC_VECTOR(7 downto 0); -- comamnd that comes from memory
	alu_command_o : INOUT STD_LOGIC_VECTOR(7 downto 0); -- command that we will parse to ALU
	ram_command_o : INOUT STD_LOGIC; -- command that we will parse to RAM
	pc_command_o : INOUT STD_LOGIC_VECTOR (3 downto 0); -- command tat we will parse to Program_Counter
	clk : IN STD_LOGIC
	
	);
	
	end component;
	
	component Internal_Register
	
	port(
			
			clk : IN STD_LOGIC; -- clock input
			register_input : IN STD_LOGIC_VECTOR (7 downto 0); -- input data
			register_data : INOUT STD_LOGIC_VECTOR (7 downto 0); -- internal data
			register_output : OUT STD_LOGIC_VECTOR (7 downto 0); -- output data
			register_command : IN STD_LOGIC
			
	);
	
	end component;
	
	component Program_Counter
	
	port(
			
			clk : IN STD_LOGIC; -- clock input
			pc_input : IN STD_LOGIC_VECTOR (7 downto 0); -- we use this if we want to jump specified address
			pc_output : OUT STD_LOGIC_VECTOR (7 downto 0); -- counter output
			pc_internal_state : INOUT STD_LOGIC_VECTOR (7 downto 0); -- internal state
			pc_command : IN STD_LOGIC_VECTOR (3 downto 0)
			
	);
	
	end component;

begin
	
	ALU_MAP : ALU port map (alu_input_1,alu_input_2,alu_output,alu_command,busy,clk);
	CONTROL_UNIT_MAP : Control_Unit port map (command,alu_command_o,ram_command_o,pc_command_o,clk);
	INTERNAL_REGISTER_MAP : Internal_Register port map (clk,register_input,register_data,register_output,register_command);
	PROGRAM_COUNTER_MAP : Program_Counter port map (clk,pc_input,pc_output,pc_internal_state,pc_command);

end Structural;

