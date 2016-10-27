----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:57:11 10/13/2016 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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

entity RAM is

	port(
	
		clk : IN STD_LOGIC;
		ram_data_in : IN STD_LOGIC_VECTOR (7 downto 0); -- input data
		ram_data_out : OUT STD_LOGIC_VECTOR (7 downto 0); -- output data
		ram_address : IN STD_LOGIC_VECTOR (7 downto 0); -- address of data
		ram_command : IN STD_LOGIC;
		
	); 

end RAM;

architecture Behavioral of RAM is

	type Memory_Array is array (255 downto 0) of std_logic_vector (7 downto 0);
	variable RAM : Memory_Array;
	
begin

RAM_PROCESS : process(clk)
begin

if clk= '1' and clk'event then

	if ram_command = '0' then-- read
	
		ram_data_out <= RAM(ram_address); -- ram_data_out = RAM[address]
	
	end if;

	if ram_command = '1' then-- read
	
		RAM(ram_address) := ram_data_in; -- RAM[address] = ram_data_in
	
	end if;

end if;

end process;

end Behavioral;

