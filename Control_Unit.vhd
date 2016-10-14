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
	
	command : IN std_logic_vector(4 downto 0); -- comamnd that comes from memory
	alu_command : INOUT std_logic_vector(4 downto 0); -- command that we will parse to ALU
	ram_command : INOUT std_logic; -- command that we will parse to RAM
	clk : IN std_logic
	
	);

end Control_Unit;

architecture Behavioral of Control_Unit is

begin

if clk = '1' then
		-- ALU commands
		if command = "0001" then 
			alu_command <=  "0001"; --addition of input 
		elsif command = "0010" then
			alu_command <=  "0010"; -- substraction of input signals
		elsif command = "0011" then
			alu_command <=  "0011"; -- AND operation
		elsif command = "0100" then
			alu_command <=  "0100"; -- OR operation
		elsif command = "0101" then
			alu_command <=  "0101"; -- XOR operation
		elsif command = "0110" then
			alu_command <=  "0110"; -- NOT operation
		elsif command= "0111" then
			alu_command <=  "0111"; --shift right
		elsif command = "1000" then 
			alu_command <=  "1000"; --shift left
		
		-- RAM commands
		
		elsif command = "1001" then
			ram_command <= "0"; -- read from ram
		elsif command = "1010" then
			ram_command = "1"; -- write to ram
		
		
		end if; 

end if;

end Behavioral;

