library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity topo_REGISTERS is
port(
	SET_ROL, EN_TIME, BTN2, BTN3, CLOCK_M, CLOCK_50, RST: in std_logic;
	SW: in std_logic_vector(1 downto 0);
	REG_IN_0, REG_IN_1, REG_IN_2, REG_IN_3, REG_IN_4, REG_IN_5,
	REG_IN_6, REG_IN_7, REG_IN_8, REG_IN_9, REG_IN_10,REG_IN_11, 
	REG_IN_12, REG_IN_13, REG_IN_14, REG_IN_15: 
	in std_logic_vector(31 downto 0);
	
	SPEED: out std_logic_vector(2 downto 0);
	UP_DOWN: out std_logic_vector(3 downto 0);
	REG_OUT_0, REG_OUT_1, REG_OUT_2, REG_OUT_3, REG_OUT_4, REG_OUT_5,
	REG_OUT_6, REG_OUT_7, REG_OUT_8, REG_OUT_9, REG_OUT_10,
	REG_OUT_11, REG_OUT_12, REG_OUT_13, REG_OUT_14, 
	REG_OUT_15: out std_logic_vector(31 downto 0)
);
end topo_REGISTERS;

architecture topo of topo_REGISTERS is
signal signalspeed: std_logic_vector(2 downto 0);
signal signalX: std_logic_vector(1 downto 0);

component FSM_Position 
port(
	EN_TIME,CLOCK_M,RST: in std_logic;
	SPEED: 					in std_logic_vector(2 downto 0);
	SW:						in std_logic_vector(1 downto 0);
	UP_DOWN:					out std_logic_vector(3 downto 0)
);
end component;

component FSM_Speed 
port(
	EN_TIME,CLOCK_50,RST: in std_logic;
	X: 						 in std_logic_vector(1 downto 0);
	SPEED:					 out std_logic_vector(2 downto 0)
);
end component;

component REG_IN 
port( 
	SET_ROL,EN_TIME,CLOCK_M,RST: in std_logic;
	REG_IN: 							  in std_logic_vector(31 downto 0);
	SPEED: 							  in std_logic_vector(2 downto 0);
	REG_OUT_EXIT: 					  out std_logic_vector(31 downto 0)
);
end component;
	
begin 

signalX <= BTN3 & BTN2; 
SPEED <= signalspeed;
	 L0: FSM_Position port map (EN_TIME, CLOCK_M, RST, signalspeed, SW(1 downto 0), UP_DOWN);
	 L1: FSM_Speed port map (EN_TIME , CLOCK_50, RST, signalX, signalspeed);
	 L2: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_0, signalspeed, REG_OUT_0);
	 L3: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_1, signalspeed, REG_OUT_1);
	 L4: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_2, signalspeed, REG_OUT_2);
	 L5: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_3, signalspeed, REG_OUT_3);
	 L6: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_4, signalspeed, REG_OUT_4);
	 L7: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_5, signalspeed, REG_OUT_5);
	 L8: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_6, signalspeed, REG_OUT_6);
	 L9: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_7, signalspeed, REG_OUT_7);
	L10: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_8, signalspeed, REG_OUT_8);
	L11: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_9, signalspeed, REG_OUT_9);
	L12: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_10,signalspeed, REG_OUT_10);
	L13: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_11,signalspeed, REG_OUT_11);
	L14: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_12,signalspeed, REG_OUT_12);
	L15: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_13,signalspeed, REG_OUT_13);
	L16: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_14,signalspeed, REG_OUT_14);
	L17: REG_IN port map (SET_ROL, EN_TIME, CLOCK_M, RST, REG_IN_15,signalspeed, REG_OUT_15);
end topo;