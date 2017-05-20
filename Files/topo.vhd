library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity topo is
port (
	clock_50: in std_logic;
	SW: in std_logic_vector(9 downto 0);
	KEY: in std_logic_vector (3 downto 0);
	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5: out std_logic_vector(6 downto 0);
	LEDR : out std_logic_vector(9 downto 0)
);
end topo;

architecture topo_stru of topo is


--component


begin
	
	
end topo_stru; 