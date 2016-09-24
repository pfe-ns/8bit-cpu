--1 bit ALU
-- Lazar Pajovic Djurovic 1-10

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is 

	port(
	
		command : in std_logic_vector (3 downto 0) -- komanda 
		a : in std_logic -- prvi ulaz
		b : in std_logic -- drugi ulaz
		res : out std_logic -- rezultat
		
	);

end entity ALU;

architecture Behavioral of ALU is 

	case command is
	
			when "0000" => res <= a xor b; -- res = a xor b
			when "0001" => res <= a or b; -- res = a or b
			when "0010" => res <= a nor b; -- res = a nor b
			when "0011" => res <= a and b; -- res = a and b
			when "0100" => res <= a nand b; -- res = a nand b
			when "0101" => res <= not a; -- res = not a
			when "0110" => res <= not b -- res = not b
	
	end case;

end architecture Behavioral;