library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity topo_COUNTERS is
port (
	RST,EN_TIME,CLOCK_M,CLOCK_50,REG_OUT_31: in std_logic;
	SPEED: 											 in std_logic_vector(2 downto 0);
	CLK1,CLK2,CLK3,CLK4,CLK5:					 out std_logic;
	CNT_D,CNT_U:									 out std_logic_vector(9 downto 0);
	CNT_B:											 out std_logic_vector(4 downto 0)
);
end topo_COUNTERS;

architecture topo_stru of topo_COUNTERS is
signal CLK1_s: std_logic;

component FSM_Clock is
	port(
		clock_50: in std_logic;
		CLK1,CLK2,CLK3,CLK4,CLK5: out std_logic
	);
end component;

component CONTA_DES is
	port(
		EN_TIME,CLK1,RST: in std_logic;
		CNT_D: 				out std_logic_vector(9 downto 0)
	);
end component;

component CONTA_ASC is
	port(
		SPEED: in std_logic_vector(2 downto 0);
		CLOCK_M,RST,EN_TIME: in std_logic;
		CNT_U: out std_logic_vector(9 downto 0)
	);
end component;

component CONTA_BONUS is
	port(
		REG_OUT_31,CLOCK_M,RST,EN_TIME: in std_logic;
		CNT_B: 							  out std_logic_vector(4 downto 0)
	);
end component;

begin
	L0: FSM_Clock port map(CLOCK_50,CLK1_s,CLK2,CLK3,CLK4,CLK5);
	L1: CONTA_DES port map(EN_TIME,CLK1_s,RST,CNT_D);
	L2: CONTA_ASC port map(SPEED(2 downto 0),CLOCK_M,RST,EN_TIME,CNT_U);
	L3: CONTA_BONUS port map(REG_OUT_31,CLOCK_M,RST,EN_TIME,CNT_B);
	CLK1 <= CLK1_s;
end topo_stru; 