----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:24:44 10/08/2016 
-- Design Name: 
-- Module Name:    Control_Unit - Behavioral 
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

entity Control_Unit is

	port(
	
	command : IN STD_LOGIC_VECTOR(7 downto 0); -- comamnd that comes from memory
	alu_command : INOUT STD_LOGIC_VECTOR(7 downto 0); -- command that we will parse to ALU
	ram_command : INOUT STD_LOGIC; -- command that we will parse to RAM
	clk : IN STD_LOGIC
	
	);

end Control_Unit;

architecture Behavioral of Control_Unit is

begin

if clk= '1' and clk'event then
		-- ALU commands
		if command = "00000001" then 
			alu_command <=  "00000001"; --addition of input 
		elsif command = "00000010" then
			alu_command <=  "00000010"; -- substraction of input signals
		elsif command = "00000011" then
			alu_command <=  "00000011"; -- AND operation
		elsif command = "00000100" then
			alu_command <=  "00000100"; -- OR operation
		elsif command = "00000101" then
			alu_command <=  "00000101"; -- XOR operation
		elsif command = "00000110" then
			alu_command <=  "00000110"; -- NOT operation
		elsif command= "00000111" then
			alu_command <=  "00000111"; --shift right
		elsif command = "00001000" then 
			alu_command <=  "00001000"; --shift left
		
		-- RAM commands
		
		elsif command = "00001001" then
			ram_command <= "0"; -- read from ram
		elsif command = "00001010" then
			ram_command = "1"; -- write to ram
		
		
		end if; 

end if;

end Behavioral;

