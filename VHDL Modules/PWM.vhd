----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:28:36 01/30/2017 
-- Design Name: 
-- Module Name:    PWM - Behavioral 
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

entity PWM is

	Port(
		
		clk : IN STD_LOGIC;
		pwm_output : OUT STD_LOGIC ;
		pwm_input : STD_LOGIC_VECTOR ( 7 downto 0)
		
	);

end PWM;

architecture Behavioral of PWM is

signal counter : STD_LOGIC_VECTOR ( 7 downto 0);

begin

	Count_Process : process (clk)
	begin
	
	if rising_edge( clk ) then
			
			if to_integer(unsigned(counter)) > to_integer(unsigned(pwm_input)) then
				pwm_output <= '1';
			else 
				pwm_output <= '0';
			end if;
				
		if to_integer(unsigned(counter)) < 255 then
				counter <= counter+1;
		else
				counter <= "00000000";
		end if;
		

	end if;
		--pwm_output <= '1' when to_integer(unsigned(counter)) > to_integer(unsigned(pwm_input)) else '0';
	
	end process;
	

end Behavioral;

