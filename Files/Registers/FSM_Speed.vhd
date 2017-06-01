library ieee;
use ieee.std_logic_1164.all;

entity FSM_Speed is
port (
	EN_TIME,CLOCK_50,RST: in std_logic;
	X: 						 in std_logic_vector(1 downto 0);
	SPEED:					 out std_logic_vector(2 downto 0)
);
end FSM_Speed;

architecture bhv of FSM_Speed is
type STATES_E is (E0,E1,E2,E3,E4,E5);
signal CS,NS: STATES_E; --CS = current state, NS = next state.

begin
	--3 process FSM.
	P1: process(CLOCK_50, RST) --clock
	begin
		if RST = '1' then
			CS <= E0;
		elsif CLOCK_50'event and CLOCK_50 = '0' and EN_TIME = '1' then
			CS <= NS;
		end if;
	end process;

P2: process(CS,X) --state  
	begin
		case CS is
			when E0 =>
				if X = "10" then
					NS <= E1;
				else
					NS <= E0;
				end if;
				
			when E1 =>
				if X = "10" then
					NS <= E2;
				elsif X = "01" then
					NS <= E0;
				else
					NS <= E1;
				end if;
				
			when E2 =>
				if X = "10" then
					NS <= E3;
				elsif X = "01" then
					NS <= E1;
				else
					NS <= E2;
				end if;
			
			when E3 =>
				if X = "10" then
					NS <= E4;
				elsif X = "01" then
					NS <= E2;
				else
					NS <= E3;
				end if;
				
			when E4 =>
				if X = "10" then
					NS <= E5;
				elsif X = "01" then
					NS <= E3;
				else
					NS <= E4;
				end if;
			
			when E5 =>
				if X = "01" then
					NS <= E4;
				else
					NS <= E5;
				end if;
		end case;
	end process;

P3: process(CS) --output
	begin
		case CS is
			when E0 => 
				SPEED <= "000";
			when E1 =>
				SPEED <= "001";
			when E2 =>
				SPEED <= "010";
			when E3 =>
				SPEED <= "011";
			when E4 =>
				SPEED <= "100";
			when E5 =>
				SPEED <= "101";
		end case;
	end process;
end bhv;