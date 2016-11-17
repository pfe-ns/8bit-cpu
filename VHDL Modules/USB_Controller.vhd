----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:48:18 11/17/2016 
-- Design Name: 
-- Module Name:    USB_Controller - Behavioral 
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

entity USB_Controller is

	Port(
			clk : IN STD_LOGIC; -- clock input
			rx : INOUT STD_LOGIC_VECTOR (7 downto 0); -- Byte that CPU will receive
			tx : INOUT STD_LOGIC_VECTOR (7 downto 0); -- Byte that CPU will output
			data : INOUT STD_LOGIC_VECTOR (7 downto 0); -- Data that is used to send or that has been received
			USB_command : IN STD_LOGIC_VECTOR (3 downto 0) -- 4bit command that tells CPU to send or to receive data
	);

end USB_Controller;

architecture Behavioral of USB_Controller is
begin

	USB_Process : process (clk)
	begin
	
		if clk = '1' and clk'event then
		
				if USB_command = "0001" then -- send data
					tx <= data;
				elsif USB_command = "0010" then -- receive data
					rx <= data;
			end if;
			
		end if;
	
	end process;

end Behavioral;

