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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( alu_input_1 : in  STD_LOGIC_VECTOR (3 downto 0);
           alu_input_2 : in  STD_LOGIC_VECTOR (3 downto 0);
           alu_output : out  STD_LOGIC_VECTOR (3 downto 0);
           command : in  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

begin

CALCULATE_RESULT : process(clk)
begin

if clk = "1" then
		if command = "0001" then -- sabiranje ulaznih podataka
			alu_output <= std_logic_vector(unsigned(alu_input_1) + unsigned(alu_input_2));
		elsif command = "0010" then 
			alu_output <= std_logic_vector(unsigned(alu_input_1) - unsigned(alu_input_2)); -- oduzimanje podataka 
		elsif command = "0011" then --- mnozenje pomocu sabiranja
		
			I:= 0;
			result := 0;
			while I < unsigned(alu_input_1)  loop
				
				result:= result + unsigned(alu_input_2);
				
			end loop;
			
			alu_output <= result;
			
		elsif	command = "0100" then -- deljenje pomocu oduzimanja
		
			I:= 0;
			result := alu_input_1;
			while I < unsigned(alu_input_1)  loop
				
				result:= result - unsigned(alu_input_2);
				
			end loop;
			
			alu_output <= result;
			
		elsif command = "0101" then -- invertuje signal alu_input_1
			
			alu_output <= -alu_input_1;
		
		end if; 

end if;

end process;

end Behavioral;

