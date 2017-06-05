library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity topo is
port (
	clock_50: 							 in std_logic;
	SW: 									 in std_logic_vector(9 downto 0);
	KEY: 									 in std_logic_vector (3 downto 0);
	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5: out std_logic_vector(6 downto 0);
	LEDR : 								 out std_logic_vector(9 downto 0)
);
end topo;

architecture topo_stru of topo is

component topo_REGISTERS 
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
end component; 

component topo_COUNTERS
port(
	RST,EN_TIME,CLOCK_M,CLOCK_50,REG_OUT_31: in std_logic;
	SPEED: 											 in std_logic_vector(2 downto 0);
	CLK1,CLK2,CLK3,CLK4,CLK5:					 out std_logic;
	CNT_D,CNT_U:									 out std_logic_vector(9 downto 0);
	CNT_B:											 out std_logic_vector(4 downto 0)
);
end component;

component topo_COMPARATORS
port(
	CNT_U,CNT_D: in std_logic_vector(9 downto 0);
	CNT_B: 		 in std_logic_vector(4 downto 0);
	END_BONUS,END_TIME,TARGET: out std_logic;
	POINT: out std_logic_vector(9 downto 0)
);
end component;

component topo_MAPS
port(
	MAP1_0,MAP1_1,MAP1_2,MAP1_3,MAP1_4,MAP1_5,MAP1_6,MAP1_7,MAP1_8,MAP1_9,MAP1_10,MAP1_11,MAP1_12,MAP1_13,MAP1_14,MAP1_15: out std_logic_vector(31 downto 0);
	MAP2_0,MAP2_1,MAP2_2,MAP2_3,MAP2_4,MAP2_5,MAP2_6,MAP2_7,MAP2_8,MAP2_9,MAP2_10,MAP2_11,MAP2_12,MAP2_13,MAP2_14,MAP2_15: out std_logic_vector(31 downto 0);
	MAP3_0,MAP3_1,MAP3_2,MAP3_3,MAP3_4,MAP3_5,MAP3_6,MAP3_7,MAP3_8,MAP3_9,MAP3_10,MAP3_11,MAP3_12,MAP3_13,MAP3_14,MAP3_15: out std_logic_vector(31 downto 0);
	MAP4_0,MAP4_1,MAP4_2,MAP4_3,MAP4_4,MAP4_5,MAP4_6,MAP4_7,MAP4_8,MAP4_9,MAP4_10,MAP4_11,MAP4_12,MAP4_13,MAP4_14,MAP4_15: out std_logic_vector(31 downto 0)
);
end component;

component FSM_Control
port(
	BTN0,BTN1,TARGET,END_TIME,END_BONUS,CLOCK_50: in std_logic;
	SEL_LED,SET_ROL,EN_TIME,RST: out std_logic;
	STATES: out std_logic_vector(4 downto 0);
	SEL_DISP: out std_logic_vector(1 downto 0)
);
end component;

component topo_SELECTORS
port(
	SW:								in std_logic_vector(9 downto 7);
	--map1
	MAP1_0,MAP1_1,MAP1_2,MAP1_3,MAP1_4,MAP1_5,MAP1_6,
	MAP1_7,MAP1_8,MAP1_9,MAP1_10,MAP1_11,MAP1_12,
	MAP1_13,MAP1_14,MAP1_15: in std_logic_vector(31 downto 0);
	
	--map2
	MAP2_0,MAP2_1,MAP2_2,MAP2_3,MAP2_4,MAP2_5,MAP2_6,
	MAP2_7,MAP2_8,MAP2_9,MAP2_10,MAP2_11,MAP2_12,
	MAP2_13,MAP2_14,MAP2_15: in std_logic_vector(31 downto 0);
	
	--map3
	MAP3_0,MAP3_1,MAP3_2,MAP3_3,MAP3_4,MAP3_5,MAP3_6,
	MAP3_7,MAP3_8,MAP3_9,MAP3_10,MAP3_11,MAP3_12,
	MAP3_13,MAP3_14,MAP3_15: in std_logic_vector(31 downto 0);
	
	--map4
	MAP4_0,MAP4_1,MAP4_2,MAP4_3,MAP4_4,MAP4_5,MAP4_6,
	MAP4_7,MAP4_8,MAP4_9,MAP4_10,MAP4_11,MAP4_12,
	MAP4_13,MAP4_14,MAP4_15: in std_logic_vector(31 downto 0);
	
	CNT_D,CNT_U,POINT: 			in std_logic_vector(9 downto 0);
	
	--reg outs
	REG_OUT_0, REG_OUT_1, REG_OUT_2, REG_OUT_3, REG_OUT_4, REG_OUT_5,
	REG_OUT_6, REG_OUT_7, REG_OUT_8, REG_OUT_9, REG_OUT_10,
	REG_OUT_11, REG_OUT_12, REG_OUT_13, REG_OUT_14,REG_OUT_15: in std_logic_vector(31 downto 0);
	
	SEL_DISP: 						in std_logic_vector(1 downto 0);
	SEL_LED: 						in std_logic;
	SPEED: 							in std_logic_vector(2 downto 0);
	UP_DOWN: 						in std_logic_vector(3 downto 0);
	CNT_B,STATES:     			in std_logic_vector(4 downto 0);
	CLk1,clk2,clk3,clk4,clk5:   in std_logic;
	CLOCK_M: 						out std_logic;
	LED_OUT: 						out std_logic_vector(9 downto 0);
	H: 								out std_logic_vector(41 downto 0);
	REG_IN_0,REG_IN_1,REG_IN_2,REG_IN_3,REG_IN_4,REG_IN_5,REG_IN_6,
	REG_IN_7,REG_IN_8,REG_IN_9,REG_IN_10,REG_IN_11,REG_IN_12,
	REG_IN_13,REG_IN_14,REG_IN_15: out std_logic_vector(31 downto 0);
	REG_OUT_EXIT: 					out std_logic_vector(31 downto 0);
	REG_OUT_31:						out std_logic
);
end component;

