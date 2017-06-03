library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity topo_SELECTORS is
port (
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
	REG_OUT_11, REG_OUT_12, REG_OUT_13, REG_OUT_14,REG_OUT_15: in std_logic_vector(31 downto 0)
	
	SEL_DISP: 						in std_logic_vector(1 downto 0);
	SEL_LED: 						in std_logic;
	SPEED: 							in std_logic_vector(2 downto 0);
	UP_DOWN: 						in std_logic_vector(3 downto 0);
	CNT_B: 							in std_logic_vector(4 downto 0);
	CLK1,CLK2,CLK3,CLK4,CLK5:  in std_logic_vector(4 downto 0);
	CLOCK_M: 						out std_logic;
	LED_OUT: 						out std_logic_vector(9 downto 0);
	H: 								out std_logic_vector(41 downto 0);
	REG_OUT: 						out std_logic_vector(31 downto 0)
);
end topo_SELECTORS;

architecture topo of topo_SELECTORS is
signal signalspeed: std_logic_vector(2 downto 0);
signal signalX: std_logic_vector(1 downto 0);

component mux2x1 
generic (N: natural := 30);
port( 
	w,x: in std_logic_vector((N-1) downto 0);
	s: in std_logic;
	m: out std_logic_vector((N-1) downto 0)
);
end component;

component mux4x1_32 
generic (N: natural := 32);
port( 
	w,x,y,z: in std_logic_vector((N-1) downto 0);
	s: in std_logic_vector(1 downto 0);
	m: out std_logic_vector((N-1) downto 0)
);
end component;

component mux4x1_30
generic (N: natural := 30);
port( 
	w,x,y,z: in std_logic_vector((N-1) downto 0);
	s: in std_logic_vector(1 downto 0);
	m: out std_logic_vector((N-1) downto 0)
);
end component;

component mux8x1
port( 
	a,b,c,d,e,f,g,h: in std_logic;
	s: 				  in std_logic_vector (2 downto 0);
	m: 				  out std_logic
);
end component;

component mux16x1
port( 
	a,b,c,d,e,f,g,h,
	i,j,k,l,m,n,o,p: in std_logic_vector (31 downto 0);
	s: 				  in std_logic_vector (3 downto 0);
	x: 				  out std_logic_vector(31 downto 0)
);
end component;

component Decod7seg
port( 
	C:  in std_logic_vector(4 downto 0);
	F:  out std_logic_vector(6 downto 0)
);
end component;
	
begin --todo
	 L0: mux2x1 port map ();
	 L1: mux2x1 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_32 port map ();
	 L1: mux4x1_30 port map ();
	 L1: mux8x1 port map ();
	 L1: mux16x1 port map ();
	 L1: Decod7seg port map ();
end topo; 