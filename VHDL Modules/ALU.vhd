----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:15:04 09/28/2016 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( alu_input_1 : IN  STD_LOGIC_VECTOR (7 downto 0); -- first ALU input ( 8 bit)
           alu_input_2 : IN STD_LOGIC_VECTOR (7 downto 0); -- second ALU input ( 8 bit)
           alu_output : OUT  STD_LOGIC_VECTOR (7 downto 0); -- output signal of ALU ( 8 bit)
           alu_command : IN STD_LOGIC_VECTOR (7 downto 0); -- command for ALU
			  busy : INOUT STD_LOGIC; -- one bit signal that tells us if ALU is busy or not
			  clk : IN STD_LOGIC -- clock input
			  );
end ALU;

architecture Behavioral of ALU is

begin

CALCULATE_RESULT : process(clk)
begin

if clk = '1' and clk'event then
	

		if alu_command = "00000001" then 
			busy <= '1';
			alu_output <= alu_input_1 + alu_input_2;-- addition of input 
			busy <= '0';
		elsif alu_command = "00000010" then
			busy <= '1';
			alu_output <= alu_input_1 - alu_input_2; -- substraction of input signals
			busy <= '0';
		elsif alu_command = "00000011" then
			busy <= '1';
			alu_output <= alu_input_1 and alu_input_2; -- AND operation
			busy <= '0';
		elsif alu_command = "00000100" then
			busy <= '1';
			alu_output <= alu_input_1 or alu_input_2; -- OR operation
			busy <= '0';
		elsif alu_command = "00000101" then
			busy <= '1';
			alu_output <= alu_input_1 xor alu_input_2; -- XOR operation
			busy <= '0';
		elsif alu_command = "00000110" then
			busy <= '1';
			alu_output <= not alu_input_1; -- NOT operation
			busy <= '0';
		elsif alu_command = "00000111" then 
			busy <= '1';
			alu_output <= alu_input_1 - alu_input_1; --shift right
			busy <= '0';
		elsif alu_command = "00001000" then 
			busy <= '1';
			alu_output <= alu_input_1 + alu_input_1; --shift left
			busy <= '0';
		
		end if; 

end if;
end process;

end Behavioral;

