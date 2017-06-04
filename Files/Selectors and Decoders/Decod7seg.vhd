library IEEE;
use IEEE.Std_Logic_1164.all;

entity Decod7seg is
port (
	C:  in std_logic_vector(6 downto 0);
	F:  out std_logic_vector(6 downto 0)
);
end Decod7seg;

architecture decod_bhv of Decod7seg is
begin 
  F <= 	"1000000" 	when 	C = "00000" else   --0
  	"1111001" 	when 	C = "00001" else    
 	"0100100" 	when 	C = "00010" else    
	"0110000" 	when 	C = "00011" else   
	"0011001" 	when 	C = "00100" else
	"0010010" 	when 	C = "00101" else   
	"0000010" 	when 	C = "00110" else    
	"1111000" 	when 	C = "00111" else   
	"0000000" 	when 	C = "01000" else   
	"0010000" 	when 	C = "01001" else
 	"0001000" 	when 	C = "01010" else    
	"0000011" 	when 	C = "01011" else   
	"1000110" 	when 	C = "01100" else
	"0100001" 	when 	C = "01101" else   
	"0000110" 	when 	C = "01110" else    
	"0001110"   when  C = "01111" else --F
	"0101011"   when  C = "10000" else --M
	"0001100"   when  C = "10001" else --P
	"0000111"   when  C = "10010" else --T
   "1111111"; --EMPTY
  --GFEDCBA
end decod_bhv;