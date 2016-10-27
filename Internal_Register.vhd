----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:15:50 10/19/2016 
-- Design Name: 
-- Module Name:    Register - Behavioral 
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

entity Internal_Register is

	port(
			
			clk : IN STD_LOGIC; -- clock input
			register_input : IN STD_LOGIC_VECTOR (7 downto 0); -- input data
			register_data : INOUT STD_LOGIC_VECTOR (7 downto 0); -- internal data
			register_output : OUT STD_LOGIC_VECTOR (7 downto 0); -- output data
			command : IN STD_LOGIC
			
	);

end Internal_Register;

architecture Behavioral of Internal_Register is
begin

REGISTER_PROCESS : process(clk)
begin

if clk= '1' and clk'event then

		if command = '1' then
			register_data <= register_input; -- reading from bus
		elsif command = '0' then
			register_output <= register_data; -- writing to bus
		
		end if;

end if;

end process;

end Behavioral;