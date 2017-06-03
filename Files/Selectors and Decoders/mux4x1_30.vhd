library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_30 is
generic (N: natural := 30);
port( 
	w,x,y,z: in std_logic_vector((N-1) downto 0);
	s: in std_logic_vector(1 downto 0);
	m: out std_logic_vector((N-1) downto 0)
);
end mux4x1_30;

architecture mux of mux4x1_30 is
begin
m <= w when s = "00" else
	x when s = "01" else
	y when s = "10" else
	z;
end mux;