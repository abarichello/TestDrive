library ieee;
use ieee.std_logic_1164.all;

entity FSM_Control is
port (
	BTN0,BTN1,TARGET,END_TIME,END_BONUS,CLOCK_50: in std_logic;
	SEL_LED,SET_ROL,EN_TIME,RST: out std_logic;
	STATES: out std_logic_vector(4 downto 0);
	SEL_DISP: out std_logic_vector(1 downto 0)
);
end FSM_Control;

architecture bhv of FSM_Control is
type STATES_E is (E0,E1,E2,E3);
signal CS,NS: STATES_E; --CS = current state, NS = next state.
signal reset,enter: std_logic;

begin
	reset <= BTN0;
	enter <= BTN1;
	
	--3 process FSM.
	P1: process(clock_50, reset) --clock
	begin
		if reset = '0' then
			CS <= E0;
		elsif clock_50'event and clock_50 = '0' then
			CS <= NS;
		end if;
	end process;

P2: process(CS, Enter) --state
	begin
		case CS is
			when E0 =>
				if Enter = '1' then 
					NS <= E0;		
				else 
					NS <= E1;
				end if;
				
			when E1 =>
				if Enter = '1' then 
					NS <= E1;
				else 
					NS <= E2;
				end if;
				
			when E2 =>
				if TARGET = '1' or End_TIME = '1' or End_BONUS = '1' then
					NS <= E3;
				else
					NS <= E2;
				end if;
			
			when E3 =>
				if Enter = '1' then
					NS <= E3;
				else
					NS <= E0;
				end if;
		end case;
	end process;

P3: process(CS) --outputs
	begin
		case CS is
			when E0 => 
				STATES <= "00000";
				SEL_LED <= '1';
				SEL_DISP <= "10";
				SET_ROL <= '0';
				EN_TIME <= '0';
				RST <= '1';
			when E1 =>
				STATES <= "00001";
				SEL_LED <= '1';
				SEL_DISP <= "01";
				SET_ROL <= '1';
				EN_TIME <= '0';
				RST <= '0';
			when E2 =>
				STATES <= "00010";
				SEL_LED <= '0';
				SEL_DISP <= "00";
				SET_ROL <= '0';
				EN_TIME <= '1';
				RST <= '0';
			when E3 =>
				STATES <= "00011";
				SEL_LED <= '1';
				SEL_DISP <= "11";
				SET_ROL <= '0';
				EN_TIME <= '0';
				RST <= '0';
		end case;
	end process;
end bhv;