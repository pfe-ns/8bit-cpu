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
    Port ( alu_input_1 : in  STD_LOGIC_VECTOR (3 downto 0); -- first ALU input ( 4 bit)
           alu_input_2 : in STD_LOGIC_VECTOR (3 downto 0); -- second ALU input ( 4 bit)
           alu_output : out  STD_LOGIC_VECTOR (3 downto 0); -- output signal of ALU ( 4 bit)
           command : in STD_LOGIC_VECTOR (3 downto 0); -- one bit signal that tells us if ALU is busy or not
			  busy : inout STD_LOGIC_VECTOR (0 downto 0); -- clock input
			  clk : in STD_LOGIC 
			  );
end ALU;

architecture Behavioral of ALU is

begin

CALCULATE_RESULT : process(clk)
begin

if clk= '1' and clk'event then
	

		if command = "0001" then 
			busy <= "1";
			alu_output <= alu_input_1 + alu_input_2;-- addition of input 
			busy <= "0";
		elsif command = "0010" then
			busy <= "1";
			alu_output <= alu_input_1 - alu_input_2; -- substraction of input signals
			busy <= "0";
		elsif command = "0011" then
			busy <= "1";
			alu_output <= alu_input_1 and alu_input_2; -- AND operation
			busy <= "0";
		elsif command = "0100" then
			busy <= "1";
			alu_output <= alu_input_1 or alu_input_2; -- OR operation
			busy <= "0";
		elsif command = "0101" then
			busy <= "1";
			alu_output <= alu_input_1 xor alu_input_2; -- XOR operation
			busy <= "0";
		elsif command = "0110" then
			busy <= "1";
			alu_output <= not alu_input_1; -- NOT operation
			busy <= "0";
		elsif command = "0111" then 
			busy <= "1";
			alu_output <= alu_input_1 - alu_input_1; --shift right
			busy <= "0";
		elsif command = "1000" then 
			busy <= "1";
			alu_output <= alu_input_1 + alu_input_1; --shift left
			busy <= "0";
		
		end if; 

end if;
end process;

end Behavioral;

