library ieee;
use ieee.std_logic_1164.all;

entity map3 is
	port
	(
		F0, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15: out std_logic_vector(31 downto 0)
	);
end map3;	
	
architecture map3_struct of map3 is
begin
	F0 <=  "00111111111110011100000011000000";
	F1 <=  "00000000000000011100000011000000";
	F2 <=  "00000010000000011100000000000000";
	F3 <=  "00000000011100011100000011000000";
	F4 <=  "00000000000000011100000000000000";
	F5 <=  "00000010000000000000000011000000";
	F6 <=  "00000010000000011100000011000000";
	F7 <=  "00000010001100011100000011000000";
	F8 <=  "00000010000000011100000011000000";
	F9 <=  "00000010011000000000000011000000";
	F10 <= "00000010000000011100000011000000";
	F11 <= "00000000011000001000010011000000";
	F12 <= "00000000000000000000000000000000";
	F13 <= "00000111100000011100000011000000";
	F14 <= "00000000000000000000000000000000";
	F15 <= "00000001111111111000111100000000";
end map3_struct;