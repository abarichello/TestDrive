library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
generic (N: natural := 30);
port( 
	w,x: in std_logic_vector((N-1) downto 0);
	s: in std_logic;
	m: out std_logic_vector((N-1) downto 0)
);
end mux2x1;

architecture mux of mux2x1 is
begin
m <= w when s = '0' else
	x;
end mux;