library ieee;
use ieee.std_logic_1164.all;

entity FSM_Position is
port (
	EN_TIME,CLOCK_M,RST: in std_logic;
	SPEED: 					in std_logic_vector(2 downto 0);
	SW:		in std_logic_vector(1 downto 0);
	UP_DOWN:					out std_logic_vector(3 downto 0)
);
end FSM_Position;

architecture bhv of FSM_Position is
type STATES_E is (E0,E1,E2,E3,E4,E5,E6,E7,E8,E9,E10,E11,E12,E13,E14,E15);
signal CS,NS: STATES_E; --CS = current state, NS = next state.
signal enter: std_logic;

begin
enter <= ((SPEED(2) or SPEED(1) or SPEED(0)) and EN_TIME);
	--3 process FSM.
	P1: process(CLOCK_M, RST) --clock
	begin
		if RST = '1' then
			CS <= E7;
		elsif CLOCK_M'event and CLOCK_M = '0' and enter = '1' then
			CS <= NS;
		end if;
	end process;

P2: process(CS,SW) --state
	begin
		case CS is
			when E0 =>
				if SW = "01" then
					NS <= E1;
				else
					NS <= E0;
				end if;
				
			when E1 =>
				if SW = "01" then
					NS <= E2;
				elsif SW = "10" then
					NS <= E0;
				else
					NS <= E1;
				end if;
				
			when E2 =>
				if SW = "01" then
					NS <= E3;
				elsif SW = "10" then
					NS <= E1;
				else
					NS <= E2;
				end if;
			
			when E3 =>
				if SW = "01" then
					NS <= E4;
				elsif SW = "10" then
					NS <= E2;
				else
					NS <= E3;
				end if;
				
			when E4 =>
				if SW = "01" then
					NS <= E5;
				elsif SW = "10" then
					NS <= E3;
				else
					NS <= E4;
				end if;
			
			when E5 =>
				if SW = "01" then
						NS <= E6;
					elsif SW = "10" then
						NS <= E4;
					else
						NS <= E5;
					end if;
					
			when E6 =>
				if SW = "01" then
					NS <= E7;
				elsif SW = "10" then
					NS <= E5;
				else
					NS <= E6;
				end if;
				
			when E7 =>
				if SW = "01" then
					NS <= E8;
				elsif SW = "10" then
					NS <= E6;
				else
					NS <= E7;
				end if;
				
			when E8 =>
				if SW = "01" then
					NS <= E9;
				elsif SW = "10" then
					NS <= E7;
				else
					NS <= E8;
				end if;
				
			when E9 =>
				if SW = "01" then
					NS <= E10;
				elsif SW = "10" then
					NS <= E8;
				else
					NS <= E9;
				end if;
				
			when E10 =>
				if SW = "01" then
					NS <= E11;
				elsif SW = "10" then
					NS <= E9;
				else
					NS <= E10;
				end if;
				
			when E11 =>
				if SW = "01" then
					NS <= E12;
				elsif SW = "10" then
					NS <= E10;
				else
					NS <= E11;
				end if;
				
			when E12 =>
				if SW = "01" then
					NS <= E13;
				elsif SW = "10" then
					NS <= E11;
				else
					NS <= E12;
				end if;
				
			when E13 =>
				if SW = "01" then
					NS <= E14;
				elsif SW = "10" then
					NS <= E12;
				else
					NS <= E13;
				end if;
				
			when E14 =>
				if SW = "01" then
					NS <= E15;
				elsif SW = "10" then
					NS <= E13;
				else
					NS <= E14;
				end if;
				
			when E15 =>
				if SW = "10" then
					NS <= E14;
				else
					NS <= E15;
				end if;
				
		end case;
	end process;

P3: process(CS) --output
	begin
		case CS is
			when E0 => 
				UP_DOWN <= "0000";
			when E1 =>
				UP_DOWN <= "0001";
			when E2 =>
				UP_DOWN <= "0010";
			when E3 =>
				UP_DOWN <= "0011";
			when E4 =>
				UP_DOWN <= "0100";			
			when E5 =>
				UP_DOWN <= "0101";
			when E6 =>
				UP_DOWN <= "0110";			
			when E7 =>
				UP_DOWN <= "0111";			
			when E8 =>
				UP_DOWN <= "1000";
			when E9 =>
				UP_DOWN <= "1001";			
			when E10 =>
				UP_DOWN <= "1010";			
			when E11 =>
				UP_DOWN <= "1011";			
			when E12 =>
				UP_DOWN <= "1100";			
			when E13 =>
				UP_DOWN <= "1101";			
			when E14 =>
				UP_DOWN <= "1110";			
			when E15 =>
				UP_DOWN <= "1111";			
		end case;
	end process;
end bhv;