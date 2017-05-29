library ieee;
use ieee.std_logic_1164.all;

entity map1 is
	port
	(
		F0, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15: out std_logic_vector(31 downto 0)
	);
end map1;	
	
architecture map1_struct of map1 is
begin
	F0 <=  "00000000001000000000110000000000";
	F1 <=  "00000000000000011000110000011000";
	F2 <=  "00111111000000111100000000011000";
	F3 <=  "00000000010000000000001100000000";
	F4 <=  "00000000000000001000001100000000";
	F5 <=  "00000000000110011000001100001110";
	F6 <=  "00000000000110111000000000001110";
	F7 <=  "00000011000000111000000000000010";
	F8 <=  "00000011000000111000110000000110";
	F9 <=  "00000000000000111000110000000110";
	F10 <= "00000000000010011000000000110000";
	F11 <= "00000000011000001000000000110000";
	F12 <= "00000000011000000000110000000000";
	F13 <= "00000010000000000000110011000000";
	F14 <= "00000000010000000000000011011000";
	F15 <= "00000000000010000000000000011000";
end map1_struct;