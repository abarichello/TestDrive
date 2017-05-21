library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity COMPARATORS is
	port (
		CNT_U,CNT_D: in std_logic_vector(9 downto 0);
		CNT_B: 		 in std_logic_vector(4 downto 0);
		END_BONUS,END_TIME,TARGET: out std_logic;
		POINT: out std_logic
	);
end COMPARATORS;

architecture topo_COMPARATORS of COMPARATORS is
	
	--signal

	component Comparators1
	port (
		CNT_D:    in std_logic_vector(9 downto 0);
		END_TIME: out std_logic
		);
	end component;
	
	component Comparators2
	port (
		CNT_U:  in std_logic_vector(9 downto 0);
		TARGET: out std_logic
	);
	end component;
	
	component Comparators3
	port (
		CNT_B:     in std_logic_vector(4 downto 0);
		END_BONUS: out std_logic
	);
	end component;
	
	component Adder
	
	end component;


begin
	--L0:
	--L1:
	--L2:
	--L3:
	
	
end topo_COMPARATORS; 