component ButtonSync
port(
		-- Input ports
		key0	: in  std_logic;
		key1	: in  std_logic;
		key2	: in  std_logic;
		key3	: in  std_logic;	
		clk : in std_logic;
		-- Output ports
		btn0	: out std_logic;
		btn1	: out std_logic;
		btn2	: out std_logic;
		btn3	: out std_logic
);
end component;

component Decod7seg
port(
	C:  in std_logic_vector(6 downto 0);
	F:  out std_logic_vector(6 downto 0)
);
end component;

signal sSETROL,sENTIME,sCLOCKM,sSELLED,CLK5,CLK4,CLK3,CLK2,CLK1,
sBTN0,sBTN1,sBTN2,sBTN3,sENDTIME,sTARGET,sENDBONUS,sRST,sREGOUT31: std_logic;
signal sSPEED: std_logic_vector(2 downto 0);
signal sUPDOWN: std_logic_vector(3 downto 0);
signal sCNTB, sSTATES: std_logic_vector(4 downto 0);
signal sCNTD, sCNTU, sLEDOUT,sPOINT: std_logic_vector(9 downto 0);
signal sSELDISP: std_logic_vector(1 downto 0);
signal sH: std_logic_vector(41 downto 0);
signal MAP1_0,MAP1_1,MAP1_2,MAP1_3,MAP1_4,MAP1_5,MAP1_6,MAP1_7,MAP1_8,MAP1_9,MAP1_10,MAP1_11,MAP1_12,MAP1_13,MAP1_14,MAP1_15,
MAP2_0,MAP2_1,MAP2_2,MAP2_3,MAP2_4,MAP2_5,MAP2_6,MAP2_7,MAP2_8,MAP2_9,MAP2_10,MAP2_11,MAP2_12,MAP2_13,MAP2_14,MAP2_15,
MAP3_0,MAP3_1,MAP3_2,MAP3_3,MAP3_4,MAP3_5,MAP3_6,MAP3_7,MAP3_8,MAP3_9,MAP3_10,MAP3_11,MAP3_12,MAP3_13,MAP3_14,MAP3_15,
MAP4_0,MAP4_1,MAP4_2,MAP4_3,MAP4_4,MAP4_5,MAP4_6,MAP4_7,MAP4_8,MAP4_9,MAP4_10,MAP4_11,MAP4_12,MAP4_13,MAP4_14,MAP4_15,
sREG_OUT_0, sREG_OUT_1, sREG_OUT_2, sREG_OUT_3, sREG_OUT_4, sREG_OUT_5,
sREG_OUT_6, sREG_OUT_7, sREG_OUT_8, sREG_OUT_9, sREG_OUT_10,
sREG_OUT_11, sREG_OUT_12, sREG_OUT_13, sREG_OUT_14,sREG_OUT_15,
sREGOUT,
sREG_IN_0, sREG_IN_1, sREG_IN_2, sREG_IN_3, sREG_IN_4, sREG_IN_5,
sREG_IN_6, sREG_IN_7, sREG_IN_8, sREG_IN_9, sREG_IN_10,
sREG_IN_11, sREG_IN_12, sREG_IN_13, sREG_IN_14,sREG_IN_15
:std_logic_vector(31 downto 0);

