----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:04:30 10/27/2016 
-- Design Name: 
-- Module Name:    Program_Counter - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_Counter is

	port(
	
		clk : IN STD_LOGIC; -- clock input
		pc_input : IN STD_LOGIC_VECTOR (7 downto 0); -- we use this if we want to jump specified address
		pc_output : OUT STD_LOGIC_VECTOR (7 downto 0); -- counter output
		pc_internal_state : INOUT STD_LOGIC_VECTOR (7 downto 0); -- internal state
		pc_command : IN STD_LOGIC_VECTOR (3 downto 0)
	
	);

end Program_Counter;

architecture Behavioral of Program_Counter is
begin


COUNT_PROCESS : process(clk)
begin

if clk= '1' and clk'event then
	
	if pc_command = "0001" then -- count
		pc_internal_state <= pc_internal_state + "00000001";
	elsif pc_command = "0010" then -- load Program_counter;
		pc_internal_state <= pc_input;
	elsif pc_command = "0011" then -- reset
		pc_internal_state <= "00000000";
		pc_output <= "00000000";
	end if;
		
	
end if;

end process;

end Behavioral;

