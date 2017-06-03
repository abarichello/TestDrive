library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity topo_MAPS is
	port (
		MAP1_0,MAP1_1,MAP1_2,MAP1_3,MAP1_4,MAP1_5,MAP1_6,MAP1_7,MAP1_8,MAP1_9,MAP1_10,MAP1_11,MAP1_12,MAP1_13,MAP1_14,MAP1_15: out std_logic_vector(31 downto 0);
		MAP2_0,MAP2_1,MAP2_2,MAP2_3,MAP2_4,MAP2_5,MAP2_6,MAP2_7,MAP2_8,MAP2_9,MAP2_10,MAP2_11,MAP2_12,MAP2_13,MAP2_14,MAP2_15: out std_logic_vector(31 downto 0);
		MAP3_0,MAP3_1,MAP3_2,MAP3_3,MAP3_4,MAP3_5,MAP3_6,MAP3_7,MAP3_8,MAP3_9,MAP3_10,MAP3_11,MAP3_12,MAP3_13,MAP3_14,MAP3_15: out std_logic_vector(31 downto 0);
		MAP4_0,MAP4_1,MAP4_2,MAP4_3,MAP4_4,MAP4_5,MAP4_6,MAP4_7,MAP4_8,MAP4_9,MAP4_10,MAP4_11,MAP4_12,MAP4_13,MAP4_14,MAP4_15: out std_logic_vector(31 downto 0)
	);
end topo_MAPS;

architecture topo_map of topo_MAPS is

	component map1
	port
	(
		F0, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15: out std_logic_vector(31 downto 0)
	);
	end component;
	
	component map2
	port
	(
		F0, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15: out std_logic_vector(31 downto 0)
	);
	end component;
	
	component map3
	port
	(
		F0, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15: out std_logic_vector(31 downto 0)
	);
	end component;
	
	component map4
	port
	(
		F0, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15: out std_logic_vector(31 downto 0)
	);
	end component;


begin
	L0: map1 port map (MAP1_0,MAP1_1,MAP1_2,MAP1_3,MAP1_4,MAP1_5,MAP1_6,MAP1_7,MAP1_8,MAP1_9,MAP1_10,MAP1_11,MAP1_12,MAP1_13,MAP1_14,MAP1_15);
	L1: map2 port map (MAP2_0,MAP2_1,MAP2_2,MAP2_3,MAP2_4,MAP2_5,MAP2_6,MAP2_7,MAP2_8,MAP2_9,MAP2_10,MAP2_11,MAP2_12,MAP2_13,MAP2_14,MAP2_15);
	L2: map3 port map (MAP3_0,MAP3_1,MAP3_2,MAP3_3,MAP3_4,MAP3_5,MAP3_6,MAP3_7,MAP3_8,MAP3_9,MAP3_10,MAP3_11,MAP3_12,MAP3_13,MAP3_14,MAP3_15);
	L3: map4 port map (MAP4_0,MAP4_1,MAP4_2,MAP4_3,MAP4_4,MAP4_5,MAP4_6,MAP4_7,MAP4_8,MAP4_9,MAP4_10,MAP4_11,MAP4_12,MAP4_13,MAP4_14,MAP4_15);
	
end topo_map; 