begin

	L0:
		topo_REGISTERS port map ( 
			sSETROL, sENTIME, sBTN2, sBTN3, sCLOCKM, CLOCK_50,sRST,
			SW(1 downto 0),
			sREG_IN_0, sREG_IN_1, sREG_IN_2, sREG_IN_3, sREG_IN_4, sREG_IN_5,
			sREG_IN_6, sREG_IN_7, sREG_IN_8, sREG_IN_9, sREG_IN_10,
			sREG_IN_11, sREG_IN_12, sREG_IN_13, sREG_IN_14,sREG_IN_15,
			sSPEED, sUPDOWN,
			sREG_OUT_0, sREG_OUT_1, sREG_OUT_2, sREG_OUT_3, sREG_OUT_4, sREG_OUT_5,
			sREG_OUT_6, sREG_OUT_7, sREG_OUT_8, sREG_OUT_9, sREG_OUT_10,
			sREG_OUT_11, sREG_OUT_12, sREG_OUT_13, sREG_OUT_14,sREG_OUT_15
		);		

	L1: 
		topo_COUNTERS port map ( --clock problem
			sRST,sENTIME,sCLOCKM, CLOCK_50, sREGOUT31,
			sSPEED,
			CLK1, CLK2, CLK3, CLK4, CLK5,
			sCNTD, sCNTU, sCNTB
		);
	
	L2: 
		topo_COMPARATORS port map (
			sCNTU, sCNTD, sCNTB,
			sENDBONUS, sENDTIME, sTARGET,
			sPOINT
		);

	L3: 
		topo_MAPS port map (
			MAP1_0,MAP1_1,MAP1_2,MAP1_3,MAP1_4,MAP1_5,MAP1_6,MAP1_7,MAP1_8,MAP1_9,MAP1_10,MAP1_11,MAP1_12,MAP1_13,MAP1_14,MAP1_15,
			MAP2_0,MAP2_1,MAP2_2,MAP2_3,MAP2_4,MAP2_5,MAP2_6,MAP2_7,MAP2_8,MAP2_9,MAP2_10,MAP2_11,MAP2_12,MAP2_13,MAP2_14,MAP2_15,
			MAP3_0,MAP3_1,MAP3_2,MAP3_3,MAP3_4,MAP3_5,MAP3_6,MAP3_7,MAP3_8,MAP3_9,MAP3_10,MAP3_11,MAP3_12,MAP3_13,MAP3_14,MAP3_15,
			MAP4_0,MAP4_1,MAP4_2,MAP4_3,MAP4_4,MAP4_5,MAP4_6,MAP4_7,MAP4_8,MAP4_9,MAP4_10,MAP4_11,MAP4_12,MAP4_13,MAP4_14,MAP4_15
		);
		
	L4: 
		FSM_Control port map (
			sBTN0, sBTN1, sTARGET, sENDTIME, sENDBONUS, CLOCK_50,
			sSELLED, sSETROL, sENTIME,
			sRST, sSTATES, sSELDISP
		);
	
	L5:
		topo_SELECTORS port map (
			SW(9 downto 7),
			MAP1_0,MAP1_1,MAP1_2,MAP1_3,MAP1_4,MAP1_5,MAP1_6,MAP1_7,MAP1_8,MAP1_9,MAP1_10,MAP1_11,MAP1_12,MAP1_13,MAP1_14,MAP1_15, --map1 (x16)
			MAP2_0,MAP2_1,MAP2_2,MAP2_3,MAP2_4,MAP2_5,MAP2_6,MAP2_7,MAP2_8,MAP2_9,MAP2_10,MAP2_11,MAP2_12,MAP2_13,MAP2_14,MAP2_15, --map2 (x16)
			MAP3_0,MAP3_1,MAP3_2,MAP3_3,MAP3_4,MAP3_5,MAP3_6,MAP3_7,MAP3_8,MAP3_9,MAP3_10,MAP3_11,MAP3_12,MAP3_13,MAP3_14,MAP3_15, --map3 (x16)
			MAP4_0,MAP4_1,MAP4_2,MAP4_3,MAP4_4,MAP4_5,MAP4_6,MAP4_7,MAP4_8,MAP4_9,MAP4_10,MAP4_11,MAP4_12,MAP4_13,MAP4_14,MAP4_15, --map4 (x16)
			sCNTD, sCNTU, sPOINT,
			sREG_OUT_0, sREG_OUT_1, sREG_OUT_2, sREG_OUT_3, sREG_OUT_4, sREG_OUT_5,
			sREG_OUT_6, sREG_OUT_7, sREG_OUT_8, sREG_OUT_9, sREG_OUT_10,
			sREG_OUT_11, sREG_OUT_12, sREG_OUT_13, sREG_OUT_14,sREG_OUT_15,
			
			sSELDISP, sSELLED, sSPEED, sUPDOWN, sCNTB, sSTATES, CLK1,Clk2,Clk3,CLk4,CLK5,
			sCLOCKM, sLEDOUT, sH,
			sREG_IN_0, sREG_IN_1, sREG_IN_2, sREG_IN_3, sREG_IN_4, sREG_IN_5,
			sREG_IN_6, sREG_IN_7, sREG_IN_8, sREG_IN_9, sREG_IN_10,
			sREG_IN_11, sREG_IN_12, sREG_IN_13, sREG_IN_14,sREG_IN_15, --reg ins x16
			sREGOUT, --reg out exit (32 bits) 
			sREGOUT31
		);	
		
	L6: 
		ButtonSync port map (
			KEY(0),KEY(1),KEY(2),KEY(3),CLOCK_50,
			sBTN0,sBTN1,sBTN2,sBTN3
		);
		
	HEX5 <= sH(41 downto 35);
	
	HEX4 <= sH(34 downto 28);
		
	HEX3 <= sH(27 downto 21);
		
	HEX2 <= sH(20 downto 14);
		
	HEX1 <= sH(13 downto 7);
		
	HEX0 <= sH(6 downto 0);
		
	LEDR <= sLEDOUT;
		

end topo_stru; 