library ieee;
use ieee.std_logic_1164.all;

entity mux16x1 is
port( 
	a,b,c,d,e,f,g,h,
	i,j,k,l,m,n,o,p: in std_logic_vector (31 downto 0);
	s: 				  in std_logic_vector (3 downto 0);
	x: 				  out std_logic_vector(31 downto 0)
);
end mux16x1;

architecture mux of mux16x1 is
begin
x <= a when s = "0000" else
	  b when s = "0001" else
	  c when s = "0010" else
	  d when s = "0011" else
	  e when s = "0100" else
	  f when s = "0101" else
	  g when s = "0110" else
	  h when s = "0111" else
	  i when s = "1000" else
	  j when s = "1001" else
	  k when s = "1010" else
	  l when s = "1011" else
	  m when s = "1100" else
	  n when s = "1101" else
	  o when s = "1110" else
	  p;
end mux;