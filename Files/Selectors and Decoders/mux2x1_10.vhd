library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_10 is
generic (N: natural := 10);
port( 
	w: in std_logic_vector((N-1) downto 0);
	x: in std_logic_vector((N-1) downto 0);
	s: in std_logic;
	m: out std_logic_vector((N-1) downto 0)
);
end mux2x1_10;

architecture mux of mux2x1_10 is
begin
m <= w when s = '0' else
	x;
end mux;