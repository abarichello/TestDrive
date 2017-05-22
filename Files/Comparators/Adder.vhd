library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Adder is
	port (
		CNT_U:     in std_logic_vector(9 downto 0);
		CNT_B:		  in std_logic_vector(4 downto 0);
		POINT:     out std_logic_vector(9 downto 0)
	);
end Adder;

architecture add of Adder is

signal A: std_logic_vector(9 downto 0);

begin

A <= "0000" & CNT_B & '0';
POINT <= A + CNT_U;

end add; 